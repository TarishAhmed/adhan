// To parse this JSON data, do
//
//     final prayerTimingMonthResponseModel = prayerTimingMonthResponseModelFromJson(jsonString);

import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
import 'package:collection/collection.dart';

part 'prayer_timing_month_response_model.freezed.dart';
part 'prayer_timing_month_response_model.g.dart';

PrayerTimingMonthResponseModel prayerTimingMonthResponseModelFromJson(
  String str,
) => PrayerTimingMonthResponseModel.fromJson(json.decode(str));

String prayerTimingMonthResponseModelToJson(
  PrayerTimingMonthResponseModel data,
) => json.encode(data.toJson());

@freezed
abstract class PrayerTimingMonthResponseModel
    with _$PrayerTimingMonthResponseModel {
  const factory PrayerTimingMonthResponseModel({
    LocationInfo? locationInfo,
    List<MultiDayTiming>? multiDayTimings,
  }) = _PrayerTimingMonthResponseModel;

  factory PrayerTimingMonthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimingMonthResponseModelFromJson(json);
}

@freezed
abstract class LocationInfo with _$LocationInfo {
  const factory LocationInfo({String? lat, String? lng, String? timezone}) =
      _LocationInfo;

  factory LocationInfo.fromJson(Map<String, dynamic> json) =>
      _$LocationInfoFromJson(json);
}

@freezed
abstract class MultiDayTiming with _$MultiDayTiming {
  const factory MultiDayTiming({
    List<Prayer>? prayers,
    Coordinates? coordinates,
    @JsonKey(
      fromJson: DateTime.fromMillisecondsSinceEpoch,
      toJson: dateToMillisecondsSinceEpoch,
    )
    DateTime? date,
  }) = _MultiDayTiming;

  factory MultiDayTiming.fromJson(Map<String, dynamic> json) {
    return _$MultiDayTimingFromJson(json);
  }
}

int? dateToMillisecondsSinceEpoch(DateTime? date) =>
    date?.millisecondsSinceEpoch;

@freezed
abstract class Coordinates with _$Coordinates {
  const factory Coordinates({double? latitude, double? longitude}) =
      _Coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
}

@freezed
abstract class Prayer with _$Prayer {
  const factory Prayer({
    @JsonKey(fromJson: PrayerName.fromJson, toJson: PrayerName.toJson)
    PrayerName? name,
    @JsonKey(
      fromJson: DateTime.fromMillisecondsSinceEpoch,
      toJson: dateToMillisecondsSinceEpoch,
    )
    DateTime? time,
    String? audio,
  }) = _Prayer;

  factory Prayer.fromJson(Map<String, dynamic> json) => _$PrayerFromJson(json);
}

enum PrayerName {
  ASR('Asr', 'asr'),
  FAJR('Fajr', 'fajr'),
  ISHA('Isha', 'isha'),
  MAGHRIB('Maghrib', 'maghrib'),
  SUNRISE('Sunrise', 'sunrise'),
  SUNSET('Sunset', 'sunset'),
  ZUHR('Zuhr', 'zuhr');

  const PrayerName(this.displayName, this.lCase);

  final String displayName;

  final String lCase;

  static PrayerName? fromJson(String prayer) {
    return PrayerName.values.firstWhereOrNull((enumVal) => enumVal.name == prayer.toUpperCase());
  }

  static String? toJson(PrayerName? prayerEnum) {
    return prayerEnum?.displayName;
  }
}
