import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import '../model/prayer_timing_month_response_model.dart';

class PrayerDatabaseService {
  static Database? _database;
  static const String tableName = 'prayer_timings';
  static const String locationTableName = 'location_info';

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'prayer_timings.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static Future<void> _onCreate(Database db, int version) async {
    // Create prayer timings table
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        year INTEGER NOT NULL,
        month INTEGER NOT NULL,
        day INTEGER NOT NULL,
        location_lat TEXT,
        location_lng TEXT,
        location_timezone TEXT,
        prayer_data TEXT NOT NULL,
        created_at INTEGER NOT NULL,
        UNIQUE(year, month, day, location_lat, location_lng)
      )
    ''');

    // Create location info table
    await db.execute('''
      CREATE TABLE $locationTableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        lat TEXT NOT NULL,
        lng TEXT NOT NULL,
        timezone TEXT,
        last_updated INTEGER NOT NULL,
        UNIQUE(lat, lng)
      )
    ''');
  }

  // Store prayer timing data for a specific month
  static Future<void> storePrayerTimings(
    PrayerTimingMonthResponseModel data,
    String lat,
    String lng,
    String timezone,
  ) async {
    final db = await database;
    final now = DateTime.now().millisecondsSinceEpoch;

    // Store location info
    await db.insert(locationTableName, {
      'lat': lat,
      'lng': lng,
      'timezone': timezone,
      'last_updated': now,
    }, conflictAlgorithm: ConflictAlgorithm.replace);

    // Store each day's prayer data
    if (data.multiDayTimings != null) {
      for (int i = 0; i < data.multiDayTimings!.length; i++) {
        final dayTiming = data.multiDayTimings![i];
        if (dayTiming.date != null) {
          final day = dayTiming.date!.day;
          final month = dayTiming.date!.month;
          final year = dayTiming.date!.year;

          // Convert the day timing to JSON
          final dayData = {
            'prayers': dayTiming.prayers?.map((p) => p.toJson()).toList(),
            'coordinates': dayTiming.coordinates?.toJson(),
            'date': dayTiming.date?.millisecondsSinceEpoch,
          };

          await db.insert(tableName, {
            'year': year,
            'month': month,
            'day': day,
            'location_lat': lat,
            'location_lng': lng,
            'location_timezone': timezone,
            'prayer_data': jsonEncode(dayData),
            'created_at': now,
          }, conflictAlgorithm: ConflictAlgorithm.replace);
        }
      }
    }
  }

  // Get prayer timing data for a specific date
  static Future<MultiDayTiming?> getPrayerTimingForDate(
    DateTime date,
    String lat,
    String lng,
  ) async {
    final db = await database;
    final result = await db.query(
      tableName,
      where:
          'year = ? AND month = ? AND day = ? AND location_lat = ? AND location_lng = ?',
      whereArgs: [date.year, date.month, date.day, lat, lng],
    );

    if (result.isNotEmpty) {
      final prayerData = jsonDecode(result.first['prayer_data'] as String);

      // Convert back to MultiDayTiming object
      return MultiDayTiming.fromJson(prayerData);
    }
    return null;
  }

  // Get prayer timing data for a specific month
  static Future<PrayerTimingMonthResponseModel?> getPrayerTimingsForMonth(
    int year,
    int month,
    String lat,
    String lng,
  ) async {
    final db = await database;
    final result = await db.query(
      tableName,
      where: 'year = ? AND month = ? AND location_lat = ? AND location_lng = ?',
      whereArgs: [year, month, lat, lng],
      orderBy: 'day ASC',
    );

    if (result.isNotEmpty) {
      final multiDayTimings = <MultiDayTiming>[];

      for (final row in result) {
        final prayerData = jsonDecode(row['prayer_data'] as String);
        multiDayTimings.add(MultiDayTiming.fromJson(prayerData));
      }

      // Get location info
      final locationResult = await db.query(
        locationTableName,
        where: 'lat = ? AND lng = ?',
        whereArgs: [lat, lng],
      );

      LocationInfo? locationInfo;
      if (locationResult.isNotEmpty) {
        locationInfo = LocationInfo(
          lat: locationResult.first['lat'] as String?,
          lng: locationResult.first['lng'] as String?,
          timezone: locationResult.first['timezone'] as String?,
        );
      }

      return PrayerTimingMonthResponseModel(
        locationInfo: locationInfo,
        multiDayTimings: multiDayTimings,
      );
    }
    return null;
  }

  // Check if data exists for a specific month
  static Future<bool> hasDataForMonth(
    int year,
    int month,
    String lat,
    String lng,
  ) async {
    final db = await database;
    final result = await db.query(
      tableName,
      where: 'year = ? AND month = ? AND location_lat = ? AND location_lng = ?',
      whereArgs: [year, month, lat, lng],
      limit: 1,
    );
    return result.isNotEmpty;
  }

  // Check if data exists for a specific date
  static Future<bool> hasDataForDate(
    DateTime date,
    String lat,
    String lng,
  ) async {
    final db = await database;
    final result = await db.query(
      tableName,
      where:
          'year = ? AND month = ? AND day = ? AND location_lat = ? AND location_lng = ?',
      whereArgs: [date.year, date.month, date.day, lat, lng],
      limit: 1,
    );
    return result.isNotEmpty;
  }

  // Clear old data (older than 3 months)
  static Future<void> clearOldData() async {
    final db = await database;
    final threeMonthsAgo = DateTime.now().subtract(const Duration(days: 90));
    final cutoffTime = threeMonthsAgo.millisecondsSinceEpoch;

    await db.delete(
      tableName,
      where: 'created_at < ?',
      whereArgs: [cutoffTime],
    );
  }

  // Clear all data
  static Future<void> clearAllData() async {
    final db = await database;
    await db.delete(tableName);
    await db.delete(locationTableName);
  }

  // Close database
  static Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
