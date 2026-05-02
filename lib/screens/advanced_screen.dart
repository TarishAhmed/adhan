import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/gen/app_localizations.dart';
import '../providers/background_service_provider.dart';
import '../services/battery_optimization_service.dart';
import '../services/home_widget_service.dart';
import '../services/prayer_data_manager.dart';
import '../theme/tokens.dart';

/// Advanced settings: battery optimization, background service, cached data.
/// Background-service and home-widget debug entries are gated behind kDebugMode.
class AdvancedScreen extends ConsumerWidget {
  const AdvancedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final batteryOpt = ref.watch(batteryOptimizationStatusProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l.moreSectionAdvanced)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        children: [
          if (Platform.isAndroid)
            ListTile(
              leading: const Icon(Icons.battery_charging_full),
              title: Text(l.moreBatteryOptimization),
              subtitle: batteryOpt.when(
                loading: () => const Text('Checking…'),
                error: (e, _) => Text('Error: $e'),
                data: (status) {
                  final ignoring = status['is_ignoring_optimization'] ?? false;
                  return Text(
                    ignoring
                        ? 'Optimization disabled — notifications work reliably'
                        : 'Optimization enabled — may delay notifications',
                    style: TextStyle(
                      color: ignoring
                          ? theme.colorScheme.primary
                          : theme.colorScheme.error,
                    ),
                  );
                },
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ref.invalidate(batteryOptimizationStatusProvider);
                _showBatteryDialog(context, ref);
              },
            ),
          ListTile(
            leading: const Icon(Icons.storage),
            title: Text(l.moreDatabase),
            subtitle: const Text('Manage cached prayer timing data'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showDatabaseDialog(context, ref),
          ),
          if (kDebugMode) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.md,
                AppSpacing.lg,
                AppSpacing.sm,
              ),
              child: Text(
                'DEBUG ONLY',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.error,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.sync),
              title: Text(l.moreBackgroundService),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showBackgroundServiceDialog(context, ref),
            ),
            ListTile(
              leading: const Icon(Icons.widgets),
              title: Text(l.moreHomeWidget),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showHomeWidgetDialog(context, ref),
            ),
          ],
        ],
      ),
    );
  }

  void _showBatteryDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => Consumer(
        builder: (ctx, ref, _) {
          final batteryOpt = ref.watch(batteryOptimizationStatusProvider);
          return AlertDialog(
            title: const Text('Battery Optimization'),
            content: batteryOpt.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Error: $e'),
              data: (status) {
                final ignoring = status['is_ignoring_optimization'] ?? false;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Battery optimization can delay or block prayer time notifications.',
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    const Text(
                      'For reliable notifications:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    const Text('• Disable battery optimization for this app'),
                    const Text('• Allow background activity'),
                    const Text('• Keep notifications enabled'),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      'Status: ${ignoring ? "Disabled" : "Enabled"}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ignoring ? Colors.green : Colors.orange,
                      ),
                    ),
                  ],
                );
              },
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Close'),
              ),
              if (Platform.isAndroid)
                FilledButton(
                  onPressed: () async {
                    Navigator.of(ctx).pop();
                    await BatteryOptimizationService
                        .requestDisableBatteryOptimization();
                    ref.invalidate(batteryOptimizationStatusProvider);
                  },
                  child: const Text('Disable optimization'),
                ),
            ],
          );
        },
      ),
    );
  }

  void _showDatabaseDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cached data'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FutureBuilder<Map<String, dynamic>>(
              future: PrayerDataManager.getDatabaseStats(),
              builder: (ctx, snap) {
                if (!snap.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final stats = snap.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Prayer records: ${stats['prayer_records'] ?? 0}'),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Location records: ${stats['location_records'] ?? 0}',
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            ListTile(
              dense: true,
              leading: const Icon(Icons.delete_sweep_outlined),
              title: const Text('Clear old data'),
              subtitle: const Text('Older than 3 months'),
              onTap: () async {
                await PrayerDataManager.clearOldData(ref.container);
                if (!ctx.mounted) return;
                Navigator.of(ctx).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Old data cleared')),
                );
              },
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.delete_forever_outlined),
              title: const Text('Clear all data'),
              onTap: () async {
                await PrayerDataManager.clearAllData();
                if (!ctx.mounted) return;
                Navigator.of(ctx).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('All data cleared')),
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showBackgroundServiceDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Background service'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              dense: true,
              leading: const Icon(Icons.play_arrow),
              title: const Text('Start'),
              onTap: () async {
                await ref
                    .read(backgroundServiceProvider.notifier)
                    .startBackgroundService();
                if (!ctx.mounted) return;
                Navigator.of(ctx).pop();
              },
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.stop),
              title: const Text('Stop'),
              onTap: () async {
                await ref
                    .read(backgroundServiceProvider.notifier)
                    .stopBackgroundService();
                if (!ctx.mounted) return;
                Navigator.of(ctx).pop();
              },
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.refresh),
              title: const Text('Manual fetch'),
              onTap: () async {
                await ref
                    .read(backgroundServiceProvider.notifier)
                    .manuallyFetchPrayerTimings(ref.container);
                if (!ctx.mounted) return;
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showHomeWidgetDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Home widget'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              dense: true,
              leading: const Icon(Icons.refresh),
              title: const Text('Test update'),
              onTap: () async {
                await HomeWidgetService.debugUpdate(ref);
                if (!ctx.mounted) return;
                Navigator.of(ctx).pop();
              },
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.play_arrow),
              title: const Text('Start periodic'),
              onTap: () {
                HomeWidgetService.startPeriodicUpdates(ref.container);
                Navigator.of(ctx).pop();
              },
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.stop),
              title: const Text('Stop periodic'),
              onTap: () {
                HomeWidgetService.stopPeriodicUpdates();
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
