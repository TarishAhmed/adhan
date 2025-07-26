import 'package:flutter_test/flutter_test.dart';
import 'package:adhan_app/services/qibla_service.dart';

void main() {
  group('QiblaService Tests', () {
    test('should calculate correct qibla direction for known locations', () {
      // Test case 1: New York City (40.7128° N, 74.0060° W)
      double nycLat = 40.7128;
      double nycLng = -74.0060;
      double expectedQiblaNYC = 58.5; // Approximate qibla direction from NYC
      double actualQiblaNYC = QiblaService.calculateQiblaDirection(
        nycLat,
        nycLng,
      );

      expect((actualQiblaNYC - expectedQiblaNYC).abs(), lessThan(5.0));

      // Test case 2: London (51.5074° N, 0.1278° W)
      double londonLat = 51.5074;
      double londonLng = -0.1278;
      double expectedQiblaLondon =
          118.0; // Approximate qibla direction from London
      double actualQiblaLondon = QiblaService.calculateQiblaDirection(
        londonLat,
        londonLng,
      );

      expect((actualQiblaLondon - expectedQiblaLondon).abs(), lessThan(5.0));

      // Test case 3: Tokyo (35.6762° N, 139.6503° E)
      double tokyoLat = 35.6762;
      double tokyoLng = 139.6503;
      double expectedQiblaTokyo =
          293.0; // Approximate qibla direction from Tokyo
      double actualQiblaTokyo = QiblaService.calculateQiblaDirection(
        tokyoLat,
        tokyoLng,
      );

      expect((actualQiblaTokyo - expectedQiblaTokyo).abs(), lessThan(5.0));
    });

    test('should calculate correct distance to Kaaba', () {
      // Test case: New York City to Kaaba
      double nycLat = 40.7128;
      double nycLng = -74.0060;
      double expectedDistance = 10000; // Approximate distance in km
      double actualDistance = QiblaService.calculateDistanceToKaaba(
        nycLat,
        nycLng,
      );

      expect((actualDistance - expectedDistance).abs(), lessThan(1000.0));
    });

    test('should validate coordinates correctly', () {
      expect(QiblaService.isValidCoordinates(0, 0), isTrue);
      expect(QiblaService.isValidCoordinates(90, 180), isTrue);
      expect(QiblaService.isValidCoordinates(-90, -180), isTrue);
      expect(QiblaService.isValidCoordinates(91, 0), isFalse);
      expect(QiblaService.isValidCoordinates(0, 181), isFalse);
      expect(QiblaService.isValidCoordinates(-91, 0), isFalse);
      expect(QiblaService.isValidCoordinates(0, -181), isFalse);
    });

    test('should calculate compass angle correctly', () {
      // Test case: compass pointing north (0°), qibla direction east (90°)
      double compassHeading = 0.0;
      double qiblaDirection = 90.0;
      double expectedAngle = 90.0;
      double actualAngle = QiblaService.calculateCompassAngle(
        compassHeading,
        qiblaDirection,
      );

      expect(actualAngle, equals(expectedAngle));

      // Test case: compass pointing east (90°), qibla direction north (0°)
      compassHeading = 90.0;
      qiblaDirection = 0.0;
      expectedAngle = -90.0;
      actualAngle = QiblaService.calculateCompassAngle(
        compassHeading,
        qiblaDirection,
      );

      expect(actualAngle, equals(expectedAngle));
    });

    test('should get correct direction names', () {
      expect(QiblaService.getDirectionName(0), equals('North'));
      expect(QiblaService.getDirectionName(45), equals('Northeast'));
      expect(QiblaService.getDirectionName(90), equals('East'));
      expect(QiblaService.getDirectionName(135), equals('Southeast'));
      expect(QiblaService.getDirectionName(180), equals('South'));
      expect(QiblaService.getDirectionName(225), equals('Southwest'));
      expect(QiblaService.getDirectionName(270), equals('West'));
      expect(QiblaService.getDirectionName(315), equals('Northwest'));
    });

    test('should get correct compass accuracy levels', () {
      expect(QiblaService.getCompassAccuracyLevel(3), equals('Excellent'));
      expect(QiblaService.getCompassAccuracyLevel(8), equals('Good'));
      expect(QiblaService.getCompassAccuracyLevel(15), equals('Fair'));
      expect(QiblaService.getCompassAccuracyLevel(25), equals('Poor'));
      expect(QiblaService.getCompassAccuracyLevel(null), equals('Unknown'));
    });
  });
}
