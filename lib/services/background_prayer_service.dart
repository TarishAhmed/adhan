import 'dart:developer' show log;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workmanager/workmanager.dart';
import 'package:adhan_app/services/prayer_data_manager.dart';
import 'package:adhan_app/services/location_storage_service.dart';
import 'package:adhan_app/services/daily_notification_scheduler.dart';
import 'package:adhan_app/api/api_helper.dart';
import 'package:adhan_app/model/prayer_timing_month_response_model.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:adhan_app/services/reschedule_service.dart';
import 'package:adhan_app/services/home_widget_service.dart';

class BackgroundPrayerService {
  static const String _fetchNextMonthTask = 'fetchNextMonthPrayerTimings';
  static const String _checkAndFetchTask = 'checkAndFetchPrayerTimings';
  static const String _cleanupAndMetricsTask = 'cleanupAndMetricsTask';
  static const String _planNextDayTask = 'planNextDayNotifications';
  static const String _updateWidgetTask = 'updateHomeWidget';

  /// Initialize the background service
  @pragma('vm:entry-point')
  static Future<void> initialize() async {
    await Workmanager().initialize(callbackDispatcher);
    tzdata.initializeTimeZones();
  }

  /// Schedule background tasks
  static Future<void> scheduleBackgroundTasks(ProviderContainer container) async {
    // Schedule daily check for prayer timings
    await Workmanager().registerPeriodicTask(
      _checkAndFetchTask,
      _checkAndFetchTask,
      existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
      frequency: const Duration(days: 1),
      constraints: Constraints(
        networkType: NetworkType.connected,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresDeviceIdle: false,
        requiresStorageNotLow: false,
      ),
    );

    // Schedule periodic cleanup/metrics (weekly)
    await Workmanager().registerPeriodicTask(
      _cleanupAndMetricsTask,
      _cleanupAndMetricsTask,
      existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
      frequency: const Duration(days: 7),
      constraints: Constraints(
        networkType: NetworkType.connected,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresDeviceIdle: false,
        requiresStorageNotLow: false,
      ),
    );

    // Schedule midnight planning for next-day notifications
    await scheduleMidnightPlanningTask(container);

    // Schedule next month fetch on last day of current month
    await _scheduleNextMonthFetch();

    // Schedule periodic home widget updates (every 15 minutes)
    await _scheduleWidgetUpdates();
  }

  /// Schedule fetching next month's prayer timings
  static Future<void> _scheduleNextMonthFetch() async {
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;

    // Schedule for the last day of the current month
    final scheduleDay = daysInMonth;
    final scheduleDate = DateTime(
      now.year,
      now.month,
      scheduleDay,
      2,
      0,
    ); // 2 AM

    // If we're past the schedule date this month, schedule for next month
    final nextMonthDays = DateTime(now.year, now.month + 2, 0).day;
    final targetDate = scheduleDate.isBefore(now)
        ? DateTime(now.year, now.month + 1, nextMonthDays, 2, 0)
        : scheduleDate;

    final delay = targetDate.difference(now);

    if (delay.isNegative) {
      // If the delay is negative, schedule for next month
      final nextMonthDate = DateTime(
        now.year,
        now.month + 1,
        nextMonthDays,
        2,
        0,
      );
      final nextMonthDelay = nextMonthDate.difference(now);

      await Workmanager().registerOneOffTask(
        _fetchNextMonthTask,
        _fetchNextMonthTask,
        existingWorkPolicy: ExistingWorkPolicy.replace,
        initialDelay: nextMonthDelay,
        constraints: Constraints(
          networkType: NetworkType.connected,
          requiresBatteryNotLow: false,
          requiresCharging: false,
          requiresDeviceIdle: false,
          requiresStorageNotLow: false,
        ),
      );
    } else {
      await Workmanager().registerOneOffTask(
        _fetchNextMonthTask,
        _fetchNextMonthTask,
        existingWorkPolicy: ExistingWorkPolicy.replace,
        initialDelay: delay,
        constraints: Constraints(
          networkType: NetworkType.connected,
          requiresBatteryNotLow: false,
          requiresCharging: false,
          requiresDeviceIdle: false,
          requiresStorageNotLow: false,
        ),
      );
    }
  }

  /// Schedule a one-off task at the next local midnight to plan next-day notifications
  static Future<void> scheduleMidnightPlanningTask(ProviderContainer container) async {
    final now = DateTime.now();
    final nextMidnight = DateTime(now.year, now.month, now.day + 1, 0, 0);
    final initialDelay = nextMidnight.difference(now);

    await Workmanager().registerOneOffTask(
      _planNextDayTask,
      _planNextDayTask,
      existingWorkPolicy: ExistingWorkPolicy.replace,
      initialDelay: initialDelay,
      constraints: Constraints(
        // Use connected to satisfy plugin requirement; planning is light
        networkType: NetworkType.connected,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresDeviceIdle: false,
        requiresStorageNotLow: false,
      ),
    );
  }

  /// Schedule periodic home widget updates (every 15 minutes)
  static Future<void> _scheduleWidgetUpdates() async {
    final now = DateTime.now();
    final nextUpdateTime = DateTime(
      now.year,
      now.month,
      now.day,
      now.hour,
      now.minute + 15,
    );
    final initialDelay = nextUpdateTime.difference(now);

    await Workmanager().registerPeriodicTask(
      _updateWidgetTask,
      _updateWidgetTask,
      existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
      frequency: const Duration(minutes: 15),
      constraints: Constraints(
        networkType: NetworkType.connected,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresDeviceIdle: false,
        requiresStorageNotLow: false,
      ),
    );
  }

  /// Call on app start (and can be triggered on boot via native receiver) to ensure
  /// all work and notifications are re-scheduled after reboot/app update.
  static Future<void> rescheduleAfterBootOrAppStart(ProviderContainer container) async {
    try {
      // Re-register periodic background tasks with KEEP policy
      await scheduleBackgroundTasks(container);

      // Immediately schedule today's remaining notifications (idempotent)
      await DailyNotificationScheduler.scheduleDailyNotifications(container);

      // Clear reschedule flag if set
      await RescheduleService.clearNeedsReschedule();
    } catch (e) {
      print('Background service: reschedule after boot/app start failed: $e');
    }
  }

  /// Check if we need to fetch prayer timings and fetch if necessary
  static Future<void> checkAndFetchPrayerTimings(ProviderContainer container) async {
    try {
      // Self-heal: if any component flagged reschedule, perform it and clear flag
      if (await RescheduleService.getNeedsReschedule()) {
        print('Background service: Self-heal reschedule in daily check');
        await BackgroundPrayerService.rescheduleAfterBootOrAppStart(container);
        await RescheduleService.clearNeedsReschedule();
      }

      // Get current location (you might need to store this in shared preferences)
      final location = await _getStoredLocation(container);
      if (location == null) {
        print('Background service: No location available');
        return;
      }

      final now = DateTime.now();
      final currentMonth = now.month;
      final currentYear = now.year;

      // Check if we have data for current month
      final hasCurrentMonthData = await PrayerDataManager.hasDataForMonth(
        year: currentYear,
        month: currentMonth,
        lat: location['lat']!,
        lng: location['lng']!,
      );

      // Check if we have data for next month
      final nextMonth = currentMonth == 12 ? 1 : currentMonth + 1;
      final nextYear = currentMonth == 12 ? currentYear + 1 : currentYear;

      final hasNextMonthData = await PrayerDataManager.hasDataForMonth(
        year: nextYear,
        month: nextMonth,
        lat: location['lat']!,
        lng: location['lng']!,
      );

      // Fetch current month if missing
      if (!hasCurrentMonthData) {
        print('Background service: Fetching current month data');
        await _fetchAndStorePrayerTimings(currentYear, currentMonth, location, container);
      }

      // Fetch next month if missing
      if (!hasNextMonthData) {
        print('Background service: Fetching next month data');
        await _fetchAndStorePrayerTimings(nextYear, nextMonth, location, container);
      }

      // Reschedule next month fetch
      await _scheduleNextMonthFetch();

      // Proactive cache next 2 months when near boundary
      if (await _getStoredLocation(container) case final loc?) {
        final now = DateTime.now();
        if (now.day >= DateTime(now.year, now.month + 1, 0).day - 3) {
          await PrayerDataManager.ensureProactiveCacheForLocation(
            lat: loc['lat']!,
            lng: loc['lng']!,
            timezone: loc['timezone'] ?? 'UTC',
            monthsToCover: 3,
          );
        }
      }

      // Update home widget after fetching prayer times
      await HomeWidgetService.updateNextPrayerWidget(container);
    } catch (e) {
      print('Background service error: $e');
    }
  }

  /// Fetch and store prayer timings for a specific month
  static Future<void> _fetchAndStorePrayerTimings(
    int year,
    int month,
    Map<String, String> location,
    ProviderContainer container,
  ) async {
    try {
      final url = 'https://www.alislam.org/adhan/api/timings/month';
      final response = await ApiHelper.instance.dio.get(
        url,
        queryParameters: {
          'lat': location['lat'],
          'lng': location['lng'],
          'month': month,
          'year': year,
        },
      );

      if (response.statusCode == 200) {
        final prayerData = PrayerTimingMonthResponseModel.fromJson(
          response.data,
        );

        await PrayerDataManager.storePrayerTimings(
          prayerData,
          location['lat']!,
          location['lng']!,
          location['timezone'] ?? 'UTC',
          container,
        );

        print(
          'Background service: Successfully stored prayer timings for $year-$month',
        );
      } else {
        print(
          'Background service: Failed to fetch prayer timings for $year-$month',
        );
      }
    } catch (e) {
      print(
        'Background service: Error fetching prayer timings for $year-$month: $e',
      );
    }
  }

  /// Get stored location from shared preferences
  static Future<Map<String, String>?> _getStoredLocation(ProviderContainer container) async {
    return await container.read(locationStorageProvider);
  }

  /// Cancel all background tasks
  static Future<void> cancelAllTasks() async {
    await Workmanager().cancelAll();
  }
}

/// Callback function for WorkManager
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final container = ProviderContainer();
    tzdata.initializeTimeZones();
    print('Background task: $task');
    try {
      switch (task) {
        case 'fetchNextMonthPrayerTimings':
          await BackgroundPrayerService.checkAndFetchPrayerTimings(container);
          break;
        case 'checkAndFetchPrayerTimings':
          await BackgroundPrayerService.checkAndFetchPrayerTimings(container);
          break;
        case 'scheduleDailyNotifications':
          await DailyNotificationScheduler.scheduleDailyNotifications(container);
          break;
        case 'rescheduleAll':
          await BackgroundPrayerService.rescheduleAfterBootOrAppStart(container);
          break;
        case 'cleanupAndMetricsTask':
          await PrayerDataManager.clearOldData(container);
          await PrayerDataManager.collectAndPersistMetrics(container  );
          break;
        case 'planNextDayNotifications':
          // Plan and schedule next day's notifications and re-enqueue next midnight
          await DailyNotificationScheduler.scheduleDailyNotifications(container);
          await HomeWidgetService.updateNextPrayerWidget(container);
          await BackgroundPrayerService.scheduleMidnightPlanningTask(container);
          break;
        case 'updateHomeWidget':
          // Update home widget with current prayer time
          await HomeWidgetService.updateNextPrayerWidget(container);
          break;
        case 'testNotifications':
          await DailyNotificationScheduler.testNotifications(container);
          break;
        default:
          print('Unknown background task: $task');
      }
      return true;
    } catch (e, st) {
      log('Background task error:', error: e, stackTrace: st);
      return false;
    }
  });
}
