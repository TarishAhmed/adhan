import 'dart:isolate';

import 'package:adhan_app/providers/prayer_timing_provider.dart';
import 'package:adhan_app/services/background_prayer_service.dart';
import 'package:adhan_app/services/daily_notification_scheduler.dart';
import 'package:adhan_app/services/battery_optimization_service.dart';
import 'package:adhan_app/theme/theme.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:workmanager/workmanager.dart';
import 'providers/router_provider.dart';
import 'providers/app_providers.dart';
import 'services/notification_service.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

const Color kPrimaryGreen = Color(0xFF2E6B57);
const Color kBackground = Color(0xFFF7FBF7);

void main() async {
  if (kIsWeb) usePathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();

  if (!kIsWeb) {
    await AndroidAlarmManager.initialize();
    // Initialize background prayer service
    await BackgroundPrayerService.initialize();
    await BackgroundPrayerService.scheduleBackgroundTasks();

    // Initialize daily notification scheduler
    await DailyNotificationScheduler.initialize();

    // Request notification permission on app launch
    await NotificationService.requestPermission();
  }

  if (kIsWeb) {
    // remove hash tag from url
    databaseFactory = databaseFactoryFfiWeb;
  }

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
      builder: (context, child) => BatteryOptimizationWrapper(child: child!),
    );
  }
}

class BatteryOptimizationWrapper extends StatefulHookConsumerWidget {
  final Widget child;

  const BatteryOptimizationWrapper({super.key, required this.child});

  @override
  ConsumerState<BatteryOptimizationWrapper> createState() =>
      _BatteryOptimizationWrapperState();
}

class _BatteryOptimizationWrapperState
    extends ConsumerState<BatteryOptimizationWrapper> {
  bool _hasCheckedBatteryOptimization = false;

  @override
  void initState() {
    super.initState();
    _checkBatteryOptimization();
  }

  Future<void> _checkBatteryOptimization() async {
    // Wait a bit for the app to fully load
    await Future.delayed(const Duration(seconds: 2));

    if (mounted && !_hasCheckedBatteryOptimization) {
      setState(() {
        _hasCheckedBatteryOptimization = true;
      });

      await BatteryOptimizationService.checkBatteryOptimization(context, ref);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}