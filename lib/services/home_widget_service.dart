import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'location_storage_service.dart';
import 'prayer_data_manager.dart';
import '../model/prayer_timing_month_response_model.dart';

class HomeWidgetService {
  static const String _groupId = 'adhan_home_widget';
  static Timer? _updateTimer;

  /// Start periodic updates for the home widget
  static void startPeriodicUpdates() {
    // Cancel any existing timer
    _updateTimer?.cancel();

    // Update immediately
    updateNextPrayerWidget();

    // Then update every minute
    _updateTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      updateNextPrayerWidget();
    });
  }

  /// Stop periodic updates
  static void stopPeriodicUpdates() {
    _updateTimer?.cancel();
    _updateTimer = null;
  }

  /// Handle app lifecycle changes
  static void handleAppLifecycleChange(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        // App came to foreground, update widget immediately
        updateNextPrayerWidget();
        // Restart periodic updates
        startPeriodicUpdates();
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        // App went to background, stop periodic updates to save battery
        stopPeriodicUpdates();
        break;
      case AppLifecycleState.inactive:
        // App is inactive, update widget one more time before going inactive
        updateNextPrayerWidget();
        break;
    }
  }

  /// Manually trigger home widget update
  static Future<void> manualUpdate() async {
    await updateNextPrayerWidget();
  }

  /// Check if home widget is available on the device
  static Future<bool> isWidgetAvailable() async {
    try {
      // Try to get widget data to check if widget is available
      final data = await HomeWidget.getWidgetData<String>('_group');
      return data != null;
    } catch (e) {
      return false;
    }
  }

  /// Debug method to test home widget updates
  static Future<void> debugUpdate() async {
    try {
      print('HomeWidgetService: Starting debug update');
      final location = await LocationStorageService.getStoredLocation();
      print('HomeWidgetService: Location: $location');

      if (location == null) {
        print('HomeWidgetService: No location available');
        return;
      }

      final now = DateTime.now();
      print('HomeWidgetService: Current time: $now');

      final today = await PrayerDataManager.getPrayerTimingForDate(
        date: now,
        lat: location['lat']!,
        lng: location['lng']!,
      );

      print('HomeWidgetService: Today\'s prayers: ${today?.prayers?.length}');

      await updateNextPrayerWidget();
      print('HomeWidgetService: Debug update completed');
    } catch (e) {
      print('HomeWidgetService: Debug update error: $e');
    }
  }

  static Future<void> updateNextPrayerWidget() async {
    try {
      final location = await LocationStorageService.getStoredLocation();
      if (location == null) return;

      final now = DateTime.now();
      final today = await PrayerDataManager.getPrayerTimingForDate(
        date: now,
        lat: location['lat']!,
        lng: location['lng']!,
      );

      MultiDayTiming? tomorrow;
      if (today?.prayers == null || today!.prayers!.isEmpty) return;

      final next = _findNextPrayer(now, today);
      Prayer? nextPrayer = next;

      if (nextPrayer == null) {
        final tmr = now.add(const Duration(days: 1));
        tomorrow = await PrayerDataManager.getPrayerTimingForDate(
          date: tmr,
          lat: location['lat']!,
          lng: location['lng']!,
        );
        if (tomorrow?.prayers != null && tomorrow!.prayers!.isNotEmpty) {
          nextPrayer = tomorrow.prayers!.firstWhere(
            (p) => p.name == PrayerName.FAJR,
            orElse: () => tomorrow!.prayers!.first,
          );
        }
      }

      if (nextPrayer == null || nextPrayer.time == null) return;

      final remaining = nextPrayer.time!.difference(now);
      final displayTime = DateFormat.jm().format(nextPrayer.time!);
      final remainingText = _formatRemaining(remaining);

      await HomeWidget.saveWidgetData<String>('_group', _groupId);
      await HomeWidget.saveWidgetData<String>(
        'next_prayer_name',
        nextPrayer.name?.displayName ?? 'Prayer',
      );
      await HomeWidget.saveWidgetData<String>('next_prayer_time', displayTime);
      await HomeWidget.saveWidgetData<String>('time_remaining', remainingText);
      await HomeWidget.saveWidgetData<String>(
        'location_city',
        location['city'] ?? '',
      );
      await HomeWidget.saveWidgetData<String>('location_country', '');

      await HomeWidget.updateWidget();
    } catch (_) {
      // Ignore widget update failures
    }
  }

  static Prayer? _findNextPrayer(DateTime now, MultiDayTiming? day) {
    if (day?.prayers == null) return null;
    for (final p in day!.prayers!) {
      if (p.time != null && p.name != null) {
        if (p.name == PrayerName.SUNRISE) continue;
        if (p.time!.isAfter(now)) return p;
      }
    }
    return null;
  }

  static String _formatRemaining(Duration remaining) {
    final mins = remaining.inMinutes.abs();
    final h = mins ~/ 60;
    final m = mins % 60;
    if (h == 0 && m == 0) return 'now';
    if (h == 0) return '$m min';
    if (m == 0) return '$h h';
    return '$h h $m m';
  }
}
