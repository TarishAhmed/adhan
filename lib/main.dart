import 'package:adhan_app/services/background_prayer_service.dart';
import 'package:adhan_app/services/daily_notification_scheduler.dart';
import 'package:adhan_app/services/battery_optimization_service.dart';
import 'package:adhan_app/services/location_storage_service.dart';
import 'package:adhan_app/theme/theme.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'providers/router_provider.dart';
import 'providers/app_providers.dart';
import 'providers/prayer_timing_provider.dart';
import 'services/notification_service.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'services/home_widget_service.dart';
import 'firebase_options.dart';
import 'widgets/update_manager.dart';

const Color kPrimaryGreen = Color(0xFF2E6B57);
const Color kBackground = Color(0xFFF7FBF7);

void main() async {
  if (kIsWeb) usePathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await NotificationService.initialize();

  final pref = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [
      sharedPrefProvider.overrideWithValue(pref),
    ],
  );

  if (!kIsWeb) {
    await AndroidAlarmManager.initialize();
    // Initialize background prayer service
    await BackgroundPrayerService.initialize();

    // Initialize daily notification scheduler (timezones)
    await DailyNotificationScheduler.initialize();

    // Ensure all work and today's notifications are (re)scheduled after boot/app start
    await BackgroundPrayerService.rescheduleAfterBootOrAppStart(container);

    // Request notification permission on app launch
    await NotificationService.requestPermission();

    // Initial home widget update
    await HomeWidgetService.updateNextPrayerWidget(container);

    // Start periodic updates for the home widget
    HomeWidgetService.startPeriodicUpdates(container);

    // Update home widget after a short delay to ensure everything is initialized
    Future.delayed(const Duration(seconds: 3), () {
      HomeWidgetService.updateNextPrayerWidget(container);
    });
  }

  if (kIsWeb) {
    // remove hash tag from url
    databaseFactory = databaseFactoryFfiWeb;
  }

  

  runApp(
    ProviderScope(
      overrides: [sharedPrefProvider.overrideWithValue(pref)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeProvider);

    ref.read(sharedPrefProvider);

    // Initialize home widget updater
    ref.watch(homeWidgetUpdaterProvider);

    // Initialize location change listener
    ref.watch(locationChangeListenerProvider);

    return MaterialApp.router(
      title: 'Adhan',
      theme: MaterialTheme().light(),
      darkTheme: MaterialTheme().dark(),
      themeMode: themeMode,
      routerConfig: router,
      builder: (context, child) =>
          UpdateManager(child: BatteryOptimizationWrapper(child: child!)),
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
    extends ConsumerState<BatteryOptimizationWrapper>
    with WidgetsBindingObserver {
  bool _hasCheckedBatteryOptimization = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkBatteryOptimization();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // Handle home widget updates based on app lifecycle
    HomeWidgetService.handleAppLifecycleChange(state, ref.container);
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
