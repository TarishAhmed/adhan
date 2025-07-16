import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class BatteryOptimizationService {
  static const MethodChannel _channel = MethodChannel('battery_optimization');

  /// Check if battery optimization is enabled for the app
  static Future<bool> isBatteryOptimizationEnabled() async {
    try {
      if (Platform.isAndroid) {
        final bool isOptimized = await _channel.invokeMethod(
          'isBatteryOptimizationEnabled',
        );
        return isOptimized;
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
        final bool success = await _channel.invokeMethod(
          'requestDisableBatteryOptimization',
        );
        return success;
      }
      return true; // iOS doesn't need this
    } catch (e) {
      print('Error requesting battery optimization disable: $e');
      return false;
    }
  }

  /// Show battery optimization dialog
  static Future<void> showBatteryOptimizationDialog(
    BuildContext context,
  ) async {
    final bool isOptimized = await isBatteryOptimizationEnabled();

    if (isOptimized && Platform.isAndroid) {
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
                Text(
                  'This will ensure that:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
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
  static Future<void> checkBatteryOptimization(BuildContext context) async {
    try {
      await showBatteryOptimizationDialog(context);
    } catch (e) {
      print('Error checking battery optimization: $e');
    }
  }

  /// Get battery optimization status for display
  static Future<Map<String, dynamic>> getBatteryOptimizationStatus() async {
    try {
      final bool isOptimized = await isBatteryOptimizationEnabled();
      return {
        'is_optimized': isOptimized,
        'platform': Platform.isAndroid ? 'Android' : 'iOS',
        'needs_attention': isOptimized && Platform.isAndroid,
      };
    } catch (e) {
      print('Error getting battery optimization status: $e');
      return {
        'is_optimized': false,
        'platform': 'Unknown',
        'needs_attention': false,
      };
    }
  }

  /// Show battery optimization settings in app settings
  static Future<void> openBatteryOptimizationSettings() async {
    try {
      if (Platform.isAndroid) {
        await _channel.invokeMethod('openBatteryOptimizationSettings');
      }
    } catch (e) {
      print('Error opening battery optimization settings: $e');
    }
  }
}
