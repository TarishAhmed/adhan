import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart';

import 'location_storage_service.dart';
import 'prayer_data_manager.dart';
import '../model/prayer_timing_month_response_model.dart';

class HomeWidgetService {
  static const String _groupId = 'adhan_home_widget';

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
