import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/prayer_database_service.dart';
import '../model/prayer_timing_month_response_model.dart';

part 'database_provider.g.dart';

@riverpod
class DatabaseNotifier extends _$DatabaseNotifier {
  @override
  Future<void> build() async {
    // Initialize database
    await PrayerDatabaseService.database;
  }

  // Store prayer timing data
  Future<void> storePrayerTimings(
    PrayerTimingMonthResponseModel data,
    String lat,
    String lng,
    String timezone,
  ) async {
    await PrayerDatabaseService.storePrayerTimings(data, lat, lng, timezone);
  }

  // Get prayer timing for a specific date
  Future<MultiDayTiming?> getPrayerTimingForDate(
    DateTime date,
    String lat,
    String lng,
  ) async {
    return await PrayerDatabaseService.getPrayerTimingForDate(date, lat, lng);
  }

  // Get prayer timing for a specific month
  Future<PrayerTimingMonthResponseModel?> getPrayerTimingsForMonth(
    int year,
    int month,
    String lat,
    String lng,
  ) async {
    return await PrayerDatabaseService.getPrayerTimingsForMonth(
      year,
      month,
      lat,
      lng,
    );
  }

  // Check if data exists for a specific date
  Future<bool> hasDataForDate(DateTime date, String lat, String lng) async {
    return await PrayerDatabaseService.hasDataForDate(date, lat, lng);
  }

  // Check if data exists for a specific month
  Future<bool> hasDataForMonth(
    int year,
    int month,
    String lat,
    String lng,
  ) async {
    return await PrayerDatabaseService.hasDataForMonth(year, month, lat, lng);
  }

  // Clear old data
  Future<void> clearOldData() async {
    await PrayerDatabaseService.clearOldData();
  }

  // Clear all data
  Future<void> clearAllData() async {
    await PrayerDatabaseService.clearAllData();
  }

  // Close database
  Future<void> close() async {
    await PrayerDatabaseService.close();
  }
}
