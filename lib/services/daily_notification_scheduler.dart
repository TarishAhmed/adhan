import 'dart:math';

import 'package:adhan_app/services/notification_service.dart';
import 'package:adhan_app/services/notification_preferences_service.dart';
import 'package:adhan_app/services/prayer_data_manager.dart';
import 'package:adhan_app/services/location_storage_service.dart';
import 'package:adhan_app/model/prayer_timing_month_response_model.dart';
import 'package:riverpod/src/framework.dart';
// import 'package:workmanager/workmanager.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:adhan_app/services/home_widget_service.dart';
import 'package:adhan_app/utils/app_logger.dart';

const _logName = 'adhan.dailyScheduler';

class DailyNotificationScheduler {
  // static const String _dailyNotificationTask = 'scheduleDailyNotifications';

  /// Initialize the daily notification scheduler
  static Future<void> initialize() async {
    tzdata.initializeTimeZones();
  }

  // Midnight planning replaces periodic daily task; kept method for API compatibility
  static Future<void> scheduleDailyNotificationTask() async {}

  /// Schedule notifications for the entire day
  static Future<void> scheduleDailyNotifications(ProviderContainer container) async {
    try {
      AppLogger.i('Daily notification scheduler: Starting daily notification scheduling', name: _logName);

      // Get user's location
      final location = container.read(locationStorageProvider);
      if (location == null) {
        AppLogger.i('Daily notification scheduler: No location available', name: _logName);
        return;
      }

      // Get today's date
      final today = DateTime.now();

      // Get prayer timings for today
      final prayerTimings = await PrayerDataManager.getPrayerTimingForDate(
        date: today,
        lat: location['lat']!,
        lng: location['lng']!,
      );

      if (prayerTimings == null || prayerTimings.prayers == null) {
        AppLogger.i('Daily notification scheduler: No prayer timings available for today', name: _logName);
        return;
      }

      // Get user's notification preferences
      final notificationPreferences =
          await NotificationPreferencesService.getAllNotificationPreferences();
      // final soundPreferences =
      //     await NotificationPreferencesService.getAllSoundPreferences();
      final advanceTimePreferences =
          await NotificationPreferencesService.getAllAdvanceTimePreferences();

      // Cancel existing notifications for today
      await _cancelExistingNotifications();

      // Schedule notifications for each prayer time
      for (final prayer in prayerTimings.prayers!) {
        if (prayer.name == null || prayer.time == null) continue;

        final prayerName = _getPrayerName(prayer.name!);
        if (prayerName == null) continue;

        // Check if notification is enabled for this prayer
        final isEnabled =
            notificationPreferences[prayerName.toLowerCase()] ?? false;
        if (!isEnabled) {
          AppLogger.i('Daily notification scheduler: Skipping $prayerName (disabled)', name: _logName);
          continue;
        }

        // Get advance time for this prayer
        final advanceMinutes =
            advanceTimePreferences[prayerName.toLowerCase()] ?? 0;
        final notificationTime = prayer.time!.subtract(
          Duration(minutes: advanceMinutes),
        );

        // Only schedule if notification time is in the future
        if (notificationTime.isAfter(DateTime.now())) {
          // Schedule notification
          await NotificationService.schedulePrayerNotification(
            id: _getNotificationId(prayerName, today),
            title: '${prayer.name?.displayName}',
            body: 'It\'s time for ${prayer.name?.displayName} prayer.',
            scheduledTime: notificationTime,
            prayerName: prayerName,
          );

          AppLogger.i('Daily notification scheduler: Scheduled $prayerName notification for ${notificationTime.toString()}', name: _logName);
        } else {
          AppLogger.i('Daily notification scheduler: Skipping $prayerName (time has passed)', name: _logName);
        }
      }

      AppLogger.i('Daily notification scheduler: Completed daily notification scheduling', name: _logName);

      // Update home widget after scheduling notifications
      await HomeWidgetService.updateNextPrayerWidget(container);
    } catch (e) {
      AppLogger.e('Daily notification scheduler error', name: _logName, error: e);
    }
  }

  /// Schedule notifications for the entire day
  static Future<void> testNotifications(ProviderContainer container) async {
    AppLogger.i('Test notification scheduler: Starting test notifications', name: _logName);

    // Get user's location
    final location = container.read(locationStorageProvider);
    if (location == null) {
      AppLogger.i('Test notification scheduler: No location available', name: _logName);
      return;
    }

    // Get today's date
    final today = DateTime.now();

    // Optionally fetch timings if needed for debugging
    // await PrayerDataManager.getPrayerTimingForDate(
    //   date: today,
    //   lat: location['lat']!,
    //   lng: location['lng']!,
    // );

    // Cancel existing notifications for today
    // await _cancelExistingNotifications();

    // Schedule notifications for test prayer time
    await NotificationService.schedulePrayerNotification(
      id: Random().nextInt(100000),
      title: 'Fajr Prayer',
      body: 'Test notification for Fajr prayer.',
      scheduledTime: today.add(const Duration(seconds: 5)),
      prayerName: 'fajr',
    );

    AppLogger.i('Test notification scheduler: Completed test notifications', name: _logName);
  }

  /// Cancel existing notifications for today
  static Future<void> _cancelExistingNotifications() async {
    try {
      final today = DateTime.now();
      final prayerNames = NotificationPreferencesService.prayerNames.keys;

      for (final prayerName in prayerNames) {
        final notificationId = _getNotificationId(prayerName, today);
        await NotificationService.cancelPrayerNotification(notificationId);
      }

      AppLogger.i('Daily notification scheduler: Cancelled existing notifications', name: _logName);
    } catch (e) {
      AppLogger.e('Daily notification scheduler: Error cancelling notifications', name: _logName, error: e);
    }
  }

  /// Get notification ID for a specific prayer and date
  static int _getNotificationId(String prayerName, DateTime date) {
    final key = '$prayerName-${date.toIso8601String().split("T").first}';
    return key.hashCode & 0x7FFFFFFF; // positive 32-bit int
  }

  /// Convert prayer enum to string name
  static String? _getPrayerName(PrayerName prayerEnum) {
    switch (prayerEnum) {
      case PrayerName.FAJR:
        return 'fajr';
      case PrayerName.SUNRISE:
        return 'sunrise';
      case PrayerName.ZUHR:
        return 'zuhr';
      case PrayerName.ASR:
        return 'asr';
      case PrayerName.MAGHRIB:
        return 'maghrib';
      case PrayerName.ISHA:
        return 'isha';
      default:
        return null;
    }
  }

  /// Manually trigger daily notification scheduling
  static Future<void> manuallyScheduleDailyNotifications(ProviderContainer container) async {
    await scheduleDailyNotifications(container);
  }

  /// Cancel all scheduled notifications
  static Future<void> cancelAllNotifications() async {
    try {
      final today = DateTime.now();
      final prayerNames = NotificationPreferencesService.prayerNames.keys;

      for (final prayerName in prayerNames) {
        final notificationId = _getNotificationId(prayerName, today);
        await NotificationService.cancelPrayerNotification(notificationId);
      }

      AppLogger.i('Daily notification scheduler: Cancelled all notifications', name: _logName);
    } catch (e) {
      AppLogger.e('Daily notification scheduler: Error cancelling all notifications', name: _logName, error: e);
    }
  }

  /// Get notification status for today
  static Future<Map<String, dynamic>> getNotificationStatus() async {
    try {
      final today = DateTime.now();
      final prayerNames = NotificationPreferencesService.prayerNames.keys;
      final Map<String, dynamic> status = {};

      for (final prayerName in prayerNames) {
        final notificationId = _getNotificationId(prayerName, today);
        final isEnabled =
            await NotificationPreferencesService.getPrayerNotificationEnabled(
              prayerName,
            );
        final sound = await NotificationPreferencesService.getSpecificSoundPreferences(
          prayerName,
        );
        final advanceTime =
            await NotificationPreferencesService.getPrayerAdvanceTime(
              prayerName,
            );

        status[prayerName] = {
          'enabled': isEnabled,
          'sound': sound,
          'advance_time': advanceTime,
          'notification_id': notificationId,
        };
      }

      return status;
    } catch (e) {
      AppLogger.e('Daily notification scheduler: Error getting notification status', name: _logName, error: e);
      return {};
    }
  }
}
