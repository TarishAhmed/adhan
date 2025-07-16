// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_timing_month_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrayerTimingMonthResponseModel _$PrayerTimingMonthResponseModelFromJson(
  Map<String, dynamic> json,
) => _PrayerTimingMonthResponseModel(
  locationInfo: json['locationInfo'] == null
      ? null
      : LocationInfo.fromJson(json['locationInfo'] as Map<String, dynamic>),
  multiDayTimings: (json['multiDayTimings'] as List<dynamic>?)
      ?.map((e) => MultiDayTiming.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PrayerTimingMonthResponseModelToJson(
  _PrayerTimingMonthResponseModel instance,
) => <String, dynamic>{
  'locationInfo': instance.locationInfo,
  'multiDayTimings': instance.multiDayTimings,
};

_LocationInfo _$LocationInfoFromJson(Map<String, dynamic> json) =>
    _LocationInfo(
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$LocationInfoToJson(_LocationInfo instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'timezone': instance.timezone,
    };

_MultiDayTiming _$MultiDayTimingFromJson(Map<String, dynamic> json) =>
    _MultiDayTiming(
      prayers: (json['prayers'] as List<dynamic>?)
          ?.map((e) => Prayer.fromJson(e as Map<String, dynamic>))
          .toList(),
      coordinates: json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      date: DateTime.fromMillisecondsSinceEpoch((json['date'] as num).toInt()),
    );

Map<String, dynamic> _$MultiDayTimingToJson(_MultiDayTiming instance) =>
    <String, dynamic>{
      'prayers': instance.prayers,
      'coordinates': instance.coordinates,
      'date': dateToMillisecondsSinceEpoch(instance.date),
    };

_Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => _Coordinates(
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CoordinatesToJson(_Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_Prayer _$PrayerFromJson(Map<String, dynamic> json) => _Prayer(
  name: $enumDecodeNullable(_$NameEnumMap, json['name']),
  time: DateTime.fromMillisecondsSinceEpoch((json['time'] as num).toInt()),
  audio: json['audio'] as String?,
);

Map<String, dynamic> _$PrayerToJson(_Prayer instance) => <String, dynamic>{
  'name': _$NameEnumMap[instance.name],
  'time': dateToMillisecondsSinceEpoch(instance.time),
  'audio': instance.audio,
};

const _$NameEnumMap = {
  Name.ASR: 'Asr',
  Name.FAJR: 'Fajr',
  Name.ISHA: 'Isha',
  Name.MAGHRIB: 'Maghrib',
  Name.SUNRISE: 'Sunrise',
  Name.SUNSET: 'Sunset',
  Name.ZUHR: 'Zuhr',
};
