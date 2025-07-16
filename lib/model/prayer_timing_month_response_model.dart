// To parse this JSON data, do
//
//     final prayerTimingMonthResponseModel = prayerTimingMonthResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'prayer_timing_month_response_model.freezed.dart';
part 'prayer_timing_month_response_model.g.dart';

PrayerTimingMonthResponseModel prayerTimingMonthResponseModelFromJson(
  String str,
) => PrayerTimingMonthResponseModel.fromJson(json.decode(str));

String prayerTimingMonthResponseModelToJson(
  PrayerTimingMonthResponseModel data,
) => json.encode(data.toJson());

@freezed
abstract class PrayerTimingMonthResponseModel with _$PrayerTimingMonthResponseModel {
  const factory PrayerTimingMonthResponseModel({
    @JsonKey(name: "locationInfo") LocationInfo? locationInfo,
    @JsonKey(name: "multiDayTimings") List<MultiDayTiming>? multiDayTimings,
  }) = _PrayerTimingMonthResponseModel;

  factory PrayerTimingMonthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimingMonthResponseModelFromJson(json);
}

@freezed
abstract class LocationInfo with _$LocationInfo {
  const factory LocationInfo({
    @JsonKey(name: "lat") String? lat,
    @JsonKey(name: "lng") String? lng,
    @JsonKey(name: "timezone") String? timezone,
  }) = _LocationInfo;

  factory LocationInfo.fromJson(Map<String, dynamic> json) =>
      _$LocationInfoFromJson(json);
}

@freezed
abstract class MultiDayTiming with _$MultiDayTiming {
  const factory MultiDayTiming({
    @JsonKey(name: "prayers") List<Prayer>? prayers,
    @JsonKey(name: "coordinates") Coordinates? coordinates,
    @JsonKey(
      name: "date",
      fromJson: DateTime.fromMillisecondsSinceEpoch,
      toJson: dateToMillisecondsSinceEpoch,
    )
    DateTime? date,
  }) = _MultiDayTiming;

  factory MultiDayTiming.fromJson(Map<String, dynamic> json) =>
      _$MultiDayTimingFromJson(json);
}

int? dateToMillisecondsSinceEpoch(DateTime? date) =>
    date?.millisecondsSinceEpoch;

@freezed
abstract class Coordinates with _$Coordinates {
  const factory Coordinates({
    @JsonKey(name: "latitude") double? latitude,
    @JsonKey(name: "longitude") double? longitude,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
}

@freezed
abstract class Prayer with _$Prayer {
  const factory Prayer({
    @JsonKey(name: "name") Name? name,
    @JsonKey(
      name: "time",
      fromJson: DateTime.fromMillisecondsSinceEpoch,
      toJson: dateToMillisecondsSinceEpoch,
    )
    DateTime? time,
    @JsonKey(name: "audio") String? audio,
  }) = _Prayer;

  factory Prayer.fromJson(Map<String, dynamic> json) => _$PrayerFromJson(json);
}

enum Name {
  @JsonValue("Asr")
  ASR,
  @JsonValue("Fajr")
  FAJR,
  @JsonValue("Isha")
  ISHA,
  @JsonValue("Maghrib")
  MAGHRIB,
  @JsonValue("Sunrise")
  SUNRISE,
  @JsonValue("Sunset")
  SUNSET,
  @JsonValue("Zuhr")
  ZUHR,
}

final nameValues = EnumValues({
  "Asr": Name.ASR,
  "Fajr": Name.FAJR,
  "Isha": Name.ISHA,
  "Maghrib": Name.MAGHRIB,
  "Sunrise": Name.SUNRISE,
  "Sunset": Name.SUNSET,
  "Zuhr": Name.ZUHR,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
