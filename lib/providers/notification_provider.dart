import 'package:adhan_app/providers/prayer_timing_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerNotificationState extends Notifier<Map<PrayerTimeName, bool>> {
  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final map = <PrayerTimeName, bool>{};
    for (final k in PrayerTimeName.values) {
      map[k] = prefs.getBool('notify_${k.name}') ?? false;
    }
    state = map;
  }

  Future<void> toggle(PrayerTimeName prayer, bool value) async {
    state = {...state, prayer: value};
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notify_${prayer.name}', value);
  }

  @override
  Map<PrayerTimeName, bool> build() {
    _loadPrefs();
    return {};
  }
}

final prayerNotificationProvider =
    NotifierProvider<PrayerNotificationState, Map<PrayerTimeName, bool>>(
      PrayerNotificationState.new,
    );
