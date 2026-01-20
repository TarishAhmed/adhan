import 'dart:async';

import 'package:adhan_app/utils/sound_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adhan_app/services/reschedule_service.dart';

const dayAbbreviations = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};

class NotificationPreferencesService {
  static const String _prefix = 'notification_pref_';
  static const String _soundPrefix = 'notification_sound_';
  static const String _advanceTimePrefix = 'notification_advance_';
  static const String _daysPrefix = 'notification_days_';

  // Prayer time names for preferences
  static const Map<String, String> prayerNames = {
    'fajr': 'Fajr',
    'sunrise': 'Sunrise',
    'zuhr': 'Zuhr',
    'asr': 'Asr',
    'maghrib': 'Maghrib',
    'isha': 'Isha',
  };

  /// Get notification preference for a specific prayer
  static Future<bool> getPrayerNotificationEnabled(String prayerName) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool('$_prefix${prayerName.toLowerCase()}') ?? true;
    } catch (e) {
      print('Error getting notification preference for $prayerName: $e');
      return true; // Default to enabled
    }
  }

  /// Set notification preference for a specific prayer
  static Future<void> setPrayerNotificationEnabled(
    String prayerName,
    bool enabled,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('$_prefix${prayerName.toLowerCase()}', enabled);
      await RescheduleService.markNeedsReschedule();
      await RescheduleService.enqueueImmediateReschedule();
    } catch (e) {
      print('Error setting notification preference for $prayerName: $e');
    }
  }



  /// Set sound preference for a specific prayer
  static Future<void> setPrayerSound(String prayerName, String sound) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('$_soundPrefix${prayerName.toLowerCase()}', sound);
      await RescheduleService.markNeedsReschedule();
      await RescheduleService.enqueueImmediateReschedule();
    } catch (e) {
      print('Error setting sound preference for $prayerName: $e');
    }
  }

  /// Get advance notification time for a specific prayer (in minutes)
  static Future<int> getPrayerAdvanceTime(String prayerName) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt('$_advanceTimePrefix${prayerName.toLowerCase()}') ??
          0;
    } catch (e) {
      print('Error getting advance time for $prayerName: $e');
      return 0;
    }
  }

  /// Set advance notification time for a specific prayer (in minutes)
  static Future<void> setPrayerAdvanceTime(
    String prayerName,
    int minutes,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(
        '$_advanceTimePrefix${prayerName.toLowerCase()}',
        minutes,
      );
      await RescheduleService.markNeedsReschedule();
      await RescheduleService.enqueueImmediateReschedule();
    } catch (e) {
      print('Error setting advance time for $prayerName: $e');
    }
  }

  /// Get all notification preferences
  ///
  static Future<Map<String, bool>> getAllNotificationPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final Map<String, bool> preferences = {};

      for (final prayer in prayerNames.keys) {
        preferences[prayer] = prefs.getBool('$_prefix$prayer') ?? false;
      }

      return preferences;
    } catch (e) {
      print('Error getting all notification preferences: $e');
      return Map.fromEntries(
        prayerNames.keys.map((key) => MapEntry(key, false)),
      );
    }
  }

  static Future<bool> getSpecificNotificationPreferences(String prayerKey) async {
    const defaultNotificationPref = false;
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool('$_prefix$prayerKey') ?? defaultNotificationPref;
    } catch (e) {
      print('Error getting specific notification preferences: $e');
      return defaultNotificationPref;
    }
  }

  /// Get all sound preferences
  static Future<Map<String, String>> getAllSoundPreferences() async {
    try {
      final pref = await SharedPreferences.getInstance();
      final Map<String, String> preferences = {};

      for (final prayer in prayerNames.keys) {
        preferences[prayer] =
            pref.getString('$_soundPrefix$prayer') ??
            AdhanAudioLibrary.defaultAdhan.url;
      }

      return preferences;
    } catch (e) {
      print('Error getting all sound preferences: $e');
      return Map.fromEntries(
        prayerNames.keys.map(
          (key) => MapEntry(key, AdhanAudioLibrary.defaultAdhan.url),
        ),
      );
    }
  }

  static Future<String> getSpecificSoundPreferences(String prayerKey) async {
    final defaultSound = AdhanAudioLibrary.defaultAdhan.url;
    try {
      final pref = await SharedPreferences.getInstance();
      return pref.getString('$_soundPrefix$prayerKey') ?? defaultSound;
    } catch (e) {
      print('Error getting specific sound preferences: $e');
      return defaultSound;
    }
  }

  /// Get all advance time preferences
  static Future<Map<String, int>> getAllAdvanceTimePreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final Map<String, int> preferences = {};

      for (final prayer in prayerNames.keys) {
        preferences[prayer] = prefs.getInt('$_advanceTimePrefix$prayer') ?? 0;
      }

      return preferences;
    } catch (e) {
      print('Error getting all advance time preferences: $e');
      return Map.fromEntries(prayerNames.keys.map((key) => MapEntry(key, 0)));
    }
  }

  static Future<int> getSpecificAdvanceTimePreferences(String prayerKey) async {
    final defaultAdvanceTime = 0;
    try {
      final pref = await SharedPreferences.getInstance();
      // final Map<String, int> preferences = {};
      return pref.getInt('$_advanceTimePrefix$prayerKey') ?? defaultAdvanceTime;
      // for (final prayer in prayerNames.keys) {
      // }
      // return preferences;
    } catch (e) {
      print('Error getting all advance time preferences: $e');
      return defaultAdvanceTime;
    }
  }

  /// Reset all preferences to defaults
  static Future<void> resetAllPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Remove all notification preferences
      for (final prayer in prayerNames.keys) {
        await prefs.remove('$_prefix$prayer');
        await prefs.remove('$_soundPrefix$prayer');
        await prefs.remove('$_advanceTimePrefix$prayer');
        await prefs.remove('$_daysPrefix$prayer');
      }

      print('All notification preferences reset to defaults');
    } catch (e) {
      print('Error resetting notification preferences: $e');
    }
  }

  /// Check if any prayer notifications are enabled
  static Future<bool> hasAnyNotificationsEnabled() async {
    try {
      final preferences = await getAllNotificationPreferences();
      return preferences.values.any((enabled) => enabled);
    } catch (e) {
      print('Error checking if any notifications are enabled: $e');
      return true; // Default to true
    }
  }

  /// Get enabled prayer notifications
  static Future<List<String>> getEnabledPrayerNotifications() async {
    try {
      final preferences = await getAllNotificationPreferences();
      return preferences.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList();
    } catch (e) {
      print('Error getting enabled prayer notifications: $e');
      return prayerNames.keys.toList(); // Default to all enabled
    }
  }

  /// Get selected days for a specific prayer
  static Future<Set<String>> getPrayerSelectedDays(String prayerName) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final daysString = prefs.getString(
        '$_daysPrefix${prayerName.toLowerCase()}',
      );
      if (daysString != null && daysString.isNotEmpty) {
        return daysString.split(',').toSet();
      }
      // Default to all days selected
      return dayAbbreviations;
    } catch (e) {
      print('Error getting selected days for $prayerName: $e');
      return dayAbbreviations; // Default to all days
    }
  }

  /// Set selected days for a specific prayer
  static Future<void> setPrayerSelectedDays(
    String prayerName,
    Set<String> days,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final daysString = days.join(',');
      await prefs.setString(
        '$_daysPrefix${prayerName.toLowerCase()}',
        daysString,
      );
      await RescheduleService.markNeedsReschedule();
      await RescheduleService.enqueueImmediateReschedule();
    } catch (e) {
      print('Error setting selected days for $prayerName: $e');
    }
  }

  /// Get all day preferences
  static Future<Map<String, Set<String>>> getAllDayPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final Map<String, Set<String>> preferences = {};

      for (final prayer in prayerNames.keys) {
        final daysString = prefs.getString('$_daysPrefix$prayer');
        if (daysString != null && daysString.isNotEmpty) {
          preferences[prayer] = daysString.split(',').toSet();
        } else {
          // Default to all days selected
          preferences[prayer] = dayAbbreviations;
        }
      }

      return preferences;
    } catch (e) {
      print('Error getting all day preferences: $e');
      return Map.fromEntries(
        prayerNames.keys.map((key) => MapEntry(key, dayAbbreviations)),
      );
    }
  }

  static Future<Set<String>> getSpecificDayPreferences(String prayerKey) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final daysString = prefs.getString('$_daysPrefix$prayerKey');
        if (daysString != null && daysString.isNotEmpty) {
          return daysString.split(',').toSet();
        } else {
          // Default to all days selected
          return dayAbbreviations;
        }
    } catch (e) {
      print('Error getting all day preferences: $e');
      return dayAbbreviations;
    }
  }
}

final allNotificationPrefProvider =
    AsyncNotifierProvider<AllNotificationPrefNotifier, Map<String, dynamic>>(
      AllNotificationPrefNotifier.new,
    );

final specificNotificationPrefProvider =
    AsyncNotifierProvider.family<SpecificNotificationPrefNotifier, bool, String>(
      SpecificNotificationPrefNotifier.new,
    );

final allSoundPrefProvider =
    AsyncNotifierProvider<AllSoundPrefNotifier, Map<String, dynamic>>(
      AllSoundPrefNotifier.new,
    );

final specificSoundPrefProvider =
    AsyncNotifierProvider.family<SpecificSoundPrefNotifier, String, String>(
      SpecificSoundPrefNotifier.new,
    );

final allAdvanceTimePrefProvider =
    AsyncNotifierProvider<AllAdvanceTimePrefNotifier, Map<String, dynamic>>(
      AllAdvanceTimePrefNotifier.new,
    );

final specificAdvanceTimePrefProvider =
    AsyncNotifierProvider.family<SpecificAdvanceTimePrefNotifier, int, String>(
      SpecificAdvanceTimePrefNotifier.new,
    );

final allDayPrefProvider =
    AsyncNotifierProvider<AllDayPrefNotifier, Map<String, dynamic>>(
      AllDayPrefNotifier.new,
    );

final specificDayPrefProvider =
    AsyncNotifierProvider.family<SpecificDayPrefNotifier, Set<String>, String>(
      SpecificDayPrefNotifier.new,
    );

class AllNotificationPrefNotifier extends AsyncNotifier<Map<String, dynamic>> {
  @override
  FutureOr<Map<String, dynamic>> build() {
    return NotificationPreferencesService.getAllNotificationPreferences();
  }
}

class SpecificNotificationPrefNotifier extends FamilyAsyncNotifier<bool, String> {
  @override
  FutureOr<bool> build(String prayerKey) {
    return NotificationPreferencesService.getSpecificNotificationPreferences(prayerKey);
  }

  Future<void> toggleNotification(String prayerName, bool isNotificationEnabled) async {
    await NotificationPreferencesService.setPrayerNotificationEnabled(prayerName, isNotificationEnabled);
    ref.invalidateSelf();
  }
}

class AllSoundPrefNotifier extends AsyncNotifier<Map<String, dynamic>> {
  @override
  FutureOr<Map<String, dynamic>> build() async {
    return await NotificationPreferencesService.getAllSoundPreferences();
  }

  Future<void> setSoundPref(String prayerName, String sound) async {
    await NotificationPreferencesService.setPrayerSound(prayerName, sound);
    ref.invalidateSelf();
  }
}

class SpecificSoundPrefNotifier extends FamilyAsyncNotifier<String, String> {
  @override
  FutureOr<String> build(String prayerKey) async {
    return await NotificationPreferencesService.getSpecificSoundPreferences(prayerKey);
  }

  Future<void> setSoundPref(String prayerKey, String sound) async {
    await NotificationPreferencesService.setPrayerSound(prayerKey, sound);
    ref.invalidateSelf();
  }
}

class SpecificDayPrefNotifier extends FamilyAsyncNotifier<Set<String>, String> {
  @override
  FutureOr<Set<String>> build(String prayerKey) async {
    return await NotificationPreferencesService.getSpecificDayPreferences(prayerKey);
  }

  Future<void> setDayPref(String prayerKey, Set<String> prefs) async {
    await NotificationPreferencesService.setPrayerSelectedDays(prayerKey, prefs);
    ref.invalidateSelf();
  }
}

class AllAdvanceTimePrefNotifier extends AsyncNotifier<Map<String, dynamic>> {
  @override
  FutureOr<Map<String, dynamic>> build() {
    return NotificationPreferencesService.getAllSoundPreferences();
  }
}

class SpecificAdvanceTimePrefNotifier extends FamilyAsyncNotifier<int, String> {
  @override
  FutureOr<int> build(String prayerKey) {
    return NotificationPreferencesService.getSpecificAdvanceTimePreferences(prayerKey);
  }

  Future<void> setAdvanceTimePref(String prayerKey, int mins) async {
    await NotificationPreferencesService.setPrayerAdvanceTime(prayerKey, mins);
    ref.invalidateSelf();
  }
}

class AllDayPrefNotifier extends AsyncNotifier<Map<String, dynamic>> {
  @override
  FutureOr<Map<String, dynamic>> build() {
    return NotificationPreferencesService.getAllSoundPreferences();
  }
}
