import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_compass/flutter_compass.dart';

class QiblaService {
  // Kaaba coordinates (21.4225° N, 39.8262° E)
  static const double kaabaLatitude = 21.4225;
  static const double kaabaLongitude = 39.8262;

  /// Calculate the qibla direction from current location to Kaaba
  static double calculateQiblaDirection(double currentLat, double currentLng) {
    // Convert degrees to radians
    double lat1 = currentLat * pi / 180;
    double lat2 = kaabaLatitude * pi / 180;
    double lng1 = currentLng * pi / 180;
    double lng2 = kaabaLongitude * pi / 180;

    // Calculate the bearing using the formula
    double y = sin(lng2 - lng1) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(lng2 - lng1);
    double bearing = atan2(y, x);

    // Convert to degrees and normalize to 0-360
    double bearingDegrees = bearing * 180 / pi;
    bearingDegrees = (bearingDegrees + 360) % 360;

    return bearingDegrees;
  }

  /// Get current location
  static Future<Position?> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return null;
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }

      // Get current position
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );
    } catch (e) {
      return null;
    }
  }

  /// Calculate the angle between compass heading and qibla direction
  static double calculateCompassAngle(
    double compassHeading,
    double qiblaDirection,
  ) {
    double angle = qiblaDirection - compassHeading;

    // Normalize to -180 to 180 degrees
    if (angle > 180) {
      angle -= 360;
    } else if (angle < -180) {
      angle += 360;
    }

    return angle;
  }

  /// Get distance to Kaaba in kilometers
  static double calculateDistanceToKaaba(double currentLat, double currentLng) {
    return Geolocator.distanceBetween(
          currentLat,
          currentLng,
          kaabaLatitude,
          kaabaLongitude,
        ) /
        1000; // Convert to kilometers
  }

  /// Check if compass is available
  static Future<bool> isCompassAvailable() async {
    try {
      final compass = FlutterCompass.events;
      return compass != null;
    } catch (e) {
      return false;
    }
  }

  /// Get compass accuracy level
  static String getCompassAccuracyLevel(double? accuracy) {
    if (accuracy == null) return 'Unknown';
    if (accuracy < 5) return 'Excellent';
    if (accuracy < 10) return 'Good';
    if (accuracy < 20) return 'Fair';
    return 'Poor';
  }

  /// Validate coordinates
  static bool isValidCoordinates(double lat, double lng) {
    return lat >= -90 && lat <= 90 && lng >= -180 && lng <= 180;
  }

  /// Get direction name from degrees
  static String getDirectionName(double degrees) {
    if (degrees >= 337.5 || degrees < 22.5) return 'North';
    if (degrees >= 22.5 && degrees < 67.5) return 'Northeast';
    if (degrees >= 67.5 && degrees < 112.5) return 'East';
    if (degrees >= 112.5 && degrees < 157.5) return 'Southeast';
    if (degrees >= 157.5 && degrees < 202.5) return 'South';
    if (degrees >= 202.5 && degrees < 247.5) return 'Southwest';
    if (degrees >= 247.5 && degrees < 292.5) return 'West';
    if (degrees >= 292.5 && degrees < 337.5) return 'Northwest';
    return 'North';
  }
}
