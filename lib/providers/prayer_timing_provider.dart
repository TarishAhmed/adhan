import 'package:adhan_app/model/prayer_timing_month_response_model.dart';
import 'package:adhan_app/providers/app_providers.dart';
import 'package:adhan_app/providers/storage_provider.dart';
import 'package:adhan_app/services/prayer_data_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/experimental/persist.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

part 'prayer_timing_provider.g.dart';

// @Riverpod(keepAlive: true)
// FutureOr<PrayerTimeResponseModel> prayerTiming(
//   Ref ref, {
//   int method = 1,
//   int school = 0,
//   int latitudeAdjustmentMethod = 0,
// }) async {
//   final timezone = await ref.watch(getTimezoneProvider.future);
//   final location = await ref.watch(locationProvider.future);
//   final url = 'https://api.aladhan.com/v1/timings';
//   final response = await ApiHelper.dio.get(
//     url,
//     queryParameters: {
//       'latitude': location.lat,
//       'longitude': location.lng,
//       'method': method,
//       'school': school,
//       'latitudeAdjustmentMethod': latitudeAdjustmentMethod,
//       'timezonestring': timezone,
//     },
//   );
//   if (response.statusCode == 200 && response.data['code'] == 200) {
//     return PrayerTimeResponseModel.fromJson(response.data);
//   } else {
//     throw Exception('Failed to fetch prayer times');
//   }
// }

@riverpod
@JsonPersist()
class PrayerTimeMonthNotifier extends _$PrayerTimeMonthNotifier {
  @override
  FutureOr<PrayerTimingMonthResponseModel> build({
    int method = 1,
    int school = 0,
    int latitudeAdjustmentMethod = 0,
  }) async {
    final now = DateTime.now();
    final remainingDuration = DateTime(
      now.year,
      now.month + 1,
    ).subtract(Duration(seconds: 1)).difference(now);

    if (!kIsWeb) {
      persist(
        // We pass our JsonSqFliteStorage instance. No need to "await" the Future.
        // Riverpod will take care of that.
        ref.watch(storageProvider.future),
        // By default, state is cached offline only for 2 days.
        // We can optionally uncomment the following line to change cache duration.
        options: StorageOptions(cacheTime: StorageCacheTime(remainingDuration)),
        decode: prayerTimingMonthResponseModelFromJson,
        encode: prayerTimingMonthResponseModelToJson,
      );
    }

    final timezone = await ref.watch(getTimezoneProvider.future);
    final location = await ref.watch(locationProvider.future);
    final date = DateTime.now();

    // Use the data manager to get prayer timings with caching
    return await PrayerDataManager.getPrayerTimingsForMonth(
      year: date.year,
      month: date.month,
      lat: location.lat.toString(),
      lng: location.lng.toString(),
      timezone: timezone,
    );
  }
}

// Provider to get prayer timing for a specific date
@riverpod
Future<MultiDayTiming?> prayerTimingForDate(Ref ref, DateTime date) async {
  final location = await ref.watch(locationProvider.future);

  // Use the data manager to get prayer timing for specific date
  return await PrayerDataManager.getPrayerTimingForDate(
    date: date,
    lat: location.lat.toString(),
    lng: location.lng.toString(),
  );
}

// Provider to check if data exists for a specific date
@riverpod
Future<bool> hasPrayerDataForDate(Ref ref, DateTime date) async {
  final location = await ref.watch(locationProvider.future);
  return await PrayerDataManager.hasDataForDate(
    date: date,
    lat: location.lat.toString(),
    lng: location.lng.toString(),
  );
}

// Provider to check if data exists for current month
@riverpod
Future<bool> hasPrayerDataForCurrentMonth(Ref ref) async {
  final location = await ref.watch(locationProvider.future);
  final now = DateTime.now();
  return await PrayerDataManager.hasDataForMonth(
    year: now.year,
    month: now.month,
    lat: location.lat.toString(),
    lng: location.lng.toString(),
  );
}

// FutureOr<PrayerTimingMonthResponseModel> prayerTimingMonth(
//   Ref ref, {
//   int method = 1,
//   int school = 0,
//   int latitudeAdjustmentMethod = 0,
// }) async {

// }

PrayerTimeWithOffset? getCurrentRelevantPrayerWithOffset(
  List<PrayerTime> prayers,
  MultiDayTiming? tomorrowsPrayers,
) {
  final now = DateTime.now();

  PrayerTime? upcomingPrayer = prayers.firstWhereOrNull(
    (prayer) => prayer.time.isAfter(now),
  );

  upcomingPrayer ??= (tomorrowsPrayers != null
      ? PrayerTime(
          time: tomorrowsPrayers.prayers![0].time!,
          name: PrayerTimeName.fajr,
        )
      : null);

  return upcomingPrayer != null
      ? PrayerTimeWithOffset(
          prayer: upcomingPrayer,
          offset: upcomingPrayer.time.difference(now),
          isUpcoming: upcomingPrayer.time.isAfter(now),
        )
      : null;
}

@riverpod
Stream<PrayerTimeWithOffset?> currentRelevantPrayer(Ref ref) async* {
  final prayerTimes = await ref.watch(prayerTimeMonthNotifierProvider().future);

  final now = DateTime.now();

  if (prayerTimes.multiDayTimings == null)
    throw Exception('Error Fetching Prayer Data');
  final todaysPrayers = prayerTimes.multiDayTimings![now.day - 1];

  print('Prayer times 1: ${todaysPrayers}');

  final tomorrowsPrayers = prayerTimes.multiDayTimings!.length != now.day
      ? prayerTimes.multiDayTimings![now.day]
      : null;

  if (todaysPrayers.prayers == null) {
    throw Exception('Error Fetching Prayer Data');
  }

  final timing = todaysPrayers.prayers!;

  final timings = [
    PrayerTime(time: timing[0].time!, name: PrayerTimeName.fajr),
    PrayerTime(time: timing[2].time!, name: PrayerTimeName.dhuhr),
    PrayerTime(time: timing[3].time!, name: PrayerTimeName.asr),
    PrayerTime(time: timing[5].time!, name: PrayerTimeName.maghrib),
    PrayerTime(time: timing[6].time!, name: PrayerTimeName.isha),
  ];

  while (true) {
    final relevant = getCurrentRelevantPrayerWithOffset(
      timings,
      tomorrowsPrayers,
    );
    yield relevant;
    await Future.delayed(const Duration(minutes: 1));
  }
}

class PrayerTimeWithOffset {
  final PrayerTime prayer;
  final Duration offset;
  final bool isUpcoming; // true = time remaining, false = already started

  PrayerTimeWithOffset({
    required this.prayer,
    required this.offset,
    required this.isUpcoming,
  });
}

class PrayerTime {
  final DateTime time;
  final PrayerTimeName name;
  PrayerTime({required this.time, required this.name});

  factory PrayerTime.fromJson(Map<String, dynamic> json) {
    return PrayerTime(
      time: DateTime.parse(json['time']),
      name: PrayerTimeName.values.byName(json['name']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'time': time.toIso8601String(), 'name': name.name};
  }
}

enum PrayerTimeName {
  fajr('Fajr'),
  sunrise('Sunrise'),
  dhuhr('Dhuhr'),
  asr('Asr'),
  maghrib('Maghrib'),
  isha('Isha'),
  imsak('Imsak'),
  midnight('Midnight'),
  firstthird('Firstthird'),
  lastthird('Lastthird');

  final String displayName;

  const PrayerTimeName(this.displayName);
}
