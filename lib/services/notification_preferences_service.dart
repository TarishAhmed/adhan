import 'package:adhan_app/utils/sound_utils.dart';
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

  /// Get sound preference for a specific prayer
  static Future<String> getPrayerSound(String prayerName) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('$_soundPrefix${prayerName.toLowerCase()}') ??
          'default';
    } catch (e) {
      print('Error getting sound preference for $prayerName: $e');
      return 'default';
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

  /// Get all sound preferences
  static Future<Map<String, String>> getAllSoundPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final Map<String, String> preferences = {};

      for (final prayer in prayerNames.keys) {
        preferences[prayer] =
            prefs.getString('$_soundPrefix$prayer') ??
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
        prayerNames.keys.map(
          (key) => MapEntry(key, dayAbbreviations),
        ),
      );
    }
  }
}
