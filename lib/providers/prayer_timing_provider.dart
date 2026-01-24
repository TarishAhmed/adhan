import 'package:adhan_app/model/prayer_timing_month_response_model.dart';
import 'package:adhan_app/providers/app_providers.dart';
import 'package:adhan_app/providers/storage_provider.dart';
import 'package:adhan_app/services/prayer_data_manager.dart';
import 'package:adhan_app/services/home_widget_service.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/experimental/persist.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';
import 'package:adhan_app/utils/location_format_utils.dart';

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
      lat: formatLatitude(location.lat),
      lng: formatLongitude(location.lng),
      timezone: timezone,
    );
  }

  /// Refresh prayer times and update home widget
  Future<void> refreshPrayerTimes(ProviderContainer container) async {
    state = const AsyncValue.loading();
    try {
      final now = DateTime.now();
      final timezone = await ref.read(getTimezoneProvider.future);
      final location = await ref.read(locationProvider.future);

      final result = await PrayerDataManager.getPrayerTimingsForMonth(
        year: now.year,
        month: now.month,
        lat: formatLatitude(location.lat),
        lng: formatLongitude(location.lng),
        timezone: timezone,
      );

      state = AsyncValue.data(result);

      // Update home widget after refreshing prayer times
      await HomeWidgetService.updateNextPrayerWidget(container);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// Provider to get prayer timing for a specific date
@riverpod
Future<MultiDayTiming?> prayerTimingForDate(Ref ref, DateTime date) async {
  final location = await ref.watch(locationProvider.future);

  // Use the data manager to get prayer timing for specific date
  return await PrayerDataManager.getPrayerTimingForDate(
    date: date,
    lat: formatLatitude(location.lat),
    lng: formatLongitude(location.lng),
  );
}

// Provider to check if data exists for a specific date
@riverpod
Future<bool> hasPrayerDataForDate(Ref ref, DateTime date) async {
  final location = await ref.watch(locationProvider.future);
  return await PrayerDataManager.hasDataForDate(
    date: date,
    lat: formatLatitude(location.lat),
    lng: formatLongitude(location.lng),
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
    lat: formatLatitude(location.lat),
    lng: formatLongitude(location.lng),
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

  if (prayerTimes.multiDayTimings == null) {
    throw Exception('Error Fetching Prayer Data');
  }
  final todaysPrayers = prayerTimes.multiDayTimings![now.day - 1];

  final tomorrowsPrayers = prayerTimes.multiDayTimings!.length != now.day
      ? prayerTimes.multiDayTimings![now.day]
      : null;

  if (todaysPrayers.prayers == null) {
    throw Exception('Error Fetching Prayer Data');
  }

  final timing = todaysPrayers.prayers!;

  final timings = [
    PrayerTime(time: timing[0].time!, name: PrayerTimeName.fajr),
    PrayerTime(time: timing[2].time!, name: PrayerTimeName.zuhr),
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
  zuhr('Zuhr'),
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

class PrayerWindow {
  final PrayerTime current;
  final PrayerTime next;
  final double? progress; // 0..1, null if cannot compute
  final Duration? elapsed;
  final Duration? remaining;
  final PrayerUrgency urgency;
  final List<ProgressSegment> segments;

  PrayerWindow({
    required this.current,
    required this.next,
    required this.progress,
    required this.elapsed,
    required this.remaining,
    required this.urgency,
    required this.segments,
  });
}

enum PrayerUrgency { green, yellow, red }

class ProgressSegment {
  final double start; // 0..1
  final double end; // 0..1
  final PrayerUrgency urgency;

  const ProgressSegment({
    required this.start,
    required this.end,
    required this.urgency,
  });
}

@riverpod
Stream<PrayerWindow?> prayerTimeline(Ref ref) async* {
  final prayerTimes = await ref.watch(prayerTimeMonthNotifierProvider().future);

  final now = DateTime.now();

  if (prayerTimes.multiDayTimings == null) {
    throw Exception('Error Fetching Prayer Data');
  }
  final todaysPrayers = prayerTimes.multiDayTimings![now.day - 1];

  final tomorrowsPrayers = prayerTimes.multiDayTimings!.length != now.day
      ? prayerTimes.multiDayTimings![now.day]
      : null;

  if (todaysPrayers.prayers == null) {
    throw Exception('Error Fetching Prayer Data');
  }

  final timing = todaysPrayers.prayers!;

  final todayList = [
    PrayerTime(time: timing[0].time!, name: PrayerTimeName.fajr),
    PrayerTime(time: timing[2].time!, name: PrayerTimeName.zuhr),
    PrayerTime(time: timing[3].time!, name: PrayerTimeName.asr),
    PrayerTime(time: timing[5].time!, name: PrayerTimeName.maghrib),
    PrayerTime(time: timing[6].time!, name: PrayerTimeName.isha),
  ];

  while (true) {
    final DateTime nowLoop = DateTime.now();

    // Build window boundaries: Fajr..Zuhr..Asr..Maghrib..Isha..NextFajr
    final List<PrayerTime> boundaries = [...todayList];
    if (tomorrowsPrayers?.prayers != null &&
        tomorrowsPrayers!.prayers!.isNotEmpty &&
        tomorrowsPrayers.prayers![0].time != null) {
      boundaries.add(
        PrayerTime(
          time: tomorrowsPrayers.prayers![0].time!,
          name: PrayerTimeName.fajr,
        ),
      );
    }

    PrayerTime? current;
    PrayerTime? next;
    for (int i = 0; i < boundaries.length - 1; i++) {
      final start = boundaries[i];
      final end = boundaries[i + 1];
      if ((nowLoop.isAfter(start.time) ||
              nowLoop.isAtSameMomentAs(start.time)) &&
          nowLoop.isBefore(end.time)) {
        current = start;
        next = end;
        break;
      }
    }

    double? progress;
    Duration? elapsed;
    Duration? remaining;

    if (current != null && next != null) {
      final total = next.time.difference(current.time).inSeconds;
      final done = nowLoop.difference(current.time).inSeconds;
      if (total > 0 && done >= 0) {
        progress = done / total;
        elapsed = Duration(seconds: done);
        remaining = Duration(seconds: total - done);
      }
      // Determine urgency color band per prayer window rules
      final urgency = _computeUrgency(
        current: current,
        next: next,
        now: nowLoop,
        todayList: todayList,
      );
      // Compute multicolor segments for the window
      final segments = _computeSegments(
        current: current,
        next: next,
        now: nowLoop,
        todayList: todayList,
      );
      yield PrayerWindow(
        current: current,
        next: next,
        progress: progress?.clamp(0.0, 1.0),
        elapsed: elapsed,
        remaining: remaining,
        urgency: urgency,
        segments: segments,
      );
    } else {
      // Before today's Fajr or after tomorrow boundary: show next Fajr
      if (boundaries.isNotEmpty) {
        final first = boundaries.first;
        if (nowLoop.isBefore(first.time)) {
          yield PrayerWindow(
            current: PrayerTime(time: nowLoop, name: PrayerTimeName.isha),
            next: first,
            progress: null,
            elapsed: null,
            remaining: first.time.difference(nowLoop),
            urgency: PrayerUrgency.yellow,
            segments: const [
              ProgressSegment(
                start: 0,
                end: 2 / 3,
                urgency: PrayerUrgency.green,
              ),
              ProgressSegment(
                start: 2 / 3,
                end: 0.9,
                urgency: PrayerUrgency.yellow,
              ),
              ProgressSegment(start: 0.9, end: 1.0, urgency: PrayerUrgency.red),
            ],
          );
        } else {
          yield null;
        }
      } else {
        yield null;
      }
    }

    await Future.delayed(const Duration(minutes: 1));
  }
}

PrayerUrgency _computeUrgency({
  required PrayerTime current,
  required PrayerTime next,
  required DateTime now,
  required List<PrayerTime> todayList,
}) {
  final remaining = next.time.difference(now);

  // Always red in the last 10 minutes before the next prayer
  if (remaining.inMinutes <= 10) return PrayerUrgency.red;

  final total = next.time.difference(current.time).inSeconds;
  final done = now.difference(current.time).inSeconds;
  final progress = (total > 0) ? done / total : 1.0;

  switch (current.name) {
    case PrayerTimeName.fajr:
      // Green first third, yellow rest (till 10 min before sunrise)
      return (progress <= 0.33) ? PrayerUrgency.green : PrayerUrgency.yellow;

    case PrayerTimeName.zuhr:
    case PrayerTimeName.asr:
      // Green first half, yellow rest
      return (progress <= 0.5) ? PrayerUrgency.green : PrayerUrgency.yellow;

    case PrayerTimeName.maghrib:
      // Green first 20% of window (red glow), yellow rest
      return (progress <= 0.2) ? PrayerUrgency.green : PrayerUrgency.yellow;

    case PrayerTimeName.isha:
      // Green until (Maghrib + half of Maghrib→Fajr interval)
      final maghrib = todayList.firstWhere(
        (p) => p.name == PrayerTimeName.maghrib,
        orElse: () => current,
      );
      final midnight = maghrib.time.add(
        next.time.difference(maghrib.time) ~/ 2,
      );
      return (now.isBefore(midnight))
          ? PrayerUrgency.green
          : PrayerUrgency.yellow;

    default:
      return PrayerUrgency.yellow;
  }
}

List<ProgressSegment> _computeSegments({
  required PrayerTime current,
  required PrayerTime next,
  required DateTime now,
  required List<PrayerTime> todayList,
}) {
  final totalSeconds = next.time.difference(current.time).inSeconds;
  if (totalSeconds <= 0) {
    return const [
      ProgressSegment(start: 0, end: 1, urgency: PrayerUrgency.yellow),
    ];
  }

  const redTailSeconds = 600; // 10 minutes
  final redStart = (totalSeconds - redTailSeconds) / totalSeconds;

  double greenEnd;
  switch (current.name) {
    case PrayerTimeName.fajr:
      greenEnd = 1 / 3;
      break;
    case PrayerTimeName.zuhr:
    case PrayerTimeName.asr:
      greenEnd = 0.5;
      break;
    case PrayerTimeName.maghrib:
      greenEnd = 0.2;
      break;
    case PrayerTimeName.isha:
      final maghrib = todayList.firstWhere(
        (p) => p.name == PrayerTimeName.maghrib,
        orElse: () => current,
      );
      final midnight = maghrib.time.add(
        next.time.difference(maghrib.time) ~/ 2,
      );
      greenEnd = midnight.difference(current.time).inSeconds / totalSeconds;
      greenEnd = greenEnd.clamp(0.0, 1.0);
      break;
    default:
      greenEnd = 0.5;
  }

  final yellowEnd = redStart.clamp(0.0, 1.0);

  final segments = <ProgressSegment>[
    if (greenEnd > 0)
      ProgressSegment(start: 0.0, end: greenEnd, urgency: PrayerUrgency.green),
    if (yellowEnd > greenEnd)
      ProgressSegment(
        start: greenEnd,
        end: yellowEnd,
        urgency: PrayerUrgency.yellow,
      ),
    ProgressSegment(
      start: redStart.clamp(0.0, 1.0),
      end: 1.0,
      urgency: PrayerUrgency.red,
    ),
  ];

  return segments;
}

// Temporary non-generated provider to avoid requiring codegen immediately
final prayerTimelineStreamProvider = StreamProvider<PrayerWindow?>((ref) {
  return prayerTimeline(ref);
});

// Provider that automatically updates home widget when prayer times change
final homeWidgetUpdaterProvider = FutureProvider<void>((ref) async {
  // Listen to current prayer changes and update home widget
  ref.listen(currentRelevantPrayerProvider, (previous, next) {
    next.whenData((prayerTime) {
      if (prayerTime != null) {
        // Update home widget when prayer time changes
        HomeWidgetService.updateNextPrayerWidget(ref.container);
      }
    });
  });

  // Initial update
  await HomeWidgetService.updateNextPrayerWidget(ref.container);
});
