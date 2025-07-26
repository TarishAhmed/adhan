// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_time_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrayerTimeResponseModel _$PrayerTimeResponseModelFromJson(
  Map<String, dynamic> json,
) => _PrayerTimeResponseModel(
  code: (json['code'] as num?)?.toInt(),
  status: json['status'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PrayerTimeResponseModelToJson(
  _PrayerTimeResponseModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'status': instance.status,
  'data': instance.data,
};

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
  timings: json['timings'] == null
      ? null
      : Timings.fromJson(json['timings'] as Map<String, dynamic>),
  date: json['date'] == null
      ? null
      : Date.fromJson(json['date'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
  'timings': instance.timings,
  'date': instance.date,
  'meta': instance.meta,
};

_Date _$DateFromJson(Map<String, dynamic> json) => _Date(
  readable: json['readable'] as String?,
  timestamp: json['timestamp'] as String?,
  hijri: json['hijri'] == null
      ? null
      : Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
  gregorian: json['gregorian'] == null
      ? null
      : Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DateToJson(_Date instance) => <String, dynamic>{
  'readable': instance.readable,
  'timestamp': instance.timestamp,
  'hijri': instance.hijri,
  'gregorian': instance.gregorian,
};

_Gregorian _$GregorianFromJson(Map<String, dynamic> json) => _Gregorian(
  date: json['date'] as String?,
  format: json['format'] as String?,
  day: json['day'] as String?,
  weekday: json['weekday'] == null
      ? null
      : GregorianWeekday.fromJson(json['weekday'] as Map<String, dynamic>),
  month: json['month'] == null
      ? null
      : GregorianMonth.fromJson(json['month'] as Map<String, dynamic>),
  year: json['year'] as String?,
  designation: json['designation'] == null
      ? null
      : Designation.fromJson(json['designation'] as Map<String, dynamic>),
  lunarSighting: json['lunarSighting'] as bool?,
);

Map<String, dynamic> _$GregorianToJson(_Gregorian instance) =>
    <String, dynamic>{
      'date': instance.date,
      'format': instance.format,
      'day': instance.day,
      'weekday': instance.weekday,
      'month': instance.month,
      'year': instance.year,
      'designation': instance.designation,
      'lunarSighting': instance.lunarSighting,
    };

_Designation _$DesignationFromJson(Map<String, dynamic> json) => _Designation(
  abbreviated: json['abbreviated'] as String?,
  expanded: json['expanded'] as String?,
);

Map<String, dynamic> _$DesignationToJson(_Designation instance) =>
    <String, dynamic>{
      'abbreviated': instance.abbreviated,
      'expanded': instance.expanded,
    };

_GregorianMonth _$GregorianMonthFromJson(Map<String, dynamic> json) =>
    _GregorianMonth(
      number: (json['number'] as num?)?.toInt(),
      en: json['en'] as String?,
    );

Map<String, dynamic> _$GregorianMonthToJson(_GregorianMonth instance) =>
    <String, dynamic>{'number': instance.number, 'en': instance.en};

_GregorianWeekday _$GregorianWeekdayFromJson(Map<String, dynamic> json) =>
    _GregorianWeekday(en: json['en'] as String?);

Map<String, dynamic> _$GregorianWeekdayToJson(_GregorianWeekday instance) =>
    <String, dynamic>{'en': instance.en};

_Hijri _$HijriFromJson(Map<String, dynamic> json) => _Hijri(
  date: json['date'] as String?,
  format: json['format'] as String?,
  day: json['day'] as String?,
  weekday: json['weekday'] == null
      ? null
      : HijriWeekday.fromJson(json['weekday'] as Map<String, dynamic>),
  month: json['month'] == null
      ? null
      : HijriMonth.fromJson(json['month'] as Map<String, dynamic>),
  year: json['year'] as String?,
  designation: json['designation'] == null
      ? null
      : Designation.fromJson(json['designation'] as Map<String, dynamic>),
  holidays: json['holidays'] as List<dynamic>?,
  adjustedHolidays: json['adjustedHolidays'] as List<dynamic>?,
  method: json['method'] as String?,
);

Map<String, dynamic> _$HijriToJson(_Hijri instance) => <String, dynamic>{
  'date': instance.date,
  'format': instance.format,
  'day': instance.day,
  'weekday': instance.weekday,
  'month': instance.month,
  'year': instance.year,
  'designation': instance.designation,
  'holidays': instance.holidays,
  'adjustedHolidays': instance.adjustedHolidays,
  'method': instance.method,
};

_HijriMonth _$HijriMonthFromJson(Map<String, dynamic> json) => _HijriMonth(
  number: (json['number'] as num?)?.toInt(),
  en: json['en'] as String?,
  ar: json['ar'] as String?,
  days: (json['days'] as num?)?.toInt(),
);

Map<String, dynamic> _$HijriMonthToJson(_HijriMonth instance) =>
    <String, dynamic>{
      'number': instance.number,
      'en': instance.en,
      'ar': instance.ar,
      'days': instance.days,
    };

_HijriWeekday _$HijriWeekdayFromJson(Map<String, dynamic> json) =>
    _HijriWeekday(en: json['en'] as String?, ar: json['ar'] as String?);

Map<String, dynamic> _$HijriWeekdayToJson(_HijriWeekday instance) =>
    <String, dynamic>{'en': instance.en, 'ar': instance.ar};

_Meta _$MetaFromJson(Map<String, dynamic> json) => _Meta(
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  timezone: json['timezone'] as String?,
  method: json['method'] == null
      ? null
      : Method.fromJson(json['method'] as Map<String, dynamic>),
  latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'] as String?,
  midnightMode: json['midnightMode'] as String?,
  school: json['school'] as String?,
  offset: (json['offset'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toInt()),
  ),
);

Map<String, dynamic> _$MetaToJson(_Meta instance) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'timezone': instance.timezone,
  'method': instance.method,
  'latitudeAdjustmentMethod': instance.latitudeAdjustmentMethod,
  'midnightMode': instance.midnightMode,
  'school': instance.school,
  'offset': instance.offset,
};

_Method _$MethodFromJson(Map<String, dynamic> json) => _Method(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  params: json['params'] == null
      ? null
      : Params.fromJson(json['params'] as Map<String, dynamic>),
  location: json['location'] == null
      ? null
      : Location.fromJson(json['location'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MethodToJson(_Method instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'params': instance.params,
  'location': instance.location,
};

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};

_Params _$ParamsFromJson(Map<String, dynamic> json) => _Params(
  fajr: (json['Fajr'] as num?)?.toInt(),
  isha: (json['Isha'] as num?)?.toInt(),
);

Map<String, dynamic> _$ParamsToJson(_Params instance) => <String, dynamic>{
  'Fajr': instance.fajr,
  'Isha': instance.isha,
};

_Timings _$TimingsFromJson(Map<String, dynamic> json) => _Timings(
  fajr: convertTo12Hour(json['Fajr'] as String),
  sunrise: convertTo12Hour(json['Sunrise'] as String),
  Zuhr: convertTo12Hour(json['Zuhr'] as String),
  asr: convertTo12Hour(json['Asr'] as String),
  sunset: convertTo12Hour(json['Sunset'] as String),
  maghrib: convertTo12Hour(json['Maghrib'] as String),
  isha: convertTo12Hour(json['Isha'] as String),
  imsak: convertTo12Hour(json['Imsak'] as String),
  midnight: convertTo12Hour(json['Midnight'] as String),
  firstthird: convertTo12Hour(json['Firstthird'] as String),
  lastthird: convertTo12Hour(json['Lastthird'] as String),
);

Map<String, dynamic> _$TimingsToJson(_Timings instance) => <String, dynamic>{
  'Fajr': convertTo24Hour(instance.fajr),
  'Sunrise': convertTo24Hour(instance.sunrise),
  'Zuhr': convertTo24Hour(instance.Zuhr),
  'Asr': convertTo24Hour(instance.asr),
  'Sunset': convertTo24Hour(instance.sunset),
  'Maghrib': convertTo24Hour(instance.maghrib),
  'Isha': convertTo24Hour(instance.isha),
  'Imsak': convertTo24Hour(instance.imsak),
  'Midnight': convertTo24Hour(instance.midnight),
  'Firstthird': convertTo24Hour(instance.firstthird),
  'Lastthird': convertTo24Hour(instance.lastthird),
};
