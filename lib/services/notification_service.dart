import 'dart:io';

import 'package:adhan_app/api/api_helper.dart';
import 'package:adhan_app/utils/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzdata;

class NotificationService {
  static const _logName = 'adhan.notifications';
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  // Prayer time channels
  static const Map<String, String> prayerChannels = {
    'fajr': 'fajr_prayer_channel',
    'sunrise': 'sunrise_prayer_channel',
    'zuhr': 'zuhr_prayer_channel',
    'asr': 'asr_prayer_channel',
    'maghrib': 'maghrib_prayer_channel',
    'isha': 'isha_prayer_channel',
  };

  static Future<void> initialize() async {
    tzdata.initializeTimeZones();
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await _notificationsPlugin.initialize(initializationSettings);

    // Create individual channels for each prayer time
    await _createPrayerChannels();
  }

  /// Create individual notification channels for each prayer time
  static Future<void> _createPrayerChannels() async {
    if (Platform.isAndroid) {
      AppLogger.i(
        'Skipping initial channel creation - channels will be created with proper settings during scheduling',
        name: _logName,
      );
      // Don't create channels during initialization to avoid conflicts
      // Channels will be created with proper sound settings when notifications are scheduled
    }
  }

  /// Get display name for prayer
  static String _getPrayerDisplayName(String prayerKey) {
    switch (prayerKey) {
      case 'fajr':
        return 'Fajr';
      case 'sunrise':
        return 'Sunrise';
      case 'zuhr':
        return 'Zuhr';
      case 'asr':
        return 'Asr';
      case 'maghrib':
        return 'Maghrib';
      case 'isha':
        return 'Isha';
      default:
        return prayerKey;
    }
  }

  /// Get channel ID for a specific prayer (one channel per prayer)
  static String getChannelId(String prayerName) {
    final prayerKey = prayerName.toLowerCase();
    return '${prayerKey}_prayer_channel';
  }

  static String getChannelGroupId(String prayerName) {
    final prayerKey = prayerName.toLowerCase();
    return '${prayerKey}_prayer_channel_group';
  }

  static Future<void> schedulePrayerNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    required String prayerName,
  }) async {
    final now = DateTime.now();
    DateTime notificationTime = scheduledTime;
    if (scheduledTime.isBefore(now)) {
      notificationTime = scheduledTime.add(const Duration(days: 1));
    }

    // Use prayer-based channel ID (one channel per prayer)
    final channelId = getChannelId(prayerName);
    final channelGroupId = getChannelGroupId(prayerName);
    AppLogger.i(
      'Scheduling notification for $prayerName with channel: $channelId',
      name: _logName,
    );

    final soundAndroid = await _getAndroidNotificationSound(prayerName);

    // Create or update notification channel
    if (Platform.isAndroid) {
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

      final channelName = _getPrayerDisplayName(prayerName);
      final channelDescription = 'Notifications for $channelName prayer time';

      await androidPlugin?.createNotificationChannelGroup(
        AndroidNotificationChannelGroup(channelGroupId, channelName, description: channelDescription),
      );

      // Create channel with current sound settings
      await androidPlugin?.createNotificationChannel(
        AndroidNotificationChannel(
          channelId,
          channelName,
          description: channelDescription,
          importance: Importance.max,
          playSound: true,
          enableVibration: true,
          enableLights: true,
          sound: soundAndroid,
          showBadge: true,
          audioAttributesUsage: AudioAttributesUsage.alarm,
        ),
      );

      AppLogger.i(
        'Channel created for $prayerName with sound: $soundAndroid',
        name: _logName,
      );
    }

    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        _getPrayerDisplayName(prayerName),
        channelDescription: 'Notifications for ${_getPrayerDisplayName(prayerName)} prayer time',
        importance: Importance.max,
        enableVibration: true,
        enableLights: true,
        playSound: true,
        sound: soundAndroid,
        channelShowBadge: true,
        audioAttributesUsage: AudioAttributesUsage.alarm,
        category: AndroidNotificationCategory.alarm,
        channelAction: AndroidNotificationChannelAction.update,
        timeoutAfter: 3600000,
        visibility: NotificationVisibility.public,
        groupKey: channelGroupId,
      ),
    );

    AppLogger.v(
      'Notification details created with sound: ${notificationDetails.android?.sound}',
      name: _logName,
    );

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(notificationTime, tz.local),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exact,
      matchDateTimeComponents: null,
    );

    AppLogger.i(
      'Notification scheduled successfully for $prayerName at ${notificationTime.toString()}',
      name: _logName,
    );
  }

  static Future<AndroidNotificationSound?> _getAndroidNotificationSound(String prayerName) async {
    // final filesDir = await getApplicationSupportDirectory();
    // final dir = Directory('${filesDir.path}/adhan');
    // final file = File('${dir.path}/${prayerName.toLowerCase()}.mp3');
    //? content uri made by using file provider in android manifest and file provider xml
    // content://org.tarish.adhan.fileprovider/adhan/fajr.mp3
    final contentPath = 'content://org.tarish.adhan.fileprovider/adhan/${prayerName.toLowerCase()}.mp3';
    AppLogger.v('alarm uri $contentPath', name: _logName);

    return UriAndroidNotificationSound(contentPath);
  }

  static Future<String> downloadSound(String url, String fileName) async {
    final filesDir = await getApplicationSupportDirectory();
    final dir = Directory('${filesDir.path}/adhan');
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    final file = File('${dir.path}/$fileName');
    final response = await ApiHelper.instance.dio.get(url, options: Options(responseType: ResponseType.bytes));
    // print('Downloaded sound for $fileName: ${response.data}');
    await file.writeAsBytes(response.data);
    return file.path;
  }

  static Future<String> copyFile(String sourceFileName, String destinationFileName) async {
    final filesDir = await getApplicationSupportDirectory();
    final dir = Directory('${filesDir.path}/adhan');
    
    final sourceFile = File('${dir.path}/$sourceFileName');
    final destinationFile = File('${dir.path}/$destinationFileName');
    
    if (!await sourceFile.exists()) {
      throw FileSystemException('Source file not found', sourceFile.path);
    }
    
    await sourceFile.copy(destinationFile.path);
    return destinationFile.path;
  }

  static Future<void> cancelPrayerNotification(int id) async {
    await _notificationsPlugin.cancel(id);
  }

  static Future<bool> requestPermission({BuildContext? context}) async {
    if (Platform.isAndroid) {
      final plugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      final enabled = await plugin?.areNotificationsEnabled();
      if (enabled == true) return true;
      final granted = await plugin?.requestNotificationsPermission();
      if (granted == true) return true;
      if (context != null && context.mounted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Notification Permission Required'),
            content: const Text('Please enable notifications for this app in system settings.'),
            actions: [TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('OK'))],
          ),
        );
      }
      return false;
    } else if (Platform.isIOS) {
      final plugin = _notificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
      final granted = await plugin?.requestPermissions(alert: true, badge: true, sound: true);
      if (granted == true) return true;
      if (context != null && context.mounted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Notification Permission Required'),
            content: const Text('Please enable notifications for this app in system settings.'),
            actions: [TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('OK'))],
          ),
        );
      }
      return false;
    }
    return true;
  }

  /// Check if notifications are enabled
  static Future<bool> areNotificationsEnabled() async {
    if (Platform.isAndroid) {
      final plugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      return await plugin?.areNotificationsEnabled() ?? false;
    } else if (Platform.isIOS) {
      final plugin = _notificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
      return await plugin?.requestPermissions(alert: true, badge: true, sound: true) ?? false;
    }
    return false;
  }

  /// Get notification channel status for each prayer
  static Future<Map<String, bool>> getNotificationChannelStatus() async {
    final Map<String, bool> status = {};

    // For now, return true for all channels since we can't check individual channel status
    // This will be improved in future versions
    for (final prayerName in prayerChannels.keys) {
      status[prayerName] = true;
    }

    return status;
  }

  /// Debug method to check channel settings
  static Future<void> debugChannelSettings(String channelId) async {
    if (Platform.isAndroid) {
      AppLogger.v('Debugging channel: $channelId', name: _logName);
      // Note: getNotificationChannel is not available in this version
      // We'll rely on the logging in schedulePrayerNotification instead
    }
  }

  /// Check current notification settings
  static Future<void> checkNotificationSettings() async {
    if (Platform.isAndroid) {
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

      final enabled = await androidPlugin?.areNotificationsEnabled();
      AppLogger.i('Notifications enabled: $enabled', name: _logName);

      // Check if we can request permissions
      final granted = await androidPlugin?.requestNotificationsPermission();
      AppLogger.i(
        'Notification permission granted: $granted',
        name: _logName,
      );
    }
  }
}
