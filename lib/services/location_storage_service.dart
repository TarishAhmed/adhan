import 'package:adhan_app/utils/location_format_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adhan_app/services/reschedule_service.dart';

final sharedPrefProvider = FutureProvider<SharedPreferences>((ref) async {
  final pref = await SharedPreferences.getInstance();
  return pref;
});

class LocationStorageService extends Notifier<Map<String, String>?> {
  static const String _latKey = 'stored_lat';
  static const String _lngKey = 'stored_lng';
  static const String _timezoneKey = 'stored_timezone';
  static const String _cityKey = 'stored_city';

  @override
  Map<String, String>? build() {
    return _getStoredLocation();
  }

  /// Store location data
  Future<void> storeLocation({
    required double lat,
    required double lng,
    required String timezone,
    String? city,
  }) async {
    final pref = ref.read(sharedPrefProvider).value;
    if (pref == null) throw Exception('SharedPreferences not initialized');
    await pref.setString(_latKey, formatLatitude(lat));
    await pref.setString(_lngKey, formatLongitude(lng));
    await pref.setString(_timezoneKey, timezone);
    if (city != null) {
      await pref.setString(_cityKey, city);
    }
    
    state = {
      'lat': formatLatitude(lat),
      'lng': formatLongitude(lng),
      'timezone': timezone,
      if (city != null) 'city': city,
    };
    
    // Mark for reschedule after location change
    await RescheduleService.markNeedsReschedule();
    await RescheduleService.enqueueImmediateReschedule();
  }

  /// Get stored location data
  Map<String, String>? _getStoredLocation() {
    try {
      final pref = ref.read(sharedPrefProvider).value;
      if( pref == null) throw Exception('SharedPreferences not initialized');
      final lat = pref.getString(_latKey);
      final lng = pref.getString(_lngKey);
      final timezone = pref.getString(_timezoneKey);
      final city = pref.getString(_cityKey);

      if (lat != null && lng != null && timezone != null) {
        return {
          'lat': lat,
          'lng': lng,
          'timezone': timezone,
          if (city != null) 'city': city,
        };
      }
      return null;
    } catch (e) {
      print('LocationStorageService: Error getting stored location: $e');
      return null;
    }
  }

  /// Check if location is stored
  bool hasStoredLocation() {
    return state != null;
  }

  /// Clear stored location
  Future<void> clearStoredLocation() async {
    try {
      final pref = ref.read(sharedPrefProvider).value;
      if (pref == null) throw Exception('SharedPreferences not initialized');
      await pref.remove(_latKey);
      await pref.remove(_lngKey);
      await pref.remove(_timezoneKey);
      await pref.remove(_cityKey);
      state = null;
    } catch (e) {
      print('LocationStorageService: Error clearing stored location: $e');
    }
  }

  /// Update location if it has changed
  Future<bool> updateLocationIfChanged({
    required double lat,
    required double lng,
    required String timezone,
    String? city,
  }) async {
    try {
      if (state == null) {
        await storeLocation(lat: lat, lng: lng, timezone: timezone, city: city);
        return true;
      }

      final currentLat = double.tryParse(state!['lat'] ?? '');
      final currentLng = double.tryParse(state!['lng'] ?? '');

      // Check if location has changed significantly (more than 1km)
      if (currentLat != null && currentLng != null) {
        final latDiff = (lat - currentLat).abs();
        final lngDiff = (lng - currentLng).abs();

        // Rough conversion: 0.01 degrees ≈ 1.1 km
        if (latDiff > 0.01 || lngDiff > 0.01) {
          await storeLocation(
            lat: lat,
            lng: lng,
            timezone: timezone,
            city: city,
          );
          return true;
        }
      }

      return false;
    } catch (e) {
      print('LocationStorageService: Error updating location: $e');
      return false;
    }
  }
}

final locationStorageProvider = NotifierProvider<LocationStorageService, Map<String, String>?>(
  () => LocationStorageService(),
);
