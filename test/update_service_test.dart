import 'package:flutter_test/flutter_test.dart';
import 'package:adhan_app/services/update_service.dart';

// Mock version comparison function for testing
bool mockIsVersionHigher(String newVersion, String currentVersion) {
  if (newVersion.isEmpty || currentVersion.isEmpty) return false;

  final newParts = newVersion.split('.');
  final currentParts = currentVersion.split('.');

  // Ensure both versions have at least 3 parts (major.minor.patch)
  while (newParts.length < 3) newParts.add('0');
  while (currentParts.length < 3) currentParts.add('0');

  for (int i = 0; i < 3; i++) {
    final newPart = int.tryParse(newParts[i]) ?? 0;
    final currentPart = int.tryParse(currentParts[i]) ?? 0;

    if (newPart > currentPart) return true;
    if (newPart < currentPart) return false;
  }

  return false;
}

void main() {
  group('UpdateService Tests', () {
    test('should correctly compare versions', () {
      // Test major version comparison
      expect(mockIsVersionHigher('2.0.0', '1.0.0'), true);
      expect(mockIsVersionHigher('1.0.0', '2.0.0'), false);

      // Test minor version comparison
      expect(mockIsVersionHigher('1.1.0', '1.0.0'), true);
      expect(mockIsVersionHigher('1.0.0', '1.1.0'), false);

      // Test patch version comparison
      expect(mockIsVersionHigher('1.0.1', '1.0.0'), true);
      expect(mockIsVersionHigher('1.0.0', '1.0.1'), false);

      // Test same version
      expect(mockIsVersionHigher('1.0.0', '1.0.0'), false);

      // Test with build numbers
      expect(mockIsVersionHigher('1.0.0', '1.0.0+1'), false);
      expect(mockIsVersionHigher('1.0.0+2', '1.0.0+1'), false);
    });

    test('should handle empty or invalid versions', () {
      expect(mockIsVersionHigher('', '1.0.0'), false);
      expect(mockIsVersionHigher('1.0.0', ''), false);
      expect(mockIsVersionHigher('', ''), false);
    });

    test('should handle incomplete version strings', () {
      // Should handle versions with missing parts
      expect(mockIsVersionHigher('1.1', '1.0.0'), true);
      expect(mockIsVersionHigher('1.0.0', '1.1'), false);
      expect(mockIsVersionHigher('1', '1.0.0'), false);
    });
  });
}
