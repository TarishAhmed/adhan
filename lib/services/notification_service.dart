import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'dart:io';
import 'package:flutter/material.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Prayer time channels
  static const Map<String, String> prayerChannels = {
    'fajr': 'fajr_prayer_channel',
    'sunrise': 'sunrise_prayer_channel',
    'dhuhr': 'dhuhr_prayer_channel',
    'asr': 'asr_prayer_channel',
    'maghrib': 'maghrib_prayer_channel',
    'isha': 'isha_prayer_channel',
  };

  static Future<void> initialize() async {
    tzdata.initializeTimeZones();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _notificationsPlugin.initialize(initializationSettings);

    // Create individual channels for each prayer time
    await _createPrayerChannels();
  }

  /// Create individual notification channels for each prayer time
  static Future<void> _createPrayerChannels() async {
    if (Platform.isAndroid) {
      print(
        'Skipping initial channel creation - channels will be created with proper settings during scheduling',
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
      case 'dhuhr':
        return 'Dhuhr';
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
  static String getChannelId(String prayerName, AdhanSound sound) {
    final prayerKey = prayerName.toLowerCase();
    final soundKey = sound.name.toLowerCase();
    return '${prayerKey}_${soundKey}_prayer_channel';
  }

  static String getChannelGroupId(String prayerName) {
    final prayerKey = prayerName.toLowerCase();
    return '${prayerKey}_prayer_channel_group';
  }

  /// Get the most commonly used sound for a prayer (for channel creation)
  static AdhanSound getDefaultSoundForPrayer(String prayerName) {
    // You can customize this based on user preferences or prayer-specific defaults
    return AdhanSound.defaultRingtone;
  }

  static Future<void> schedulePrayerNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    required AdhanSound sound,
    required String prayerName,
  }) async {
    final now = DateTime.now();
    DateTime notificationTime = scheduledTime;
    if (scheduledTime.isBefore(now)) {
      notificationTime = scheduledTime.add(const Duration(days: 1));
    }

    // Use prayer-based channel ID (one channel per prayer)
    final channelId = getChannelId(prayerName, sound);
    final channelGroupId = getChannelGroupId(prayerName);
    print('Scheduling notification for $prayerName with channel: $channelId');

    final soundAndroid = _getAndroidNotificationSound(sound);
    print('Android sound: $soundAndroid');
    print('Sound type: ${soundAndroid.runtimeType}');

    // Create or update notification channel
    if (Platform.isAndroid) {
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

      final channelName = _getPrayerDisplayName(prayerName);
      final channelDescription = 'Notifications for $channelName prayer time';

      // Try to delete existing channel to recreate with new sound
      try {
        await androidPlugin?.deleteNotificationChannelGroup(channelGroupId);
        print('Deleted existing channel group: $channelGroupId');
      } catch (e) {
        print('Channel group deletion failed (may not exist): $e');
      }

      await androidPlugin?.createNotificationChannelGroup(
        AndroidNotificationChannelGroup(
          channelGroupId,
          channelName,
          description: channelDescription,
        ),
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

      print('Channel created for $prayerName with sound: $soundAndroid');
    }

    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        _getPrayerDisplayName(prayerName),
        channelDescription:
            'Notifications for ${_getPrayerDisplayName(prayerName)} prayer time',
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

    print(
      'Notification details created with sound: ${notificationDetails.android?.sound}',
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

    print(
      'Notification scheduled successfully for $prayerName at ${notificationTime.toString()}',
    );
  }

  static AndroidNotificationSound? _getAndroidNotificationSound(
    AdhanSound sound,
  ) {
    print('Processing sound: ${sound.name}');
    // Always use system default sound for now to test
    print('Using system default sound');

    if (sound == AdhanSound.defaultRingtone) {
      return UriAndroidNotificationSound('content://settings/system/ringtone');
    } else {
      final soundPath = sound.path.split('/').last.split('.').first;
      return RawResourceAndroidNotificationSound(soundPath);
    }
  }

  static Future<void> cancelPrayerNotification(int id) async {
    await _notificationsPlugin.cancel(id);
  }

  static Future<bool> requestPermission({BuildContext? context}) async {
    if (Platform.isAndroid) {
      final plugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      final enabled = await plugin?.areNotificationsEnabled();
      if (enabled == true) return true;
      final granted = await plugin?.requestNotificationsPermission();
      if (granted == true) return true;
      if (context != null && context.mounted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Notification Permission Required'),
            content: const Text(
              'Please enable notifications for this app in system settings.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
      return false;
    } else if (Platform.isIOS) {
      final plugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();
      final granted = await plugin?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      if (granted == true) return true;
      if (context != null && context.mounted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Notification Permission Required'),
            content: const Text(
              'Please enable notifications for this app in system settings.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('OK'),
              ),
            ],
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
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      return await plugin?.areNotificationsEnabled() ?? false;
    } else if (Platform.isIOS) {
      final plugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();
      return await plugin?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          ) ??
          false;
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
      print('Debugging channel: $channelId');
      // Note: getNotificationChannel is not available in this version
      // We'll rely on the logging in schedulePrayerNotification instead
    }
  }

  /// Check current notification settings
  static Future<void> checkNotificationSettings() async {
    if (Platform.isAndroid) {
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

      final enabled = await androidPlugin?.areNotificationsEnabled();
      print('Notifications enabled: $enabled');

      // Check if we can request permissions
      final granted = await androidPlugin?.requestNotificationsPermission();
      print('Notification permission granted: $granted');
    }
  }
}

enum AdhanSound {
  misharyRashidAlafasy('mishary_rashid_alafasy.mp3'),
  misharyRashidAlafasy2('mishary_rashid_alafasy_2.mp3'),
  misharyRashidAlafasy3('mishary_rashid_alafasy_3.mp3'),
  mansourAlZahrani('mansour_al_zahrani.mp3'),
  hafizMustafaOzcan('hafiz_mustafa_ozcan.mp3'),
  karlJenkins('karl_jenkins.mp3'),
  ahmadAlNafees('ahmad_al_nafees.mp3'),
  defaultRingtone('default');

  const AdhanSound(this.path);
  final String path;
}
