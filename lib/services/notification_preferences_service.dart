import 'package:adhan_app/services/reschedule_service.dart';
import 'package:adhan_app/utils/app_logger.dart';
import 'package:adhan_app/utils/sound_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _logName = 'adhan.notificationPrefs';

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
      AppLogger.e('Error getting notification preference for $prayerName', name: _logName, error: e);
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
      AppLogger.e('Error setting notification preference for $prayerName', name: _logName, error: e);
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
      AppLogger.e('Error setting sound preference for $prayerName', name: _logName, error: e);
    }
  }

  /// Get advance notification time for a specific prayer (in minutes)
  static Future<int> getPrayerAdvanceTime(String prayerName) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt('$_advanceTimePrefix${prayerName.toLowerCase()}') ??
          0;
    } catch (e) {
      AppLogger.e('Error getting advance time for $prayerName', name: _logName, error: e);
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
      AppLogger.e('Error setting advance time for $prayerName', name: _logName, error: e);
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
      AppLogger.e('Error getting all notification preferences', name: _logName, error: e);
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
      AppLogger.e('Error getting specific notification preferences', name: _logName, error: e);
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
      AppLogger.e('Error getting all sound preferences', name: _logName, error: e);
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
      AppLogger.e('Error getting specific sound preferences', name: _logName, error: e);
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
      AppLogger.e('Error getting all advance time preferences', name: _logName, error: e);
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
      AppLogger.e('Error getting all advance time preferences', name: _logName, error: e);
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

      AppLogger.i('All notification preferences reset to defaults', name: _logName);
    } catch (e) {
      AppLogger.e('Error resetting notification preferences', name: _logName, error: e);
    }
  }

  /// Check if any prayer notifications are enabled
  static Future<bool> hasAnyNotificationsEnabled() async {
    try {
      final preferences = await getAllNotificationPreferences();
      return preferences.values.any((enabled) => enabled);
    } catch (e) {
      AppLogger.e('Error checking if any notifications are enabled', name: _logName, error: e);
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
      AppLogger.e('Error getting enabled prayer notifications', name: _logName, error: e);
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
      AppLogger.e('Error getting selected days for $prayerName', name: _logName, error: e);
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
      AppLogger.e('Error setting selected days for $prayerName', name: _logName, error: e);
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
      AppLogger.e('Error getting all day preferences', name: _logName, error: e);
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
      AppLogger.e('Error getting all day preferences', name: _logName, error: e);
      return dayAbbreviations;
    }
  }
}
