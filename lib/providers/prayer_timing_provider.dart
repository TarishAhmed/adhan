import 'package:adhan/api/api_helper.dart';
import 'package:adhan/model/prayer_time_response_model.dart';
import 'package:adhan/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:collection/collection.dart';

part 'prayer_timing_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<PrayerTimeResponseModel> prayerTiming(
  Ref ref, {
  int method = 1,
  int school = 0,
  int latitudeAdjustmentMethod = 0,
}) async {
  final timezone = await ref.watch(getTimezoneProvider.future);
  final location = await ref.watch(locationProvider.future);
  final url = 'https://api.aladhan.com/v1/timings';
  final response = await ApiHelper.dio.get(
    url,
    queryParameters: {
      'latitude': location.lat,
      'longitude': location.lng,
      'method': method,
      'school': school,
      'latitudeAdjustmentMethod': latitudeAdjustmentMethod,
      'timezonestring': timezone,
    },
  );
  if (response.statusCode == 200 && response.data['code'] == 200) {
    return PrayerTimeResponseModel.fromJson(response.data);
  } else {
    throw Exception('Failed to fetch prayer times');
  }
}

PrayerTimeWithOffset getCurrentRelevantPrayerWithOffset(
  List<PrayerTime> prayers,
) {
  final now = DateTime.now();

  final upcomingPrayer = prayers.firstWhereOrNull((prayer) {
    return prayer.time.isAfter(TimeOfDay.fromDateTime(now));
  });

  DateTime upcomingPrayerDateTime = now.copyWith(
    hour: upcomingPrayer?.time.hour ?? prayers.first.time.hour,
    minute: upcomingPrayer?.time.minute ?? prayers.first.time.minute,
  );

  if (upcomingPrayer == null) {
    upcomingPrayerDateTime = upcomingPrayerDateTime.add(Duration(days: 1));
  }

  return PrayerTimeWithOffset(
    prayer: upcomingPrayer ?? prayers.first,
    offset: upcomingPrayerDateTime.difference(now),
    isUpcoming: upcomingPrayerDateTime.isAfter(now),
  );
}

@riverpod
Stream<PrayerTimeWithOffset> currentRelevantPrayer(Ref ref) async* {
  final prayerTimes = await ref.watch(prayerTimingProvider().future);

  final timings = [
    PrayerTime(
      time: prayerTimes.data?.timings?.fajr ?? TimeOfDay.now(),
      name: PrayerTimeName.fajr,
    ),
    PrayerTime(
      time: prayerTimes.data?.timings?.dhuhr ?? TimeOfDay.now(),
      name: PrayerTimeName.dhuhr,
    ),
    PrayerTime(
      time: prayerTimes.data?.timings?.asr ?? TimeOfDay.now(),
      name: PrayerTimeName.asr,
    ),
    PrayerTime(
      time: prayerTimes.data?.timings?.maghrib ?? TimeOfDay.now(),
      name: PrayerTimeName.maghrib,
    ),
    PrayerTime(
      time: prayerTimes.data?.timings?.isha ?? TimeOfDay.now(),
      name: PrayerTimeName.isha,
    ),
  ];

  while (true) {
    final relevant = getCurrentRelevantPrayerWithOffset(timings);
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
  final TimeOfDay time;
  final PrayerTimeName name;
  PrayerTime({required this.time, required this.name});
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
