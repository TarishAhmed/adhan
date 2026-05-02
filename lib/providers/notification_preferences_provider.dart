import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/notification_preferences_service.dart';

part 'notification_preferences_provider.g.dart';

@riverpod
class AllNotificationPref extends _$AllNotificationPref {
  @override
  Future<Map<String, dynamic>> build() {
    return NotificationPreferencesService.getAllNotificationPreferences();
  }
}

@riverpod
class SpecificNotificationPref extends _$SpecificNotificationPref {
  @override
  Future<bool> build(String prayerKey) {
    return NotificationPreferencesService.getSpecificNotificationPreferences(
      prayerKey,
    );
  }

  Future<void> toggleNotification(
    String prayerName,
    bool isNotificationEnabled,
  ) async {
    await NotificationPreferencesService.setPrayerNotificationEnabled(
      prayerName,
      isNotificationEnabled,
    );
    ref.invalidateSelf();
  }
}

@riverpod
class AllSoundPref extends _$AllSoundPref {
  @override
  Future<Map<String, dynamic>> build() {
    return NotificationPreferencesService.getAllSoundPreferences();
  }

  Future<void> setSoundPref(String prayerName, String sound) async {
    await NotificationPreferencesService.setPrayerSound(prayerName, sound);
    ref.invalidateSelf();
  }
}

@riverpod
class SpecificSoundPref extends _$SpecificSoundPref {
  @override
  Future<String> build(String prayerKey) {
    return NotificationPreferencesService.getSpecificSoundPreferences(
      prayerKey,
    );
  }

  Future<void> setSoundPref(String prayerKey, String sound) async {
    await NotificationPreferencesService.setPrayerSound(prayerKey, sound);
    ref.invalidateSelf();
  }
}

@riverpod
class AllAdvanceTimePref extends _$AllAdvanceTimePref {
  @override
  Future<Map<String, dynamic>> build() {
    return NotificationPreferencesService.getAllAdvanceTimePreferences()
        .then((m) => m.map((k, v) => MapEntry(k, v as dynamic)));
  }
}

@riverpod
class SpecificAdvanceTimePref extends _$SpecificAdvanceTimePref {
  @override
  Future<int> build(String prayerKey) {
    return NotificationPreferencesService.getSpecificAdvanceTimePreferences(
      prayerKey,
    );
  }

  Future<void> setAdvanceTimePref(String prayerKey, int mins) async {
    await NotificationPreferencesService.setPrayerAdvanceTime(prayerKey, mins);
    ref.invalidateSelf();
  }
}

@riverpod
class AllDayPref extends _$AllDayPref {
  @override
  Future<Map<String, dynamic>> build() {
    return NotificationPreferencesService.getAllDayPreferences()
        .then((m) => m.map((k, v) => MapEntry(k, v as dynamic)));
  }
}

@riverpod
class SpecificDayPref extends _$SpecificDayPref {
  @override
  Future<Set<String>> build(String prayerKey) {
    return NotificationPreferencesService.getSpecificDayPreferences(prayerKey);
  }

  Future<void> setDayPref(String prayerKey, Set<String> prefs) async {
    await NotificationPreferencesService.setPrayerSelectedDays(
      prayerKey,
      prefs,
    );
    ref.invalidateSelf();
  }
}
