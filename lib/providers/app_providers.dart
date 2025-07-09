import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_providers.g.dart';

// App theme provider
final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(ThemeNotifier.new);

// App settings provider
final settingsProvider =
    NotifierProvider<SettingsNotifier, AppSettings>(SettingsNotifier.new);

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

      return (
        lat: position.latitude,
        lng: position.longitude,
        city: city,
        timezone: timezone,
      );
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
  }

  void toggleAutoLocation() {
    state = state.copyWith(autoLocation: !state.autoLocation);
  }
  
  @override
  AppSettings build() {
    return AppSettings();
  }
}

@riverpod
FutureOr<String> getTimezone(Ref ref) async =>
    await FlutterTimezone.getLocalTimezone();


class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.system;

  void setTheme(ThemeMode mode) => state = mode;
}