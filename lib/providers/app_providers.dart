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
typedef LocationRecord = ({double lat, double lng, String? city, String timezone});

class LocationNotifier extends AsyncNotifier<LocationRecord> {
  @override
  Future<LocationRecord> build() async {
    // 1. Check cache immediately
    final lastLocation = ref.read(locationStorageProvider);
    
    if (lastLocation != null) {
      // If we have cached data, we return it so the UI shows it immediately.
      // We then trigger a background refresh to get the latest GPS.
      return _parseCache(lastLocation);
    }

    // 2. No cache? Perform the full fetch (UI will show loading)
    return await _fetchGPSAndGeocode();
  }

  /// The "Public" way to refresh while keeping old data.
  /// Calling invalidateSelf() triggers build() again, but Riverpod 
  /// keeps the current data in the state until the new Future completes.
  void refreshLocation() => ref.invalidateSelf();

  /// Internal: Just the GPS/API logic
  Future<LocationRecord> _fetchGPSAndGeocode() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw Exception('Location services are disabled.');

    if (ref.read(locationPermissionProvider) == LocationPermission.denied) {
      await ref.read(locationPermissionProvider.notifier).checkAndRequestPermission();
      if (ref.read(locationPermissionProvider) == LocationPermission.denied) throw Exception('Permissions denied');
    }

    final position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: const Duration(seconds: 10),
        ),
      );

    String? city;
    if (!kIsWeb) {
      final places = await placemarkFromCoordinates(position.latitude, position.longitude);
      city = places.isNotEmpty ? places.first.locality : null;
    }

    final timezone = await FlutterTimezone.getLocalTimezone();
    final result = (lat: position.latitude, lng: position.longitude, city: city, timezone: timezone);

    // Save to cache
    await ref.read(locationStorageProvider.notifier).storeLocation(
      lat: result.lat,
      lng: result.lng,
      timezone: result.timezone,
      city: result.city,
    );

    return result;
  }

  LocationRecord _parseCache(Map<String, String> map) {
    return (
      lat: double.parse(map['lat']!),
      lng: double.parse(map['lng']!),
      city: map['city'],
      timezone: map['timezone']!,
    );
  }
}

// Manual Provider Definition
final locationProvider = AsyncNotifierProvider<LocationNotifier, LocationRecord>(() {
  return LocationNotifier();
});

// Provider that listens to location changes and updates home widget
final locationChangeListenerProvider = Provider<void>((ref) {
  ref.listen(locationProvider, (previous, next) {
    next.whenData((location) {
      // Update home widget when location changes
      HomeWidgetService.updateNextPrayerWidget(ref.container);
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

final locationPermissionProvider = NotifierProvider<LocationPermissionNotifier, LocationPermission>(
  LocationPermissionNotifier.new,
);


class LocationPermissionNotifier extends Notifier<LocationPermission> {
  @override
  LocationPermission build() {
    return LocationPermission.denied;
  }

  Future<void> checkAndRequestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    state = permission;
    
  }
}
