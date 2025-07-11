// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_timing_month_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrayerTimingMonthResponseModel _$PrayerTimingMonthResponseModelFromJson(
  Map<String, dynamic> json,
) => _PrayerTimingMonthResponseModel(
  code: (json['code'] as num?)?.toInt(),
  status: json['status'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PrayerTimingMonthResponseModelToJson(
  _PrayerTimingMonthResponseModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'status': instance.status,
  'data': instance.data,
};

_Datum _$DatumFromJson(Map<String, dynamic> json) => _Datum(
  timings: json['timings'] == null
      ? null
      : Timings.fromJson(json['timings'] as Map<String, dynamic>),
  date: json['date'] == null
      ? null
      : Date.fromJson(json['date'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DatumToJson(_Datum instance) => <String, dynamic>{
  'timings': instance.timings,
  'date': instance.date,
};

_Date _$DateFromJson(Map<String, dynamic> json) => _Date(
  readable: json['readable'] as String?,
  timestamp: json['timestamp'] as String?,
  gregorian: json['gregorian'] == null
      ? null
      : Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
  hijri: json['hijri'] == null
      ? null
      : Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DateToJson(_Date instance) => <String, dynamic>{
  'readable': instance.readable,
  'timestamp': instance.timestamp,
  'gregorian': instance.gregorian,
  'hijri': instance.hijri,
};

_Gregorian _$GregorianFromJson(Map<String, dynamic> json) => _Gregorian(
  date: json['date'] as String?,
  format: $enumDecodeNullable(_$FormatEnumMap, json['format']),
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
      'format': _$FormatEnumMap[instance.format],
      'day': instance.day,
      'weekday': instance.weekday,
      'month': instance.month,
      'year': instance.year,
      'designation': instance.designation,
      'lunarSighting': instance.lunarSighting,
    };

const _$FormatEnumMap = {Format.DD_MM_YYYY: 'DD-MM-YYYY'};

_Designation _$DesignationFromJson(Map<String, dynamic> json) => _Designation(
  abbreviated: $enumDecodeNullable(_$AbbreviatedEnumMap, json['abbreviated']),
  expanded: $enumDecodeNullable(_$ExpandedEnumMap, json['expanded']),
);

Map<String, dynamic> _$DesignationToJson(_Designation instance) =>
    <String, dynamic>{
      'abbreviated': _$AbbreviatedEnumMap[instance.abbreviated],
      'expanded': _$ExpandedEnumMap[instance.expanded],
    };

const _$AbbreviatedEnumMap = {Abbreviated.AD: 'AD', Abbreviated.AH: 'AH'};

const _$ExpandedEnumMap = {
  Expanded.ANNO_DOMINI: 'Anno Domini',
  Expanded.ANNO_HEGIRAE: 'Anno Hegirae',
};

_GregorianMonth _$GregorianMonthFromJson(Map<String, dynamic> json) =>
    _GregorianMonth(
      number: (json['number'] as num?)?.toInt(),
      en: $enumDecodeNullable(_$PurpleEnEnumMap, json['en']),
    );

Map<String, dynamic> _$GregorianMonthToJson(_GregorianMonth instance) =>
    <String, dynamic>{
      'number': instance.number,
      'en': _$PurpleEnEnumMap[instance.en],
    };

const _$PurpleEnEnumMap = {PurpleEn.JULY: 'July'};

_GregorianWeekday _$GregorianWeekdayFromJson(Map<String, dynamic> json) =>
    _GregorianWeekday(en: json['en'] as String?);

Map<String, dynamic> _$GregorianWeekdayToJson(_GregorianWeekday instance) =>
    <String, dynamic>{'en': instance.en};

_Hijri _$HijriFromJson(Map<String, dynamic> json) => _Hijri(
  date: json['date'] as String?,
  format: $enumDecodeNullable(_$FormatEnumMap, json['format']),
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
  holidays: (json['holidays'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  adjustedHolidays: json['adjustedHolidays'] as List<dynamic>?,
  method: $enumDecodeNullable(_$MethodEnumEnumMap, json['method']),
);

Map<String, dynamic> _$HijriToJson(_Hijri instance) => <String, dynamic>{
  'date': instance.date,
  'format': _$FormatEnumMap[instance.format],
  'day': instance.day,
  'weekday': instance.weekday,
  'month': instance.month,
  'year': instance.year,
  'designation': instance.designation,
  'holidays': instance.holidays,
  'adjustedHolidays': instance.adjustedHolidays,
  'method': _$MethodEnumEnumMap[instance.method],
};

const _$MethodEnumEnumMap = {MethodEnum.HJ_CO_SA: 'HJCoSA'};

_HijriMonth _$HijriMonthFromJson(Map<String, dynamic> json) => _HijriMonth(
  number: (json['number'] as num?)?.toInt(),
  en: $enumDecodeNullable(_$FluffyEnEnumMap, json['en']),
  ar: $enumDecodeNullable(_$ArEnumMap, json['ar']),
  days: (json['days'] as num?)?.toInt(),
);

Map<String, dynamic> _$HijriMonthToJson(_HijriMonth instance) =>
    <String, dynamic>{
      'number': instance.number,
      'en': _$FluffyEnEnumMap[instance.en],
      'ar': _$ArEnumMap[instance.ar],
      'days': instance.days,
    };

const _$FluffyEnEnumMap = {
  FluffyEn.AFAR: 'Ṣafar',
  FluffyEn.MUARRAM: 'Muḥarram',
};

const _$ArEnumMap = {Ar.AR: 'صَفَر', Ar.EMPTY: 'مُحَرَّم'};

_HijriWeekday _$HijriWeekdayFromJson(Map<String, dynamic> json) =>
    _HijriWeekday(en: json['en'] as String?, ar: json['ar'] as String?);

Map<String, dynamic> _$HijriWeekdayToJson(_HijriWeekday instance) =>
    <String, dynamic>{'en': instance.en, 'ar': instance.ar};

_Meta _$MetaFromJson(Map<String, dynamic> json) => _Meta(
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  timezone: $enumDecodeNullable(_$TimezoneEnumMap, json['timezone']),
  method: json['method'] == null
      ? null
      : MethodClass.fromJson(json['method'] as Map<String, dynamic>),
  latitudeAdjustmentMethod: $enumDecodeNullable(
    _$LatitudeAdjustmentMethodEnumMap,
    json['latitudeAdjustmentMethod'],
  ),
  midnightMode: $enumDecodeNullable(
    _$MidnightModeEnumMap,
    json['midnightMode'],
  ),
  school: $enumDecodeNullable(_$MidnightModeEnumMap, json['school']),
  offset: (json['offset'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toInt()),
  ),
);

Map<String, dynamic> _$MetaToJson(_Meta instance) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'timezone': _$TimezoneEnumMap[instance.timezone],
  'method': instance.method,
  'latitudeAdjustmentMethod':
      _$LatitudeAdjustmentMethodEnumMap[instance.latitudeAdjustmentMethod],
  'midnightMode': _$MidnightModeEnumMap[instance.midnightMode],
  'school': _$MidnightModeEnumMap[instance.school],
  'offset': instance.offset,
};

const _$TimezoneEnumMap = {Timezone.ASIA_KOLKATA: 'Asia/Kolkata'};

const _$LatitudeAdjustmentMethodEnumMap = {
  LatitudeAdjustmentMethod.ANGLE_BASED: 'ANGLE_BASED',
};

const _$MidnightModeEnumMap = {MidnightMode.STANDARD: 'STANDARD'};

_MethodClass _$MethodClassFromJson(Map<String, dynamic> json) => _MethodClass(
  id: (json['id'] as num?)?.toInt(),
  name: $enumDecodeNullable(_$NameEnumMap, json['name']),
  params: json['params'] == null
      ? null
      : Params.fromJson(json['params'] as Map<String, dynamic>),
  location: json['location'] == null
      ? null
      : Location.fromJson(json['location'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MethodClassToJson(_MethodClass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': _$NameEnumMap[instance.name],
      'params': instance.params,
      'location': instance.location,
    };

const _$NameEnumMap = {
  Name.UNIVERSITY_OF_ISLAMIC_SCIENCES_KARACHI:
      'University of Islamic Sciences, Karachi',
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
  fajr: (json['fajr'] as num?)?.toInt(),
  isha: (json['isha'] as num?)?.toInt(),
);

Map<String, dynamic> _$ParamsToJson(_Params instance) => <String, dynamic>{
  'fajr': instance.fajr,
  'isha': instance.isha,
};

_Timings _$TimingsFromJson(Map<String, dynamic> json) => _Timings(
  fajr: _parseDateTime(json['Fajr'] as String),
  sunrise: _parseDateTime(json['Sunrise'] as String),
  dhuhr: _parseDateTime(json['Dhuhr'] as String),
  asr: _parseDateTime(json['Asr'] as String),
  sunset: _parseDateTime(json['Sunset'] as String),
  maghrib: _parseDateTime(json['Maghrib'] as String),
  isha: _parseDateTime(json['Isha'] as String),
  imsak: _parseDateTime(json['Imsak'] as String),
  midnight: _parseDateTime(json['Midnight'] as String),
  firstthird: _parseDateTime(json['Firstthird'] as String),
  lastthird: _parseDateTime(json['Lastthird'] as String),
);

Map<String, dynamic> _$TimingsToJson(_Timings instance) => <String, dynamic>{
  'Fajr': _serializeDateTime(instance.fajr),
  'Sunrise': _serializeDateTime(instance.sunrise),
  'Dhuhr': _serializeDateTime(instance.dhuhr),
  'Asr': _serializeDateTime(instance.asr),
  'Sunset': _serializeDateTime(instance.sunset),
  'Maghrib': _serializeDateTime(instance.maghrib),
  'Isha': _serializeDateTime(instance.isha),
  'Imsak': _serializeDateTime(instance.imsak),
  'Midnight': _serializeDateTime(instance.midnight),
  'Firstthird': _serializeDateTime(instance.firstthird),
  'Lastthird': _serializeDateTime(instance.lastthird),
};
