import 'dart:io';

import 'package:adhan_app/model/prayer_timing_month_response_model.dart';
import 'package:adhan_app/services/prayer_database_service.dart';
import 'package:adhan_app/services/home_widget_service.dart';
import 'package:adhan_app/api/api_helper.dart';
import 'package:adhan_app/utils/app_logger.dart';
import 'package:riverpod/src/framework.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerDataManager {
  static const _logName = 'adhan.prayerData';

  /// Get prayer timing data for a specific month, with caching
  static Future<PrayerTimingMonthResponseModel> getPrayerTimingsForMonth({
    required int year,
    required int month,
    required String lat,
    required String lng,
    required String timezone,
  }) async {
    try {
      final cachedData = await PrayerDatabaseService.getPrayerTimingsForMonth(
        year,
        month,
        lat,
        lng,
      );

      if (cachedData != null && _isDataValid(cachedData)) {
        AppLogger.i(
          'Using cached prayer timing data for $year-$month',
          name: _logName,
        );
        return cachedData;
      }

      AppLogger.i(
        'Fetching prayer timing data from API for $year-$month',
        name: _logName,
      );
      final apiData = await _fetchFromAPI(year, month, lat, lng);

      await PrayerDatabaseService.storePrayerTimings(
        apiData,
        lat,
        lng,
        timezone,
      );

      return apiData;
    } catch (e, st) {
      AppLogger.e(
        'Error getting prayer timings',
        name: _logName,
        error: e,
        stackTrace: st,
      );
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
      final cachedData = await PrayerDatabaseService.getPrayerTimingForDate(
        date,
        lat,
        lng,
      );

      if (cachedData != null) {
        AppLogger.i(
          'Using cached prayer timing data for ${date.year}-${date.month}-${date.day}',
          name: _logName,
        );
        return cachedData;
      }

      final monthData = await getPrayerTimingsForMonth(
        year: date.year,
        month: date.month,
        lat: lat,
        lng: lng,
        timezone: await _getTimezone(),
      );

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
    } catch (e, st) {
      AppLogger.e(
        'Error getting prayer timing for date',
        name: _logName,
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  /// Ensure proactive cache for current and next [monthsToCover-1] months.
  static Future<void> ensureProactiveCacheForLocation({
    required String lat,
    required String lng,
    required String timezone,
    int monthsToCover = 3,
  }) async {
    try {
      final now = DateTime.now();
      for (int offset = 0; offset < monthsToCover; offset++) {
        final target = DateTime(now.year, now.month + offset, 1);
        final year = target.year;
        final month = target.month;

        final hasMonth = await hasDataForMonth(
          year: year,
          month: month,
          lat: lat,
          lng: lng,
        );
        if (!hasMonth) {
          final data = await _fetchFromAPI(year, month, lat, lng);
          await PrayerDatabaseService.storePrayerTimings(
            data,
            lat,
            lng,
            timezone,
          );
          AppLogger.i(
            'Proactive cache stored for $year-$month',
            name: _logName,
          );
        }
      }
    } catch (e, st) {
      AppLogger.e(
        'Error ensuring proactive cache',
        name: _logName,
        error: e,
        stackTrace: st,
      );
    }
  }

  /// Whether we are close to month boundary (within [thresholdDays]).
  static bool isNearMonthBoundary({int thresholdDays = 3}) {
    final now = DateTime.now();
    final lastDay = DateTime(now.year, now.month + 1, 0).day;
    final daysLeft = lastDay - now.day;
    return daysLeft <= thresholdDays;
  }

  /// Check if data exists for a specific date
  static Future<bool> hasDataForDate({
    required DateTime date,
    required String lat,
    required String lng,
  }) async {
    try {
      return await PrayerDatabaseService.hasDataForDate(date, lat, lng);
    } catch (e, st) {
      AppLogger.w(
        'Error checking data existence',
        name: _logName,
        error: e,
        stackTrace: st,
      );
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
    } catch (e, st) {
      AppLogger.w(
        'Error checking month data existence',
        name: _logName,
        error: e,
        stackTrace: st,
      );
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
    return 'UTC';
  }

  /// Clear old data
  static Future<void> clearOldData(ProviderContainer container) async {
    try {
      await PrayerDatabaseService.clearOldData();
      AppLogger.i(
        'Old prayer timing data cleared successfully',
        name: _logName,
      );
    } catch (e, st) {
      AppLogger.e(
        'Error clearing old data',
        name: _logName,
        error: e,
        stackTrace: st,
      );
    }
  }

  /// Clear all data
  static Future<void> clearAllData() async {
    try {
      await PrayerDatabaseService.clearAllData();
      AppLogger.i(
        'All prayer timing data cleared successfully',
        name: _logName,
      );
    } catch (e, st) {
      AppLogger.e(
        'Error clearing all data',
        name: _logName,
        error: e,
        stackTrace: st,
      );
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
        'generated_at': DateTime.now().toIso8601String(),
      };
    } catch (e, st) {
      AppLogger.e(
        'Error getting database stats',
        name: _logName,
        error: e,
        stackTrace: st,
      );
      return {};
    }
  }

  /// Store prayer timings directly (for background service use)
  static Future<void> storePrayerTimings(
    PrayerTimingMonthResponseModel data,
    String lat,
    String lng,
    String timezone,
    ProviderContainer container,
  ) async {
    try {
      await PrayerDatabaseService.storePrayerTimings(data, lat, lng, timezone);
      AppLogger.i(
        'PrayerDataManager: Successfully stored prayer timings',
        name: _logName,
      );

      await HomeWidgetService.updateNextPrayerWidget(container);
    } catch (e, st) {
      AppLogger.e(
        'PrayerDataManager: Error storing prayer timings',
        name: _logName,
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  /// Get database file size
  static Future<int> _getDatabaseSize() async {
    try {
      final db = await PrayerDatabaseService.database;
      final path = db.path;
      if (path.isEmpty) return 0;
      final file = File(path);
      if (await file.exists()) {
        return await file.length();
      }
      return 0;
    } catch (e) {
      return 0;
    }
  }

  /// Collect and persist metrics for diagnostics.
  static Future<void> collectAndPersistMetrics(
    ProviderContainer container,
  ) async {
    try {
      final stats = await getDatabaseStats();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('db_metrics', stats.toString());
    } catch (e, st) {
      AppLogger.w(
        'Error persisting DB metrics',
        name: _logName,
        error: e,
        stackTrace: st,
      );
    }
  }
}
