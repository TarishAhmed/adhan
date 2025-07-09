import 'package:adhan/api/api_helper.dart';
import 'package:adhan/model/prayer_time_response_model.dart';
import 'package:adhan/model/prayer_timing_month_response_model.dart';
import 'package:adhan/providers/app_providers.dart';
import 'package:adhan/providers/storage_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/experimental/persist.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
// import 'package:riverpod_annotation/experimental/persist.dart';
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

    if(!kIsWeb) {
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
    final url =
        'https://api.aladhan.com/v1/calendar/${date.year}/${date.month}';
    final response = await ApiHelper.dio.get(
      url,
      queryParameters: {
        'latitude': location.lat,
        'longitude': location.lng,
        'method': method,
        'school': school,
        'latitudeAdjustmentMethod': latitudeAdjustmentMethod,
        'timezonestring': timezone,
        'iso8601': true,
      },
    );
    if (response.statusCode == 200 && response.data['code'] == 200) {
      return PrayerTimingMonthResponseModel.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch prayer times month');
    }
  }
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
  Datum? tomorrowsPrayers,
) {
  final now = DateTime.now();

  

  PrayerTime? upcomingPrayer = prayers.firstWhereOrNull(
    (prayer) => prayer.time.isAfter(now),
  );

  

  upcomingPrayer ??= (tomorrowsPrayers != null
      ? PrayerTime(
          time: tomorrowsPrayers.timings!.fajr!,
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

  

  if (prayerTimes.data == null) throw Exception('Error Fetching Prayer Data');
  final todaysPrayers = prayerTimes.data![now.day - 1];

  print('Prayer times 1: ${todaysPrayers}');

  

  final tomorrowsPrayers = prayerTimes.data!.length != now.day
      ? prayerTimes.data![now.day]
      : null;

  if (todaysPrayers.timings == null) {
    throw Exception('Error Fetching Prayer Data');
  }

  
  

  final timing = todaysPrayers.timings!;

  

  final timings = [
    PrayerTime(time: timing.fajr!, name: PrayerTimeName.fajr),
    PrayerTime(time: timing.dhuhr!, name: PrayerTimeName.dhuhr),
    PrayerTime(time: timing.asr!, name: PrayerTimeName.asr),
    PrayerTime(time: timing.maghrib!, name: PrayerTimeName.maghrib),
    PrayerTime(time: timing.isha!, name: PrayerTimeName.isha),
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
    return {
      'time': time.toIso8601String(),
      'name': name.name,
    };
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
