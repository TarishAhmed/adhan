import 'dart:convert';
import 'dart:isolate';

import 'package:adhan/providers/prayer_timing_provider.dart';
import 'package:adhan/theme/theme.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workmanager/workmanager.dart';
import 'providers/router_provider.dart';
import 'providers/app_providers.dart';
import 'services/notification_service.dart';

const Color kPrimaryGreen = Color(0xFF2E6B57);
const Color kBackground = Color(0xFFF7FBF7);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();

  
  await Workmanager().initialize(
    callbackDispatcher, // The top level function, aka callbackDispatcher
    isInDebugMode:
        true, // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  );

  await AndroidAlarmManager.initialize();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'Adhan',
      theme: MaterialTheme().light(),
      darkTheme: MaterialTheme().dark(),
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}

@pragma(
  'vm:entry-point',
) // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    print(
      "Native called background task: $task",
    ); //simpleTask will be emitted here.

    switch (task) {
      case 'test-task':
        testTask(inputData!);
        break;
      default:
        print('Unknown task');
    }
    return Future.value(true);
  });
}

testTask(Map<String, dynamic> data) async {
  
  await NotificationService.initialize();
  final prayer = PrayerTime.fromJson(data);
  await NotificationService.schedulePrayerNotification(
    id: 99999,
    title: '${prayer.name.displayName} Prayer',
    body: 'It\'s time for ${prayer.name.displayName} prayer.',
    scheduledTime: DateTime.now().add(const Duration(seconds: 5)),
    sound: AdhanSound.defaultRingtone,
  );
  print('Test task: $data');
}


@pragma('vm:entry-point')
Future<void> testAlarmManager() async {
  print('---------------Android----------2');
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  print("[$now] Hello, world! isolate=${isolateId} function='$testAlarmManager'");

  await NotificationService.initialize();
  final prayer = PrayerTime(name: PrayerTimeName.dhuhr, time: DateTime.now().add(const Duration(seconds: 5)));
  await NotificationService.schedulePrayerNotification(
    id: 99999,
    title: '${prayer.name.displayName} Prayer',
    body: 'It\'s time for ${prayer.name.displayName} prayer.',
    scheduledTime: prayer.time,
    sound: AdhanSound.defaultRingtone,
  );
  print('Test task: ${prayer.toJson()}');
}