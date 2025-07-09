import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'dart:io';
import 'package:flutter/material.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    tzdata.initializeTimeZones();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _notificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> schedulePrayerNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    required AdhanSound sound,
  }) async {
    final now = DateTime.now();
    DateTime notificationTime = scheduledTime;
    if (scheduledTime.isBefore(now)) {
      notificationTime = scheduledTime.add(const Duration(days: 1));
    }
    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(notificationTime, tz.local),
      
      // replace .mp3 with '' and remove sound/ and make it one replaceAll

      
      NotificationDetails(
        android: AndroidNotificationDetails(
          'prayer_channel',
          'Prayer Notifications',
          channelDescription: 'Notifications for prayer times',
          importance: Importance.max,
        priority: Priority.high,
          playSound: false,
          sound: sound == AdhanSound.defaultRingtone ? UriAndroidNotificationSound('content://settings/system/ringtone') : RawResourceAndroidNotificationSound(sound.path.replaceAllMapped(RegExp(r'^sound/|\.mp3$'), (match) => '')),
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exact,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future<void> cancelPrayerNotification(int id) async {
    await _notificationsPlugin.cancel(id);
  }

  static Future<bool> requestPermission({BuildContext? context}) async {
    if (Platform.isAndroid) {
      final plugin = _notificationsPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      final enabled = await plugin?.areNotificationsEnabled();
      if (enabled == true) return true;
      final granted = await plugin?.requestNotificationsPermission();
      if(granted == true) return true;
      if (context != null && context.mounted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Notification Permission Required'),
            content: const Text('Please enable notifications for this app in system settings.'),
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
      final plugin = _notificationsPlugin.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>();
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
            content: const Text('Please enable notifications for this app in system settings.'),
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
} 

enum AdhanSound {
  misharyRashidAlafasy('sound/mishary_rashid_alafasy.mp3'),
  misharyRashidAlafasy2('sound/mishary_rashid_alafasy_2.mp3'),
  misharyRashidAlafasy3('sound/mishary_rashid_alafasy_3.mp3'),
  mansourAlZahrani('sound/mansour_al_zahrani.mp3'),
  hafizMustafaOzcan('sound/hafiz_mustafa_ozcan.mp3'),
  karlJenkins('sound/karl_jenkins.mp3'),
  ahmadAlNafees('sound/ahmad_al_nafees.mp3'),
  defaultRingtone('default');

  const AdhanSound(this.path);
  final String path;
}








