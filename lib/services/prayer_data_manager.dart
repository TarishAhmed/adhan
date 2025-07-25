import 'package:adhan_app/model/prayer_timing_month_response_model.dart';
import 'package:adhan_app/services/prayer_database_service.dart';
import 'package:adhan_app/api/api_helper.dart';
import 'package:sqflite/sqflite.dart';

class PrayerDataManager {
  static const int _cacheValidityDays = 30; // Cache data for 30 days

  /// Get prayer timing data for a specific month, with caching
  static Future<PrayerTimingMonthResponseModel> getPrayerTimingsForMonth({
    required int year,
    required int month,
    required String lat,
    required String lng,
    required String timezone,
  }) async {
    try {
      // First, try to get data from local database
      final cachedData = await PrayerDatabaseService.getPrayerTimingsForMonth(
        year,
        month,
        lat,
        lng,
      );

      // Check if cached data is still valid
      if (cachedData != null && _isDataValid(cachedData)) {
        print('Using cached prayer timing data for $year-$month');
        return cachedData;
      }

      // If no valid cached data, fetch from API
      print('Fetching prayer timing data from API for $year-$month');
      final apiData = await _fetchFromAPI(year, month, lat, lng);

      // Store the fetched data in the database
      await PrayerDatabaseService.storePrayerTimings(
        apiData,
        lat,
        lng,
        timezone,
      );

      return apiData;
    } catch (e) {
      print('Error getting prayer timings: $e');
      rethrow;
    }
  }

  /// Get prayer timing data for a specific date
  static Future<MultiDayTiming?> getPrayerTimingForDate({
    required DateTime date,
    required String lat,
    required String lng,
  }) async {
    try {
      // Try to get data from local database first
      final cachedData = await PrayerDatabaseService.getPrayerTimingForDate(
        date,
        lat,
        lng,
      );

      if (cachedData != null) {
        print(
          'Using cached prayer timing data for ${date.year}-${date.month}-${date.day}',
        );
        return cachedData;
      }

      // If no cached data, fetch the entire month
      final monthData = await getPrayerTimingsForMonth(
        year: date.year,
        month: date.month,
        lat: lat,
        lng: lng,
        timezone: await _getTimezone(),
      );

      // Find the specific day in the month data
      if (monthData.multiDayTimings != null) {
        for (final dayTiming in monthData.multiDayTimings!) {
          if (dayTiming.date != null &&
              dayTiming.date!.year == date.year &&
              dayTiming.date!.month == date.month &&
              dayTiming.date!.day == date.day) {
            return dayTiming;
          }
        }
      }

      return null;
    } catch (e) {
      print('Error getting prayer timing for date: $e');
      rethrow;
    }
  }

  /// Check if data exists for a specific date
  static Future<bool> hasDataForDate({
    required DateTime date,
    required String lat,
    required String lng,
  }) async {
    try {
      return await PrayerDatabaseService.hasDataForDate(date, lat, lng);
    } catch (e) {
      print('Error checking data existence: $e');
      return false;
    }
  }

  /// Check if data exists for a specific month
  static Future<bool> hasDataForMonth({
    required int year,
    required int month,
    required String lat,
    required String lng,
  }) async {
    try {
      return await PrayerDatabaseService.hasDataForMonth(year, month, lat, lng);
    } catch (e) {
      print('Error checking month data existence: $e');
      return false;
    }
  }

  /// Fetch data from API
  static Future<PrayerTimingMonthResponseModel> _fetchFromAPI(
    int year,
    int month,
    String lat,
    String lng,
  ) async {
    final url = 'https://www.alislam.org/adhan/api/timings/month';
    final response = await ApiHelper.instance.dio.get(
      url,
      queryParameters: {'lat': lat, 'lng': lng, 'month': month, 'year': year},
    );

    if (response.statusCode == 200) {
      return PrayerTimingMonthResponseModel.fromJson(response.data);
    } else {
      throw Exception(
        'Failed to fetch prayer times month: ${response.statusCode}',
      );
    }
  }

  /// Check if cached data is still valid
  static bool _isDataValid(PrayerTimingMonthResponseModel data) {
    if (data.multiDayTimings == null || data.multiDayTimings!.isEmpty) {
      return false;
    }

    // Check if the data contains current or future dates
    final now = DateTime.now();
    for (final dayTiming in data.multiDayTimings!) {
      if (dayTiming.date != null && dayTiming.date!.isAfter(now)) {
        return true;
      }
    }

    return false;
  }

  /// Get timezone (placeholder - should be replaced with actual timezone provider)
  static Future<String> _getTimezone() async {
    // This should be replaced with actual timezone provider
    return 'UTC';
  }

  /// Clear old data
  static Future<void> clearOldData() async {
    try {
      await PrayerDatabaseService.clearOldData();
      print('Old prayer timing data cleared successfully');
    } catch (e) {
      print('Error clearing old data: $e');
    }
  }

  /// Clear all data
  static Future<void> clearAllData() async {
    try {
      await PrayerDatabaseService.clearAllData();
      print('All prayer timing data cleared successfully');
    } catch (e) {
      print('Error clearing all data: $e');
    }
  }

  /// Get database statistics
  static Future<Map<String, dynamic>> getDatabaseStats() async {
    try {
      final db = await PrayerDatabaseService.database;
      final prayerCount =
          Sqflite.firstIntValue(
            await db.rawQuery(
              'SELECT COUNT(*) FROM ${PrayerDatabaseService.tableName}',
            ),
          ) ??
          0;
      final locationCount =
          Sqflite.firstIntValue(
            await db.rawQuery(
              'SELECT COUNT(*) FROM ${PrayerDatabaseService.locationTableName}',
            ),
          ) ??
          0;

      return {
        'prayer_records': prayerCount,
        'location_records': locationCount,
        'database_size': await _getDatabaseSize(),
      };
    } catch (e) {
      print('Error getting database stats: $e');
      return {};
    }
  }

  /// Store prayer timings directly (for background service use)
  static Future<void> storePrayerTimings(
    PrayerTimingMonthResponseModel data,
    String lat,
    String lng,
    String timezone,
  ) async {
    try {
      await PrayerDatabaseService.storePrayerTimings(data, lat, lng, timezone);
      print('PrayerDataManager: Successfully stored prayer timings');
    } catch (e) {
      print('PrayerDataManager: Error storing prayer timings: $e');
      rethrow;
    }
  }

  /// Get database file size
  static Future<int> _getDatabaseSize() async {
    try {
      final db = await PrayerDatabaseService.database;
      final path = db.path;
      // This is a simplified approach - in a real app you might want to use dart:io
      return 0; // Placeholder
    } catch (e) {
      return 0;
    }
  }
}
