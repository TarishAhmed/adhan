// To parse this JSON data, do
//
//     final prayerTimingMonthResponseModel = prayerTimingMonthResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'prayer_timing_month_response_model.freezed.dart';
part 'prayer_timing_month_response_model.g.dart';

PrayerTimingMonthResponseModel prayerTimingMonthResponseModelFromJson(String str) => PrayerTimingMonthResponseModel.fromJson(json.decode(str));

String prayerTimingMonthResponseModelToJson(PrayerTimingMonthResponseModel data) => json.encode(data.toJson());

@freezed
abstract class PrayerTimingMonthResponseModel with _$PrayerTimingMonthResponseModel {
    const factory PrayerTimingMonthResponseModel({
        @JsonKey(name: "code")
        int? code,
        @JsonKey(name: "status")
        String? status,
        @JsonKey(name: "data")
        List<Datum>? data,
    }) = _PrayerTimingMonthResponseModel;

    factory PrayerTimingMonthResponseModel.fromJson(Map<String, dynamic> json) => _$PrayerTimingMonthResponseModelFromJson(json);
}

@freezed
abstract class Datum with _$Datum {
    const factory Datum({
        @JsonKey(name: "timings")
        Timings? timings,
        @JsonKey(name: "date")
        Date? date,
        @JsonKey(name: "meta")
        Meta? meta,
    }) = _Datum;

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
abstract class Date with _$Date {
    const factory Date({
        @JsonKey(name: "readable")
        String? readable,
        @JsonKey(name: "timestamp")
        String? timestamp,
        @JsonKey(name: "gregorian")
        Gregorian? gregorian,
        @JsonKey(name: "hijri")
        Hijri? hijri,
    }) = _Date;

    factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);
}

@freezed
abstract class Gregorian with _$Gregorian {
    const factory Gregorian({
        @JsonKey(name: "date")
        String? date,
        @JsonKey(name: "format")
        Format? format,
        @JsonKey(name: "day")
        String? day,
        @JsonKey(name: "weekday")
        GregorianWeekday? weekday,
        @JsonKey(name: "month")
        GregorianMonth? month,
        @JsonKey(name: "year")
        String? year,
        @JsonKey(name: "designation")
        Designation? designation,
        @JsonKey(name: "lunarSighting")
        bool? lunarSighting,
    }) = _Gregorian;

    factory Gregorian.fromJson(Map<String, dynamic> json) => _$GregorianFromJson(json);
}

@freezed
abstract class Designation with _$Designation {
    const factory Designation({
        @JsonKey(name: "abbreviated")
        Abbreviated? abbreviated,
        @JsonKey(name: "expanded")
        Expanded? expanded,
    }) = _Designation;

    factory Designation.fromJson(Map<String, dynamic> json) => _$DesignationFromJson(json);
}

enum Abbreviated {
    @JsonValue("AD")
    AD,
    @JsonValue("AH")
    AH
}

final abbreviatedValues = EnumValues({
    "AD": Abbreviated.AD,
    "AH": Abbreviated.AH
});

enum Expanded {
    @JsonValue("Anno Domini")
    ANNO_DOMINI,
    @JsonValue("Anno Hegirae")
    ANNO_HEGIRAE
}

final expandedValues = EnumValues({
    "Anno Domini": Expanded.ANNO_DOMINI,
    "Anno Hegirae": Expanded.ANNO_HEGIRAE
});

enum Format {
    @JsonValue("DD-MM-YYYY")
    DD_MM_YYYY
}

final formatValues = EnumValues({
    "DD-MM-YYYY": Format.DD_MM_YYYY
});

@freezed
abstract class GregorianMonth with _$GregorianMonth {
    const factory GregorianMonth({
        @JsonKey(name: "number")
        int? number,
        @JsonKey(name: "en")
        PurpleEn? en,
    }) = _GregorianMonth;

    factory GregorianMonth.fromJson(Map<String, dynamic> json) => _$GregorianMonthFromJson(json);
}

enum PurpleEn {
    @JsonValue("July")
    JULY
}

final purpleEnValues = EnumValues({
    "July": PurpleEn.JULY
});

@freezed
abstract class GregorianWeekday with _$GregorianWeekday {
    const factory GregorianWeekday({
        @JsonKey(name: "en")
        String? en,
    }) = _GregorianWeekday;

    factory GregorianWeekday.fromJson(Map<String, dynamic> json) => _$GregorianWeekdayFromJson(json);
}

@freezed
abstract class Hijri with _$Hijri {
    const factory Hijri({
        @JsonKey(name: "date")
        String? date,
        @JsonKey(name: "format")
        Format? format,
        @JsonKey(name: "day")
        String? day,
        @JsonKey(name: "weekday")
        HijriWeekday? weekday,
        @JsonKey(name: "month")
        HijriMonth? month,
        @JsonKey(name: "year")
        String? year,
        @JsonKey(name: "designation")
        Designation? designation,
        @JsonKey(name: "holidays")
        List<String>? holidays,
        @JsonKey(name: "adjustedHolidays")
        List<dynamic>? adjustedHolidays,
        @JsonKey(name: "method")
        MethodEnum? method,
    }) = _Hijri;

    factory Hijri.fromJson(Map<String, dynamic> json) => _$HijriFromJson(json);
}

enum MethodEnum {
    @JsonValue("HJCoSA")
    HJ_CO_SA
}

final methodEnumValues = EnumValues({
    "HJCoSA": MethodEnum.HJ_CO_SA
});

@freezed
abstract class HijriMonth with _$HijriMonth {
    const factory HijriMonth({
        @JsonKey(name: "number")
        int? number,
        @JsonKey(name: "en")
        FluffyEn? en,
        @JsonKey(name: "ar")
        Ar? ar,
        @JsonKey(name: "days")
        int? days,
    }) = _HijriMonth;

    factory HijriMonth.fromJson(Map<String, dynamic> json) => _$HijriMonthFromJson(json);
}

enum Ar {
    @JsonValue("صَفَر")
    AR,
    @JsonValue("مُحَرَّم")
    EMPTY
}

final arValues = EnumValues({
    "صَفَر": Ar.AR,
    "مُحَرَّم": Ar.EMPTY
});

enum FluffyEn {
    @JsonValue("Ṣafar")
    AFAR,
    @JsonValue("Muḥarram")
    MUARRAM
}

final fluffyEnValues = EnumValues({
    "Ṣafar": FluffyEn.AFAR,
    "Muḥarram": FluffyEn.MUARRAM
});

@freezed
abstract class HijriWeekday with _$HijriWeekday {
    const factory HijriWeekday({
        @JsonKey(name: "en")
        String? en,
        @JsonKey(name: "ar")
        String? ar,
    }) = _HijriWeekday;

    factory HijriWeekday.fromJson(Map<String, dynamic> json) => _$HijriWeekdayFromJson(json);
}

@freezed
abstract class Meta with _$Meta {
    const factory Meta({
        @JsonKey(name: "latitude")
        double? latitude,
        @JsonKey(name: "longitude")
        double? longitude,
        @JsonKey(name: "timezone")
        Timezone? timezone,
        @JsonKey(name: "method")
        MethodClass? method,
        @JsonKey(name: "latitudeAdjustmentMethod")
        LatitudeAdjustmentMethod? latitudeAdjustmentMethod,
        @JsonKey(name: "midnightMode")
        MidnightMode? midnightMode,
        @JsonKey(name: "school")
        MidnightMode? school,
        @JsonKey(name: "offset")
        Map<String, int>? offset,
    }) = _Meta;

    factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

enum LatitudeAdjustmentMethod {
    @JsonValue("ANGLE_BASED")
    ANGLE_BASED
}

final latitudeAdjustmentMethodValues = EnumValues({
    "ANGLE_BASED": LatitudeAdjustmentMethod.ANGLE_BASED
});

@freezed
abstract class MethodClass with _$MethodClass {
    const factory MethodClass({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "name")
        Name? name,
        @JsonKey(name: "params")
        Params? params,
        @JsonKey(name: "location")
        Location? location,
    }) = _MethodClass;

    factory MethodClass.fromJson(Map<String, dynamic> json) => _$MethodClassFromJson(json);
}

@freezed
abstract class Location with _$Location {
    const factory Location({
        @JsonKey(name: "latitude")
        double? latitude,
        @JsonKey(name: "longitude")
        double? longitude,
    }) = _Location;

    factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

enum Name {
    @JsonValue("University of Islamic Sciences, Karachi")
    UNIVERSITY_OF_ISLAMIC_SCIENCES_KARACHI
}

final nameValues = EnumValues({
    "University of Islamic Sciences, Karachi": Name.UNIVERSITY_OF_ISLAMIC_SCIENCES_KARACHI
});

@freezed
abstract class Params with _$Params {
    const factory Params({
        @JsonKey(name: "Fajr")
        int? fajr,
        @JsonKey(name: "Isha")
        int? isha,
    }) = _Params;

    factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}

enum MidnightMode {
    @JsonValue("STANDARD")
    STANDARD
}

final midnightModeValues = EnumValues({
    "STANDARD": MidnightMode.STANDARD
});

enum Timezone {
    @JsonValue("Asia/Kolkata")
    ASIA_KOLKATA
}

final timezoneValues = EnumValues({
    "Asia/Kolkata": Timezone.ASIA_KOLKATA
});

@freezed
abstract class Timings with _$Timings {
    const factory Timings({
        @JsonKey(name: "Fajr")
        DateTime? fajr,
        @JsonKey(name: "Sunrise")
        DateTime? sunrise,
        @JsonKey(name: "Dhuhr")
        DateTime? dhuhr,
        @JsonKey(name: "Asr")
        DateTime? asr,
        @JsonKey(name: "Sunset")
        DateTime? sunset,
        @JsonKey(name: "Maghrib")
        DateTime? maghrib,
        @JsonKey(name: "Isha")
        DateTime? isha,
        @JsonKey(name: "Imsak")
        DateTime? imsak,
        @JsonKey(name: "Midnight")
        DateTime? midnight,
        @JsonKey(name: "Firstthird")
        DateTime? firstthird,
        @JsonKey(name: "Lastthird")
        DateTime? lastthird,
    }) = _Timings;

    factory Timings.fromJson(Map<String, dynamic> json) => _$TimingsFromJson(json);
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
