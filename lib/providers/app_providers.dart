import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:adhan_app/services/location_storage_service.dart';
import 'package:adhan_app/services/reschedule_service.dart';
import 'package:adhan_app/services/home_widget_service.dart';

part 'app_providers.g.dart';

// App theme provider
final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);

// App settings provider
final settingsProvider = NotifierProvider<SettingsNotifier, AppSettings>(
  SettingsNotifier.new,
);

// Location provider (handles permissions and gets current position)
final locationProvider =
    FutureProvider<({double lat, double lng, String? city, String timezone})>((
      ref,
    ) async {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied.');
      }
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.reduced,
      );

      String? city;
      if (!kIsWeb) {
        final places = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        city = places.isNotEmpty ? places.first.locality : null;
      }

      final timezone = await FlutterTimezone.getLocalTimezone();

      // Store location for background service
      await LocationStorageService.storeLocation(
        lat: position.latitude,
        lng: position.longitude,
        timezone: timezone,
        city: city,
      );

      return (
        lat: position.latitude,
        lng: position.longitude,
        city: city,
        timezone: timezone,
      );
    });

// Provider that listens to location changes and updates home widget
final locationChangeListenerProvider = Provider<void>((ref) {
  ref.listen(locationProvider, (previous, next) {
    next.whenData((location) {
      // Update home widget when location changes
      HomeWidgetService.updateNextPrayerWidget();
    });
  });
});

// App settings model
class AppSettings {
  final bool notificationsEnabled;
  final String language;
  final String calculationMethod;
  final bool autoLocation;

  const AppSettings({
    this.notificationsEnabled = true,
    this.language = 'en',
    this.calculationMethod = 'MWL',
    this.autoLocation = true,
  });

  AppSettings copyWith({
    bool? notificationsEnabled,
    String? language,
    String? calculationMethod,
    bool? autoLocation,
  }) {
    return AppSettings(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      language: language ?? this.language,
      calculationMethod: calculationMethod ?? this.calculationMethod,
      autoLocation: autoLocation ?? this.autoLocation,
    );
  }
}

// Settings notifier
class SettingsNotifier extends Notifier<AppSettings> {
  void toggleNotifications() {
    state = state.copyWith(notificationsEnabled: !state.notificationsEnabled);
  }

  void setLanguage(String language) {
    state = state.copyWith(language: language);
  }

  void setCalculationMethod(String method) {
    state = state.copyWith(calculationMethod: method);
    // Mark for reschedule when calculation method changes
    // Avoid direct service coupling by using RescheduleService
    RescheduleService.markNeedsReschedule();
    RescheduleService.enqueueImmediateReschedule();
  }

  void toggleAutoLocation() {
    state = state.copyWith(autoLocation: !state.autoLocation);
    RescheduleService.markNeedsReschedule();
    RescheduleService.enqueueImmediateReschedule();
  }

  @override
  AppSettings build() {
    return AppSettings();
  }
}

// Note: We import RescheduleService directly in this provider to keep logic simple

@riverpod
FutureOr<String> getTimezone(Ref ref) async =>
    await FlutterTimezone.getLocalTimezone();

class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.system;

  void setTheme(ThemeMode mode) => state = mode;
}
