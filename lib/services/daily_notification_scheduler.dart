import 'package:adhan_app/services/notification_service.dart';
import 'package:adhan_app/services/notification_preferences_service.dart';
import 'package:adhan_app/services/prayer_data_manager.dart';
import 'package:adhan_app/services/location_storage_service.dart';
import 'package:adhan_app/model/prayer_timing_month_response_model.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

class DailyNotificationScheduler {
  static const String _dailyNotificationTask = 'scheduleDailyNotifications';

  /// Initialize the daily notification scheduler
  static Future<void> initialize() async {
    tzdata.initializeTimeZones();
  }

  /// Schedule daily notification task
  static Future<void> scheduleDailyNotificationTask() async {
    await Workmanager().registerPeriodicTask(
      _dailyNotificationTask,
      _dailyNotificationTask,
      frequency: const Duration(days: 1),
      constraints: Constraints(
        networkType: NetworkType.connected,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresDeviceIdle: false,
        requiresStorageNotLow: false,
      ),
    );
  }

  /// Schedule notifications for the entire day
  static Future<void> scheduleDailyNotifications() async {
    try {
      print(
        'Daily notification scheduler: Starting daily notification scheduling',
      );

      // Get user's location
      final location = await LocationStorageService.getStoredLocation();
      if (location == null) {
        print('Daily notification scheduler: No location available');
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
        print(
          'Daily notification scheduler: No prayer timings available for today',
        );
        return;
      }

      // Get user's notification preferences
      final notificationPreferences =
          await NotificationPreferencesService.getAllNotificationPreferences();
      final soundPreferences =
          await NotificationPreferencesService.getAllSoundPreferences();
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
            notificationPreferences[prayerName.toLowerCase()] ?? true;
        if (!isEnabled) {
          print(
            'Daily notification scheduler: Skipping $prayerName (disabled)',
          );
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
          // Get sound preference
          final soundName =
              soundPreferences[prayerName.toLowerCase()] ?? 'default';
          final sound = _getAdhanSound(soundName);

          // Schedule notification
          await NotificationService.schedulePrayerNotification(
            id: _getNotificationId(prayerName, today),
            title: '$prayerName Prayer',
            body: 'It\'s time for $prayerName prayer.',
            scheduledTime: notificationTime,
            sound: sound,
            prayerName: prayerName,
          );

          print(
            'Daily notification scheduler: Scheduled $prayerName notification for ${notificationTime.toString()}',
          );
        } else {
          print(
            'Daily notification scheduler: Skipping $prayerName (time has passed)',
          );
        }
      }

      print(
        'Daily notification scheduler: Completed daily notification scheduling',
      );
    } catch (e) {
      print('Daily notification scheduler error: $e');
    }
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

      print('Daily notification scheduler: Cancelled existing notifications');
    } catch (e) {
      print('Daily notification scheduler: Error cancelling notifications: $e');
    }
  }

  /// Get notification ID for a specific prayer and date
  static int _getNotificationId(String prayerName, DateTime date) {
    final key = '$prayerName-${date.toIso8601String().split("T").first}';
    return key.hashCode & 0x7FFFFFFF; // positive 32-bit int
  }

  /// Convert prayer enum to string name
  static String? _getPrayerName(Name prayerEnum) {
    switch (prayerEnum) {
      case Name.FAJR:
        return 'fajr';
      case Name.SUNRISE:
        return 'sunrise';
      case Name.ZUHR:
        return 'dhuhr';
      case Name.ASR:
        return 'asr';
      case Name.MAGHRIB:
        return 'maghrib';
      case Name.ISHA:
        return 'isha';
      default:
        return null;
    }
  }

  /// Convert sound name to AdhanSound enum
  static AdhanSound _getAdhanSound(String soundName) {
    switch (soundName) {
      case 'mishary_rashid_alafasy':
        return AdhanSound.misharyRashidAlafasy;
      case 'mishary_rashid_alafasy_2':
        return AdhanSound.misharyRashidAlafasy2;
      case 'mishary_rashid_alafasy_3':
        return AdhanSound.misharyRashidAlafasy3;
      case 'mansour_al_zahrani':
        return AdhanSound.mansourAlZahrani;
      case 'hafiz_mustafa_ozcan':
        return AdhanSound.hafizMustafaOzcan;
      case 'karl_jenkins':
        return AdhanSound.karlJenkins;
      case 'ahmad_al_nafees':
        return AdhanSound.ahmadAlNafees;
      default:
        return AdhanSound.defaultRingtone;
    }
  }

  /// Manually trigger daily notification scheduling
  static Future<void> manuallyScheduleDailyNotifications() async {
    await scheduleDailyNotifications();
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

      print('Daily notification scheduler: Cancelled all notifications');
    } catch (e) {
      print(
        'Daily notification scheduler: Error cancelling all notifications: $e',
      );
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
        final sound = await NotificationPreferencesService.getPrayerSound(
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
      print(
        'Daily notification scheduler: Error getting notification status: $e',
      );
      return {};
    }
  }
}
