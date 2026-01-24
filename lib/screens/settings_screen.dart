import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import '../providers/app_providers.dart';
import '../providers/background_service_provider.dart';
import '../services/prayer_data_manager.dart';
import '../services/battery_optimization_service.dart';
import '../services/home_widget_service.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final batteryOpt = ref.watch(batteryOptimizationStatusProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notification Settings'),
                  subtitle: const Text('Manage prayer time notifications'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to prayer times screen where notification settings are now located
                    Navigator.pushNamed(context, '/');
                  },
                ),
                // ListTile(
                //   leading: const Icon(Icons.language),
                //   title: const Text('Language'),
                //   subtitle: Text(settings.language.toUpperCase()),
                //   trailing: const Icon(Icons.arrow_forward_ios),
                //   onTap: () {
                //     // TODO: Implement language selection
                //   },
                // ),
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Auto Location'),
                  subtitle: const Text('Use device location automatically'),
                  trailing: Switch(
                    value: true, //settings.autoLocation,
                    onChanged: (value) {
                      ref.read(settingsProvider.notifier).toggleAutoLocation();
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.brightness_6),
                  title: const Text('Theme'),
                  subtitle: Text(themeMode.name),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _showThemeDialog(context, ref);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                if (Theme.of(context).platform == TargetPlatform.android)
                  ListTile(
                    leading: const Icon(Icons.battery_charging_full),
                    title: const Text('Battery Optimization'),
                    subtitle:
                        batteryOpt.whenData((batteryOpt) {
                          final isIgnoring =
                              batteryOpt['is_ignoring_optimization'] ?? false;
                          return Text(
                            isIgnoring
                                ? 'Optimization disabled'
                                : 'Optimization enabled - may affect notifications',
                            style: TextStyle(
                              color: isIgnoring ? Colors.green : Colors.orange,
                            ),
                          );
                        }).value ??
                        const Text('Checking...'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      ref.invalidate(batteryOptimizationStatusProvider);
                      _showBatteryOptimizationDialog(context, ref);
                    },
                  ),
                ListTile(
                  leading: const Icon(Icons.storage),
                  title: const Text('Database Management'),
                  subtitle: const Text('Manage cached prayer timing data'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _showDatabaseDialog(context, ref);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.sync),
                  title: const Text('Background Service'),
                  subtitle: const Text(
                    'Manage automatic prayer timing updates',
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _showBackgroundServiceDialog(context, ref);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.widgets),
                  title: const Text('Home Widget Debug'),
                  subtitle: const Text('Test home widget updates'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _showHomeWidgetDebugDialog(context, ref);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showThemeDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('System'),
              leading: Radio<ThemeMode>(
                value: ThemeMode.system,
                groupValue: ref.watch(themeProvider),
                onChanged: (value) {
                  ref.read(themeProvider.notifier).setTheme(value!);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Light'),
              leading: Radio<ThemeMode>(
                value: ThemeMode.light,
                groupValue: ref.watch(themeProvider),
                onChanged: (value) {
                  ref.read(themeProvider.notifier).setTheme(value!);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Dark'),
              leading: Radio<ThemeMode>(
                value: ThemeMode.dark,
                groupValue: ref.watch(themeProvider),
                onChanged: (value) {
                  ref.read(themeProvider.notifier).setTheme(value!);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDatabaseDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Database Management'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FutureBuilder<Map<String, dynamic>>(
              future: PrayerDataManager.getDatabaseStats(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final stats = snapshot.data ?? {};
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Prayer Records: ${stats['prayer_records'] ?? 0}'),
                    const SizedBox(height: 8),
                    Text('Location Records: ${stats['location_records'] ?? 0}'),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_sweep),
              title: const Text('Clear Old Data'),
              subtitle: const Text('Remove data older than 3 months'),
              onTap: () async {
                await PrayerDataManager.clearOldData(ref.container);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Old data cleared successfully'),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_forever),
              title: const Text('Clear All Data'),
              subtitle: const Text('Remove all cached prayer timing data'),
              onTap: () async {
                await PrayerDataManager.clearAllData();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('All data cleared successfully'),
                  ),
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showBackgroundServiceDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Background Service'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FutureBuilder<Map<String, dynamic>>(
              future: ref
                  .read(backgroundServiceNotifierProvider.notifier)
                  .getBackgroundServiceStatus(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final status = snapshot.data ?? {};
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location Stored: ${status['has_location'] ?? false ? 'Yes' : 'No'}',
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Service Running: ${status['service_running'] ?? false ? 'Yes' : 'No'}',
                    ),
                    if (status['location'] != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Location: ${status['location']['lat']}, ${status['location']['lng']}',
                      ),
                    ],
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.play_arrow),
              title: const Text('Start Background Service'),
              subtitle: const Text('Enable automatic prayer timing updates'),
              onTap: () async {
                await ref
                    .read(backgroundServiceNotifierProvider.notifier)
                    .startBackgroundService();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Background service started')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.stop),
              title: const Text('Stop Background Service'),
              subtitle: const Text('Disable automatic prayer timing updates'),
              onTap: () async {
                await ref
                    .read(backgroundServiceNotifierProvider.notifier)
                    .stopBackgroundService();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Background service stopped')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.refresh),
              title: const Text('Manual Fetch'),
              subtitle: const Text('Manually fetch prayer timings now'),
              onTap: () async {
                await ref
                    .read(backgroundServiceNotifierProvider.notifier)
                    .manuallyFetchPrayerTimings(ref.container);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Manual fetch completed')),
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showHomeWidgetDebugDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Home Widget Debug'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.refresh),
              title: const Text('Test Widget Update'),
              subtitle: const Text('Manually update the home widget'),
              onTap: () async {
                await HomeWidgetService.debugUpdate(ref);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Home widget debug update completed'),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.play_arrow),
              title: const Text('Start Periodic Updates'),
              subtitle: const Text(
                'Start automatic widget updates every minute',
              ),
              onTap: () {
                HomeWidgetService.startPeriodicUpdates(ref.container);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Periodic updates started')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.stop),
              title: const Text('Stop Periodic Updates'),
              subtitle: const Text('Stop automatic widget updates'),
              onTap: () {
                HomeWidgetService.stopPeriodicUpdates();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Periodic updates stopped')),
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showBatteryOptimizationDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    showDialog(
      context: context,
      builder: (context) => Consumer(
        builder: (context, ref, _) {
          final batteryOpt = ref.watch(batteryOptimizationStatusProvider);
          final actions = batteryOpt.whenData((batteryOpt) {
            final isIgnoringOptimizations =
                batteryOpt['is_ignoring_optimization'] ?? false;
            return [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
              if (Platform.isAndroid && !isIgnoringOptimizations)
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await BatteryOptimizationService.requestDisableBatteryOptimization();
                  },
                  child: const Text('Disable Optimization'),
                ),
            ];
          }).value;

          return AlertDialog(
            title: const Text('Battery Optimization'),
            content:
                batteryOpt.whenData((batteryOpt) {
                  final isIgnoringOptimizations =
                      batteryOpt['is_ignoring_optimization'] ?? false;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Battery optimization can prevent prayer time notifications from working properly.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'For reliable notifications:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text('• Disable battery optimization for this app'),
                      const Text('• Allow background activity'),
                      const Text('• Keep notifications enabled'),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Platform: ${Theme.of(context).platform.name}'),
                          const SizedBox(height: 8),
                          Text(
                            'Status: ${isIgnoringOptimizations ? "Disabled" : "Enabled"}',
                            style: TextStyle(
                              color: isIgnoringOptimizations
                                  ? Colors.green
                                  : Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }).value ??
                const Center(child: CircularProgressIndicator()),
            actions: actions,
          );
        },
      ),
    );
  }
}
