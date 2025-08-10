import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:android_intent_plus/android_intent.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'battery_optimization_service.g.dart';

const MethodChannel systemUtilsChannel = MethodChannel('app_system_utils');
class BatteryOptimizationService {

  /// Check if battery optimization is enabled for the app
  static Future<bool> isIgnoringBatteryOptimizations() async {
    try {
      if (Platform.isAndroid) {
        final bool isIgnoringBatteryOptimizations = await systemUtilsChannel.invokeMethod('isIgnoringBatteryOptimizations');
        return isIgnoringBatteryOptimizations;
      }
      return false; // iOS doesn't have the same battery optimization concept
    } catch (e) {
      print('Error checking battery optimization: $e');
      return false;
    }
  }

  /// Request to disable battery optimization for the app
  static Future<bool> requestDisableBatteryOptimization() async {
    try {
      if (Platform.isAndroid) {
        final bool success = await systemUtilsChannel.invokeMethod('requestDisableBatteryOptimization');
        return success;
      }
      return true; // iOS doesn't need this
    } catch (e) {
      print('Error requesting battery optimization disable: $e');
      return false;
    }
  }

  /// Show battery optimization dialog
  static Future<void> showBatteryOptimizationDialog(BuildContext context, WidgetRef ref) async {
    final bool isIgnoringOptimizations = await isIgnoringBatteryOptimizations();

    if (isIgnoringOptimizations && Platform.isAndroid) {
      if (context.mounted) {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Battery Optimization'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('For reliable prayer time notifications:'),
                const SizedBox(height: 8),
                const Text('1. Disable Android battery optimization for this app.'),
                const Text('2. Allow background activity/autostart (some OEMs).'),
                const Text('3. Lock the app in recent tasks (MIUI/EMUI).'),
                const SizedBox(height: 16),
                _OemHelpList(),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Skip'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await requestDisableBatteryOptimization();

                  if (context.mounted) {
                    // Show follow-up dialog
                    await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Battery Optimization'),
                        content: const Text(
                          'Please follow the system prompts to disable battery optimization for this app. '
                          'This is important for reliable prayer time notifications.',
                        ),
                        actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))],
                      ),
                    );
                  }
                },
                child: const Text('Disable Optimization'),
              ),
            ],
          ),
        );
      }
    }
  }

  /// Check and show battery optimization dialog if needed
  static Future<void> checkBatteryOptimization(BuildContext context, WidgetRef ref) async {
    try {
      await showBatteryOptimizationDialog(context, ref);
    } catch (e) {
      print('Error checking battery optimization: $e');
    }
  }

  /// Get battery optimization status for display
  static Future<Map<String, dynamic>> getBatteryOptimizationStatus() async {
    try {
      final bool isIgnoringOptimization = await isIgnoringBatteryOptimizations();
      return {'is_ignoring_optimization': isIgnoringOptimization};
    } catch (e) {
      print('Error getting battery optimization status: $e');
      return {'is_ignoring_optimization': false};
    }
  }

  /// Show battery optimization settings in app settings
  static Future<void> openBatteryOptimizationSettings() async {
    try {
      if (Platform.isAndroid) {
        await systemUtilsChannel.invokeMethod('openBatteryOptimizationSettings');
      }
    } catch (e) {
      print('Error opening battery optimization settings: $e');
    }
  }

  /// Show battery optimization settings in app settings
  static Future<void> getNotificationChannels() async {
    try {
      if (Platform.isAndroid) {
        await systemUtilsChannel.invokeMethod('getNotificationChannels');
      }
    } catch (e) {
      print('Error getting notification channels: $e');
    }
  }
}

class _OemHelpList extends StatefulWidget {
  @override
  State<_OemHelpList> createState() => _OemHelpListState();
}

class _OemHelpListState extends State<_OemHelpList> {
  String? _brand;

  @override
  void initState() {
    super.initState();
    _detectBrand();
  }

  Future<void> _detectBrand() async {
    if (!Platform.isAndroid) return;
    final info = await DeviceInfoPlugin().androidInfo;
    setState(() {
      _brand = info.brand?.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];

    items.add(_OemTile(
      title: 'Open battery optimization settings',
      onTap: BatteryOptimizationService.openBatteryOptimizationSettings,
    ));

    if (_brand == 'xiaomi' || _brand == 'redmi' || _brand == 'poco') {
      items.addAll([
        _OemTile(
          title: 'Open Autostart (MIUI)',
          onTap: () async {
            final intent = AndroidIntent(
              action: 'android.intent.action.MAIN',
              package: 'com.miui.securitycenter',
              componentName: 'com.miui.permcenter.autostart.AutoStartManagementActivity',
            );
            await intent.launch();
          },
        ),
        _OemTile(
          title: 'Open Battery Saver (MIUI)',
          onTap: () async {
            final intent = AndroidIntent(
              action: 'android.intent.action.MAIN',
              package: 'com.miui.powerkeeper',
            );
            await intent.launch();
          },
        ),
      ]);
    } else if (_brand == 'huawei' || _brand == 'honor') {
      items.addAll([
        _OemTile(
          title: 'Open App launch control (EMUI)',
          onTap: () async {
            final intent = AndroidIntent(
              action: 'android.intent.action.MAIN',
              package: 'com.huawei.systemmanager',
              componentName: 'com.huawei.systemmanager.startupmgr.ui.StartupNormalAppListActivity',
            );
            await intent.launch();
          },
        ),
      ]);
    } else if (_brand == 'samsung') {
      items.addAll([
        _OemTile(
          title: 'Open Sleeping apps settings (OneUI)',
          onTap: () async {
            final intent = const AndroidIntent(
              action: 'android.settings.APP_BATTERY_SETTINGS',
            );
            await intent.launch();
          },
        ),
      ]);
    } else if (_brand == 'oneplus' || _brand == 'oppo' || _brand == 'realme') {
      items.addAll([
        _OemTile(
          title: 'Allow auto-launch (ColorOS/OxygenOS)',
          onTap: () async {
            final intent = AndroidIntent(
              action: 'android.settings.APPLICATION_DETAILS_SETTINGS',
              data: 'package:${await _packageName()}',
            );
            await intent.launch();
          },
        ),
      ]);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Quick actions:'),
        const SizedBox(height: 8),
        ...items,
      ],
    );
  }

  Future<String> _packageName() async {
    const channel = MethodChannel('flutter/baseflow.com/package_info');
    try {
      final map = await channel.invokeMethod<Map>('getAll');
      return map?['packageName'] as String? ?? '';
    } catch (_) {
      return '';
    }
  }
}

class _OemTile extends StatelessWidget {
  final String title;
  final Future<void> Function() onTap;

  const _OemTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: OutlinedButton(
        onPressed: onTap,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(title),
        ),
      ),
    );
  }
}

@riverpod
Future<Map<String, dynamic>> batteryOptimizationStatus(Ref ref) =>
    BatteryOptimizationService.getBatteryOptimizationStatus();
