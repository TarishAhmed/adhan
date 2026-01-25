import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:adhan_app/services/background_prayer_service.dart';
import 'package:adhan_app/services/location_storage_service.dart';

part 'background_service_provider.g.dart';

@riverpod
class BackgroundServiceNotifier extends _$BackgroundServiceNotifier {
  @override
  Future<void> build() async {
    // Initialize background service
    await BackgroundPrayerService.initialize();
  }

  /// Start background service
  Future<void> startBackgroundService() async {
    try {
      await BackgroundPrayerService.scheduleBackgroundTasks();
      print('Background service started successfully');
    } catch (e) {
      print('Error starting background service: $e');
    }
  }

  /// Stop background service
  Future<void> stopBackgroundService() async {
    try {
      await BackgroundPrayerService.cancelAllTasks();
      print('Background service stopped successfully');
    } catch (e) {
      print('Error stopping background service: $e');
    }
  }

  /// Check if background service is running
  Future<bool> isBackgroundServiceRunning() async {
    // This is a simplified check
    // In a real app, you might want to store the state in shared preferences
    return true; // Placeholder
  }

  /// Manually trigger prayer timing fetch
  Future<void> manuallyFetchPrayerTimings(ProviderContainer container) async {
    try {
      await BackgroundPrayerService.checkAndFetchPrayerTimings(container);
      print('Manual prayer timing fetch completed');
    } catch (e) {
      print('Error in manual prayer timing fetch: $e');
    }
  }

  /// Get background service status
  Future<Map<String, dynamic>> getBackgroundServiceStatus() async {
    try {
      final hasLocation = ref.read(locationStorageProvider.notifier).hasStoredLocation();
      final location = ref.read(locationStorageProvider);

      return {
        'has_location': hasLocation,
        'location': location,
        'service_running': await isBackgroundServiceRunning(),
      };
    } catch (e) {
      print('Error getting background service status: $e');
      return {};
    }
  }
}
