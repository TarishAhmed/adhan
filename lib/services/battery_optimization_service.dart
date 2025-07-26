import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

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
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'For prayer time notifications to work reliably, please disable battery optimization for this app.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text('This will ensure that:', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('• Daily notifications are scheduled at 2 AM'),
                Text('• Prayer time notifications arrive on time'),
                Text('• Background services work properly'),
                SizedBox(height: 16),
                Text(
                  'You can change this later in your device settings.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
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

@riverpod
Future<Map<String, dynamic>> batteryOptimizationStatus(Ref ref) =>
    BatteryOptimizationService.getBatteryOptimizationStatus();
