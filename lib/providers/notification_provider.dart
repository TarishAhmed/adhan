import 'package:adhan_app/providers/prayer_timing_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notification_provider.g.dart';

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

final prayerNotificationProvider = NotifierProvider<PrayerNotificationState, Map<PrayerTimeName, bool>>(
  PrayerNotificationState.new,
);

@riverpod
class PrayerChannel extends _$PrayerChannel {
  @override
  Future<String?> build(PrayerTime prayer) async {
    final prefs = await SharedPreferences.getInstance();
    final prayerChannel = prefs.getString(prayer.name.name);
    return prayerChannel;
  }

  Future<void> setChannel(PrayerTime prayer, String? channel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(prayer.name.name, channel ?? '');
    state = AsyncData(channel) ;
  }

  Future<void> clearChannel(PrayerTime prayer) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(prayer.name.name);
    state = AsyncData(null);
  }
}
