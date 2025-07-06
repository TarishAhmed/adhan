// To parse this JSON data, do
//
//     final prayerTimeResponseModel = prayerTimeResponseModelFromJson(jsonString);

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

part 'prayer_time_response_model.freezed.dart';
part 'prayer_time_response_model.g.dart';

PrayerTimeResponseModel prayerTimeResponseModelFromJson(String str) => PrayerTimeResponseModel.fromJson(json.decode(str));

String prayerTimeResponseModelToJson(PrayerTimeResponseModel data) => json.encode(data.toJson());

@freezed
abstract class PrayerTimeResponseModel with _$PrayerTimeResponseModel {
    const factory PrayerTimeResponseModel({
        @JsonKey(name: "code")
        final int? code,
        @JsonKey(name: "status")
        final String? status,
        @JsonKey(name: "data")
        final Data? data,
    }) = _PrayerTimeResponseModel;

    factory PrayerTimeResponseModel.fromJson(Map<String, dynamic> json) => _$PrayerTimeResponseModelFromJson(json);
}

@freezed
abstract class Data with _$Data {
    const factory Data({
        @JsonKey(name: "timings")
        final Timings? timings,
        @JsonKey(name: "date")
        final Date? date,
        @JsonKey(name: "meta")
        final Meta? meta,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
abstract class Date with _$Date {
    const factory Date({
        @JsonKey(name: "readable")
        final String? readable,
        @JsonKey(name: "timestamp")
        final String? timestamp,
        @JsonKey(name: "hijri")
        final Hijri? hijri,
        @JsonKey(name: "gregorian")
        final Gregorian? gregorian,
    }) = _Date;

    factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);
}

@freezed
abstract class Gregorian with _$Gregorian {
    const factory Gregorian({
        @JsonKey(name: "date")
        final String? date,
        @JsonKey(name: "format")
        final String? format,
        @JsonKey(name: "day")
        final String? day,
        @JsonKey(name: "weekday")
        final GregorianWeekday? weekday,
        @JsonKey(name: "month")
        final GregorianMonth? month,
        @JsonKey(name: "year")
        final String? year,
        @JsonKey(name: "designation")
        final Designation? designation,
        @JsonKey(name: "lunarSighting")
        final bool? lunarSighting,
    }) = _Gregorian;

    factory Gregorian.fromJson(Map<String, dynamic> json) => _$GregorianFromJson(json);
}

@freezed
abstract class Designation with _$Designation {
    const factory Designation({
        @JsonKey(name: "abbreviated")
        final String? abbreviated,
        @JsonKey(name: "expanded")
        final String? expanded,
    }) = _Designation;

    factory Designation.fromJson(Map<String, dynamic> json) => _$DesignationFromJson(json);
}

@freezed
abstract class GregorianMonth with _$GregorianMonth {
    const factory GregorianMonth({
        @JsonKey(name: "number")
        final int? number,
        @JsonKey(name: "en")
        final String? en,
    }) = _GregorianMonth;

    factory GregorianMonth.fromJson(Map<String, dynamic> json) => _$GregorianMonthFromJson(json);
}

@freezed
abstract class GregorianWeekday with _$GregorianWeekday {
    const factory GregorianWeekday({
        @JsonKey(name: "en")
        final String? en,
    }) = _GregorianWeekday;

    factory GregorianWeekday.fromJson(Map<String, dynamic> json) => _$GregorianWeekdayFromJson(json);
}

@freezed
abstract class Hijri with _$Hijri {
    const factory Hijri({
        @JsonKey(name: "date")
        final String? date,
        @JsonKey(name: "format")
        final String? format,
        @JsonKey(name: "day")
        final String? day,
        @JsonKey(name: "weekday")
        final HijriWeekday? weekday,
        @JsonKey(name: "month")
        final HijriMonth? month,
        @JsonKey(name: "year")
        final String? year,
        @JsonKey(name: "designation")
        final Designation? designation,
        @JsonKey(name: "holidays")
        final List<dynamic>? holidays,
        @JsonKey(name: "adjustedHolidays")
        final List<dynamic>? adjustedHolidays,
        @JsonKey(name: "method")
        final String? method,
    }) = _Hijri;

    factory Hijri.fromJson(Map<String, dynamic> json) => _$HijriFromJson(json);
}

@freezed
abstract class HijriMonth with _$HijriMonth {
    const factory HijriMonth({
        @JsonKey(name: "number")
        final int? number,
        @JsonKey(name: "en")
        final String? en,
        @JsonKey(name: "ar")
        final String? ar,
        @JsonKey(name: "days")
        final int? days,
    }) = _HijriMonth;

    factory HijriMonth.fromJson(Map<String, dynamic> json) => _$HijriMonthFromJson(json);
}

@freezed
abstract class HijriWeekday with _$HijriWeekday {
    const factory HijriWeekday({
        @JsonKey(name: "en")
        final String? en,
        @JsonKey(name: "ar")
        final String? ar,
    }) = _HijriWeekday;

    factory HijriWeekday.fromJson(Map<String, dynamic> json) => _$HijriWeekdayFromJson(json);
}

@freezed
abstract class Meta with _$Meta {
    const factory Meta({
        @JsonKey(name: "latitude")
        final double? latitude,
        @JsonKey(name: "longitude")
        final double? longitude,
        @JsonKey(name: "timezone")
        final String? timezone,
        @JsonKey(name: "method")
        final Method? method,
        @JsonKey(name: "latitudeAdjustmentMethod")
        final String? latitudeAdjustmentMethod,
        @JsonKey(name: "midnightMode")
        final String? midnightMode,
        @JsonKey(name: "school")
        final String? school,
        @JsonKey(name: "offset")
        final Map<String, int>? offset,
    }) = _Meta;

    factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
abstract class Method with _$Method {
    const factory Method({
        @JsonKey(name: "id")
        final int? id,
        @JsonKey(name: "name")
        final String? name,
        @JsonKey(name: "params")
        final Params? params,
        @JsonKey(name: "location")
        final Location? location,
    }) = _Method;

    factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);
}

@freezed
abstract class Location with _$Location {
    const factory Location({
        @JsonKey(name: "latitude")
        final double? latitude,
        @JsonKey(name: "longitude")
        final double? longitude,
    }) = _Location;

    factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

@freezed
abstract class Params with _$Params {
    const factory Params({
        @JsonKey(name: "Fajr")
        final int? fajr,
        @JsonKey(name: "Isha")
        final int? isha,
    }) = _Params;

    factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}

@freezed
abstract class Timings with _$Timings {
    const factory Timings({
        @JsonKey(name: "Fajr", fromJson: convertTo12Hour, toJson: convertTo24Hour)
        final TimeOfDay? fajr,
        @JsonKey(name: "Sunrise", fromJson: convertTo12Hour, toJson: convertTo24Hour)
        final TimeOfDay? sunrise,
        @JsonKey(name: "Dhuhr", fromJson: convertTo12Hour, toJson: convertTo24Hour)
        final TimeOfDay? dhuhr,
        @JsonKey(name: "Asr", fromJson: convertTo12Hour, toJson: convertTo24Hour)
        final TimeOfDay? asr,
        @JsonKey(name: "Sunset", fromJson: convertTo12Hour, toJson: convertTo24Hour)
        final TimeOfDay? sunset,
        @JsonKey(name: "Maghrib", fromJson: convertTo12Hour, toJson: convertTo24Hour)
        final TimeOfDay? maghrib,
        @JsonKey(name: "Isha", fromJson: convertTo12Hour, toJson: convertTo24Hour)
        final TimeOfDay? isha,
        @JsonKey(name: "Imsak", fromJson: convertTo12Hour, toJson: convertTo24Hour)
        final TimeOfDay? imsak,
        @JsonKey(name: "Midnight", fromJson: convertTo12Hour, toJson: convertTo24Hour)
        final TimeOfDay? midnight,
        @JsonKey(name: "Firstthird", fromJson: convertTo12Hour, toJson: convertTo24Hour)
        final TimeOfDay? firstthird,
        @JsonKey(name: "Lastthird", fromJson: convertTo12Hour, toJson: convertTo24Hour)
        final TimeOfDay? lastthird,
    }) = _Timings;

    factory Timings.fromJson(Map<String, dynamic> json) => _$TimingsFromJson(json);
}

TimeOfDay? convertTo12Hour(String time24) {
  try {
    final inputFormat = DateFormat.Hm();
    final dateTime = inputFormat.parse(time24);
    return TimeOfDay.fromDateTime(dateTime);
  } catch (e) {
    return null;
  }
}

String? convertTo24Hour(TimeOfDay? time) {
  if (time == null) return null;
  return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}
