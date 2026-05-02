import 'package:adhan_app/utils/app_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:adhan_app/services/background_prayer_service.dart';
import 'package:adhan_app/services/location_storage_service.dart';

part 'background_service_provider.g.dart';

const _logName = 'adhan.backgroundService';

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
      AppLogger.i('Background service started successfully', name: _logName);
    } catch (e, st) {
      AppLogger.e(
        'Error starting background service',
        name: _logName,
        error: e,
        stackTrace: st,
      );
    }
  }

  /// Stop background service
  Future<void> stopBackgroundService() async {
    try {
      await BackgroundPrayerService.cancelAllTasks();
      AppLogger.i('Background service stopped successfully', name: _logName);
    } catch (e, st) {
      AppLogger.e(
        'Error stopping background service',
        name: _logName,
        error: e,
        stackTrace: st,
      );
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
      AppLogger.i('Manual prayer timing fetch completed', name: _logName);
    } catch (e, st) {
      AppLogger.e(
        'Error in manual prayer timing fetch',
        name: _logName,
        error: e,
        stackTrace: st,
      );
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
    } catch (e, st) {
      AppLogger.e(
        'Error getting background service status',
        name: _logName,
        error: e,
        stackTrace: st,
      );
      return {};
    }
  }
}
