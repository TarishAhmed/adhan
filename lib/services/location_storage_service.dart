import 'package:shared_preferences/shared_preferences.dart';

class LocationStorageService {
  static const String _latKey = 'stored_lat';
  static const String _lngKey = 'stored_lng';
  static const String _timezoneKey = 'stored_timezone';
  static const String _cityKey = 'stored_city';

  /// Store location data
  static Future<void> storeLocation({
    required double lat,
    required double lng,
    required String timezone,
    String? city,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_latKey, lat.toString());
    await prefs.setString(_lngKey, lng.toString());
    await prefs.setString(_timezoneKey, timezone);
    if (city != null) {
      await prefs.setString(_cityKey, city);
    }
  }

  /// Get stored location data
  static Future<Map<String, String>?> getStoredLocation() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final lat = prefs.getString(_latKey);
      final lng = prefs.getString(_lngKey);
      final timezone = prefs.getString(_timezoneKey);
      final city = prefs.getString(_cityKey);

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
  static Future<bool> hasStoredLocation() async {
    final location = await getStoredLocation();
    return location != null;
  }

  /// Clear stored location
  static Future<void> clearStoredLocation() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_latKey);
      await prefs.remove(_lngKey);
      await prefs.remove(_timezoneKey);
      await prefs.remove(_cityKey);
    } catch (e) {
      print('LocationStorageService: Error clearing stored location: $e');
    }
  }

  /// Update location if it has changed
  static Future<bool> updateLocationIfChanged({
    required double lat,
    required double lng,
    required String timezone,
    String? city,
  }) async {
    try {
      final currentLocation = await getStoredLocation();
      if (currentLocation == null) {
        await storeLocation(lat: lat, lng: lng, timezone: timezone, city: city);
        return true;
      }

      final currentLat = double.tryParse(currentLocation['lat'] ?? '');
      final currentLng = double.tryParse(currentLocation['lng'] ?? '');

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
