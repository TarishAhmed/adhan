import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import '../providers/app_providers.dart';
import '../providers/background_service_provider.dart';
import '../services/prayer_data_manager.dart';
import '../services/battery_optimization_service.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

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
                ListTile(
                  leading: const Icon(Icons.battery_charging_full),
                  title: const Text('Battery Optimization'),
                  subtitle: FutureBuilder<Map<String, dynamic>>(
                    future:
                        BatteryOptimizationService.getBatteryOptimizationStatus(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text('Checking...');
                      }
                      final status = snapshot.data ?? {};
                      final needsAttention = status['needs_attention'] ?? false;
                      return Text(
                        needsAttention
                            ? 'Optimization enabled - may affect notifications'
                            : 'Optimization disabled',
                        style: TextStyle(
                          color: needsAttention ? Colors.orange : Colors.green,
                        ),
                      );
                    },
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _showBatteryOptimizationDialog(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.storage),
                  title: const Text('Database Management'),
                  subtitle: const Text('Manage cached prayer timing data'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _showDatabaseDialog(context);
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

  void _showDatabaseDialog(BuildContext context) {
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
                await PrayerDataManager.clearOldData();
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
                    .manuallyFetchPrayerTimings();
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

  void _showBatteryOptimizationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Battery Optimization'),
        content: Column(
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
            FutureBuilder<Map<String, dynamic>>(
              future: BatteryOptimizationService.getBatteryOptimizationStatus(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Checking status...');
                }
                final status = snapshot.data ?? {};
                final isOptimized = status['is_optimized'] ?? false;
                final platform = status['platform'] ?? 'Unknown';

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Platform: $platform'),
                    const SizedBox(height: 8),
                    Text(
                      'Status: ${isOptimized ? "Optimized (needs attention)" : "Not optimized"}',
                      style: TextStyle(
                        color: isOptimized ? Colors.orange : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
          if (Platform.isAndroid)
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                await BatteryOptimizationService.requestDisableBatteryOptimization();
              },
              child: const Text('Disable Optimization'),
            ),
        ],
      ),
    );
  }
}
