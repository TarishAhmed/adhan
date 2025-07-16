// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prayer_timing_month_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrayerTimingMonthResponseModel {

@JsonKey(name: "locationInfo") LocationInfo? get locationInfo;@JsonKey(name: "multiDayTimings") List<MultiDayTiming>? get multiDayTimings;
/// Create a copy of PrayerTimingMonthResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrayerTimingMonthResponseModelCopyWith<PrayerTimingMonthResponseModel> get copyWith => _$PrayerTimingMonthResponseModelCopyWithImpl<PrayerTimingMonthResponseModel>(this as PrayerTimingMonthResponseModel, _$identity);

  /// Serializes this PrayerTimingMonthResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrayerTimingMonthResponseModel&&(identical(other.locationInfo, locationInfo) || other.locationInfo == locationInfo)&&const DeepCollectionEquality().equals(other.multiDayTimings, multiDayTimings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locationInfo,const DeepCollectionEquality().hash(multiDayTimings));

@override
String toString() {
  return 'PrayerTimingMonthResponseModel(locationInfo: $locationInfo, multiDayTimings: $multiDayTimings)';
}


}

/// @nodoc
abstract mixin class $PrayerTimingMonthResponseModelCopyWith<$Res>  {
  factory $PrayerTimingMonthResponseModelCopyWith(PrayerTimingMonthResponseModel value, $Res Function(PrayerTimingMonthResponseModel) _then) = _$PrayerTimingMonthResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "locationInfo") LocationInfo? locationInfo,@JsonKey(name: "multiDayTimings") List<MultiDayTiming>? multiDayTimings
});


$LocationInfoCopyWith<$Res>? get locationInfo;

}
/// @nodoc
class _$PrayerTimingMonthResponseModelCopyWithImpl<$Res>
    implements $PrayerTimingMonthResponseModelCopyWith<$Res> {
  _$PrayerTimingMonthResponseModelCopyWithImpl(this._self, this._then);

  final PrayerTimingMonthResponseModel _self;
  final $Res Function(PrayerTimingMonthResponseModel) _then;

/// Create a copy of PrayerTimingMonthResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locationInfo = freezed,Object? multiDayTimings = freezed,}) {
  return _then(_self.copyWith(
locationInfo: freezed == locationInfo ? _self.locationInfo : locationInfo // ignore: cast_nullable_to_non_nullable
as LocationInfo?,multiDayTimings: freezed == multiDayTimings ? _self.multiDayTimings : multiDayTimings // ignore: cast_nullable_to_non_nullable
as List<MultiDayTiming>?,
  ));
}
/// Create a copy of PrayerTimingMonthResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationInfoCopyWith<$Res>? get locationInfo {
    if (_self.locationInfo == null) {
    return null;
  }

  return $LocationInfoCopyWith<$Res>(_self.locationInfo!, (value) {
    return _then(_self.copyWith(locationInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [PrayerTimingMonthResponseModel].
extension PrayerTimingMonthResponseModelPatterns on PrayerTimingMonthResponseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrayerTimingMonthResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrayerTimingMonthResponseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrayerTimingMonthResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _PrayerTimingMonthResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrayerTimingMonthResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _PrayerTimingMonthResponseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "locationInfo")  LocationInfo? locationInfo, @JsonKey(name: "multiDayTimings")  List<MultiDayTiming>? multiDayTimings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrayerTimingMonthResponseModel() when $default != null:
return $default(_that.locationInfo,_that.multiDayTimings);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "locationInfo")  LocationInfo? locationInfo, @JsonKey(name: "multiDayTimings")  List<MultiDayTiming>? multiDayTimings)  $default,) {final _that = this;
switch (_that) {
case _PrayerTimingMonthResponseModel():
return $default(_that.locationInfo,_that.multiDayTimings);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "locationInfo")  LocationInfo? locationInfo, @JsonKey(name: "multiDayTimings")  List<MultiDayTiming>? multiDayTimings)?  $default,) {final _that = this;
switch (_that) {
case _PrayerTimingMonthResponseModel() when $default != null:
return $default(_that.locationInfo,_that.multiDayTimings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrayerTimingMonthResponseModel implements PrayerTimingMonthResponseModel {
  const _PrayerTimingMonthResponseModel({@JsonKey(name: "locationInfo") this.locationInfo, @JsonKey(name: "multiDayTimings") final  List<MultiDayTiming>? multiDayTimings}): _multiDayTimings = multiDayTimings;
  factory _PrayerTimingMonthResponseModel.fromJson(Map<String, dynamic> json) => _$PrayerTimingMonthResponseModelFromJson(json);

@override@JsonKey(name: "locationInfo") final  LocationInfo? locationInfo;
 final  List<MultiDayTiming>? _multiDayTimings;
@override@JsonKey(name: "multiDayTimings") List<MultiDayTiming>? get multiDayTimings {
  final value = _multiDayTimings;
  if (value == null) return null;
  if (_multiDayTimings is EqualUnmodifiableListView) return _multiDayTimings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PrayerTimingMonthResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrayerTimingMonthResponseModelCopyWith<_PrayerTimingMonthResponseModel> get copyWith => __$PrayerTimingMonthResponseModelCopyWithImpl<_PrayerTimingMonthResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrayerTimingMonthResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrayerTimingMonthResponseModel&&(identical(other.locationInfo, locationInfo) || other.locationInfo == locationInfo)&&const DeepCollectionEquality().equals(other._multiDayTimings, _multiDayTimings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locationInfo,const DeepCollectionEquality().hash(_multiDayTimings));

@override
String toString() {
  return 'PrayerTimingMonthResponseModel(locationInfo: $locationInfo, multiDayTimings: $multiDayTimings)';
}


}

/// @nodoc
abstract mixin class _$PrayerTimingMonthResponseModelCopyWith<$Res> implements $PrayerTimingMonthResponseModelCopyWith<$Res> {
  factory _$PrayerTimingMonthResponseModelCopyWith(_PrayerTimingMonthResponseModel value, $Res Function(_PrayerTimingMonthResponseModel) _then) = __$PrayerTimingMonthResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "locationInfo") LocationInfo? locationInfo,@JsonKey(name: "multiDayTimings") List<MultiDayTiming>? multiDayTimings
});


@override $LocationInfoCopyWith<$Res>? get locationInfo;

}
/// @nodoc
class __$PrayerTimingMonthResponseModelCopyWithImpl<$Res>
    implements _$PrayerTimingMonthResponseModelCopyWith<$Res> {
  __$PrayerTimingMonthResponseModelCopyWithImpl(this._self, this._then);

  final _PrayerTimingMonthResponseModel _self;
  final $Res Function(_PrayerTimingMonthResponseModel) _then;

/// Create a copy of PrayerTimingMonthResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locationInfo = freezed,Object? multiDayTimings = freezed,}) {
  return _then(_PrayerTimingMonthResponseModel(
locationInfo: freezed == locationInfo ? _self.locationInfo : locationInfo // ignore: cast_nullable_to_non_nullable
as LocationInfo?,multiDayTimings: freezed == multiDayTimings ? _self._multiDayTimings : multiDayTimings // ignore: cast_nullable_to_non_nullable
as List<MultiDayTiming>?,
  ));
}

/// Create a copy of PrayerTimingMonthResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationInfoCopyWith<$Res>? get locationInfo {
    if (_self.locationInfo == null) {
    return null;
  }

  return $LocationInfoCopyWith<$Res>(_self.locationInfo!, (value) {
    return _then(_self.copyWith(locationInfo: value));
  });
}
}


/// @nodoc
mixin _$LocationInfo {

@JsonKey(name: "lat") String? get lat;@JsonKey(name: "lng") String? get lng;@JsonKey(name: "timezone") String? get timezone;
/// Create a copy of LocationInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationInfoCopyWith<LocationInfo> get copyWith => _$LocationInfoCopyWithImpl<LocationInfo>(this as LocationInfo, _$identity);

  /// Serializes this LocationInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationInfo&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.timezone, timezone) || other.timezone == timezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,timezone);

@override
String toString() {
  return 'LocationInfo(lat: $lat, lng: $lng, timezone: $timezone)';
}


}

/// @nodoc
abstract mixin class $LocationInfoCopyWith<$Res>  {
  factory $LocationInfoCopyWith(LocationInfo value, $Res Function(LocationInfo) _then) = _$LocationInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "lat") String? lat,@JsonKey(name: "lng") String? lng,@JsonKey(name: "timezone") String? timezone
});




}
/// @nodoc
class _$LocationInfoCopyWithImpl<$Res>
    implements $LocationInfoCopyWith<$Res> {
  _$LocationInfoCopyWithImpl(this._self, this._then);

  final LocationInfo _self;
  final $Res Function(LocationInfo) _then;

/// Create a copy of LocationInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = freezed,Object? lng = freezed,Object? timezone = freezed,}) {
  return _then(_self.copyWith(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationInfo].
extension LocationInfoPatterns on LocationInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationInfo value)  $default,){
final _that = this;
switch (_that) {
case _LocationInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationInfo value)?  $default,){
final _that = this;
switch (_that) {
case _LocationInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "lat")  String? lat, @JsonKey(name: "lng")  String? lng, @JsonKey(name: "timezone")  String? timezone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationInfo() when $default != null:
return $default(_that.lat,_that.lng,_that.timezone);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "lat")  String? lat, @JsonKey(name: "lng")  String? lng, @JsonKey(name: "timezone")  String? timezone)  $default,) {final _that = this;
switch (_that) {
case _LocationInfo():
return $default(_that.lat,_that.lng,_that.timezone);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "lat")  String? lat, @JsonKey(name: "lng")  String? lng, @JsonKey(name: "timezone")  String? timezone)?  $default,) {final _that = this;
switch (_that) {
case _LocationInfo() when $default != null:
return $default(_that.lat,_that.lng,_that.timezone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationInfo implements LocationInfo {
  const _LocationInfo({@JsonKey(name: "lat") this.lat, @JsonKey(name: "lng") this.lng, @JsonKey(name: "timezone") this.timezone});
  factory _LocationInfo.fromJson(Map<String, dynamic> json) => _$LocationInfoFromJson(json);

@override@JsonKey(name: "lat") final  String? lat;
@override@JsonKey(name: "lng") final  String? lng;
@override@JsonKey(name: "timezone") final  String? timezone;

/// Create a copy of LocationInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationInfoCopyWith<_LocationInfo> get copyWith => __$LocationInfoCopyWithImpl<_LocationInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationInfo&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.timezone, timezone) || other.timezone == timezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,timezone);

@override
String toString() {
  return 'LocationInfo(lat: $lat, lng: $lng, timezone: $timezone)';
}


}

/// @nodoc
abstract mixin class _$LocationInfoCopyWith<$Res> implements $LocationInfoCopyWith<$Res> {
  factory _$LocationInfoCopyWith(_LocationInfo value, $Res Function(_LocationInfo) _then) = __$LocationInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "lat") String? lat,@JsonKey(name: "lng") String? lng,@JsonKey(name: "timezone") String? timezone
});




}
/// @nodoc
class __$LocationInfoCopyWithImpl<$Res>
    implements _$LocationInfoCopyWith<$Res> {
  __$LocationInfoCopyWithImpl(this._self, this._then);

  final _LocationInfo _self;
  final $Res Function(_LocationInfo) _then;

/// Create a copy of LocationInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = freezed,Object? lng = freezed,Object? timezone = freezed,}) {
  return _then(_LocationInfo(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as String?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as String?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MultiDayTiming {

@JsonKey(name: "prayers") List<Prayer>? get prayers;@JsonKey(name: "coordinates") Coordinates? get coordinates;@JsonKey(name: "date", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch) DateTime? get date;
/// Create a copy of MultiDayTiming
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MultiDayTimingCopyWith<MultiDayTiming> get copyWith => _$MultiDayTimingCopyWithImpl<MultiDayTiming>(this as MultiDayTiming, _$identity);

  /// Serializes this MultiDayTiming to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MultiDayTiming&&const DeepCollectionEquality().equals(other.prayers, prayers)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(prayers),coordinates,date);

@override
String toString() {
  return 'MultiDayTiming(prayers: $prayers, coordinates: $coordinates, date: $date)';
}


}

/// @nodoc
abstract mixin class $MultiDayTimingCopyWith<$Res>  {
  factory $MultiDayTimingCopyWith(MultiDayTiming value, $Res Function(MultiDayTiming) _then) = _$MultiDayTimingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "prayers") List<Prayer>? prayers,@JsonKey(name: "coordinates") Coordinates? coordinates,@JsonKey(name: "date", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch) DateTime? date
});


$CoordinatesCopyWith<$Res>? get coordinates;

}
/// @nodoc
class _$MultiDayTimingCopyWithImpl<$Res>
    implements $MultiDayTimingCopyWith<$Res> {
  _$MultiDayTimingCopyWithImpl(this._self, this._then);

  final MultiDayTiming _self;
  final $Res Function(MultiDayTiming) _then;

/// Create a copy of MultiDayTiming
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prayers = freezed,Object? coordinates = freezed,Object? date = freezed,}) {
  return _then(_self.copyWith(
prayers: freezed == prayers ? _self.prayers : prayers // ignore: cast_nullable_to_non_nullable
as List<Prayer>?,coordinates: freezed == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of MultiDayTiming
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordinatesCopyWith<$Res>? get coordinates {
    if (_self.coordinates == null) {
    return null;
  }

  return $CoordinatesCopyWith<$Res>(_self.coordinates!, (value) {
    return _then(_self.copyWith(coordinates: value));
  });
}
}


/// Adds pattern-matching-related methods to [MultiDayTiming].
extension MultiDayTimingPatterns on MultiDayTiming {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MultiDayTiming value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MultiDayTiming() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MultiDayTiming value)  $default,){
final _that = this;
switch (_that) {
case _MultiDayTiming():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MultiDayTiming value)?  $default,){
final _that = this;
switch (_that) {
case _MultiDayTiming() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "prayers")  List<Prayer>? prayers, @JsonKey(name: "coordinates")  Coordinates? coordinates, @JsonKey(name: "date", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch)  DateTime? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MultiDayTiming() when $default != null:
return $default(_that.prayers,_that.coordinates,_that.date);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "prayers")  List<Prayer>? prayers, @JsonKey(name: "coordinates")  Coordinates? coordinates, @JsonKey(name: "date", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch)  DateTime? date)  $default,) {final _that = this;
switch (_that) {
case _MultiDayTiming():
return $default(_that.prayers,_that.coordinates,_that.date);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "prayers")  List<Prayer>? prayers, @JsonKey(name: "coordinates")  Coordinates? coordinates, @JsonKey(name: "date", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch)  DateTime? date)?  $default,) {final _that = this;
switch (_that) {
case _MultiDayTiming() when $default != null:
return $default(_that.prayers,_that.coordinates,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MultiDayTiming implements MultiDayTiming {
  const _MultiDayTiming({@JsonKey(name: "prayers") final  List<Prayer>? prayers, @JsonKey(name: "coordinates") this.coordinates, @JsonKey(name: "date", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch) this.date}): _prayers = prayers;
  factory _MultiDayTiming.fromJson(Map<String, dynamic> json) => _$MultiDayTimingFromJson(json);

 final  List<Prayer>? _prayers;
@override@JsonKey(name: "prayers") List<Prayer>? get prayers {
  final value = _prayers;
  if (value == null) return null;
  if (_prayers is EqualUnmodifiableListView) return _prayers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "coordinates") final  Coordinates? coordinates;
@override@JsonKey(name: "date", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch) final  DateTime? date;

/// Create a copy of MultiDayTiming
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MultiDayTimingCopyWith<_MultiDayTiming> get copyWith => __$MultiDayTimingCopyWithImpl<_MultiDayTiming>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MultiDayTimingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MultiDayTiming&&const DeepCollectionEquality().equals(other._prayers, _prayers)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_prayers),coordinates,date);

@override
String toString() {
  return 'MultiDayTiming(prayers: $prayers, coordinates: $coordinates, date: $date)';
}


}

/// @nodoc
abstract mixin class _$MultiDayTimingCopyWith<$Res> implements $MultiDayTimingCopyWith<$Res> {
  factory _$MultiDayTimingCopyWith(_MultiDayTiming value, $Res Function(_MultiDayTiming) _then) = __$MultiDayTimingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "prayers") List<Prayer>? prayers,@JsonKey(name: "coordinates") Coordinates? coordinates,@JsonKey(name: "date", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch) DateTime? date
});


@override $CoordinatesCopyWith<$Res>? get coordinates;

}
/// @nodoc
class __$MultiDayTimingCopyWithImpl<$Res>
    implements _$MultiDayTimingCopyWith<$Res> {
  __$MultiDayTimingCopyWithImpl(this._self, this._then);

  final _MultiDayTiming _self;
  final $Res Function(_MultiDayTiming) _then;

/// Create a copy of MultiDayTiming
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prayers = freezed,Object? coordinates = freezed,Object? date = freezed,}) {
  return _then(_MultiDayTiming(
prayers: freezed == prayers ? _self._prayers : prayers // ignore: cast_nullable_to_non_nullable
as List<Prayer>?,coordinates: freezed == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of MultiDayTiming
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordinatesCopyWith<$Res>? get coordinates {
    if (_self.coordinates == null) {
    return null;
  }

  return $CoordinatesCopyWith<$Res>(_self.coordinates!, (value) {
    return _then(_self.copyWith(coordinates: value));
  });
}
}


/// @nodoc
mixin _$Coordinates {

@JsonKey(name: "latitude") double? get latitude;@JsonKey(name: "longitude") double? get longitude;
/// Create a copy of Coordinates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoordinatesCopyWith<Coordinates> get copyWith => _$CoordinatesCopyWithImpl<Coordinates>(this as Coordinates, _$identity);

  /// Serializes this Coordinates to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Coordinates&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'Coordinates(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $CoordinatesCopyWith<$Res>  {
  factory $CoordinatesCopyWith(Coordinates value, $Res Function(Coordinates) _then) = _$CoordinatesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude
});




}
/// @nodoc
class _$CoordinatesCopyWithImpl<$Res>
    implements $CoordinatesCopyWith<$Res> {
  _$CoordinatesCopyWithImpl(this._self, this._then);

  final Coordinates _self;
  final $Res Function(Coordinates) _then;

/// Create a copy of Coordinates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Coordinates].
extension CoordinatesPatterns on Coordinates {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Coordinates value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Coordinates() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Coordinates value)  $default,){
final _that = this;
switch (_that) {
case _Coordinates():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Coordinates value)?  $default,){
final _that = this;
switch (_that) {
case _Coordinates() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Coordinates() when $default != null:
return $default(_that.latitude,_that.longitude);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _Coordinates():
return $default(_that.latitude,_that.longitude);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _Coordinates() when $default != null:
return $default(_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Coordinates implements Coordinates {
  const _Coordinates({@JsonKey(name: "latitude") this.latitude, @JsonKey(name: "longitude") this.longitude});
  factory _Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);

@override@JsonKey(name: "latitude") final  double? latitude;
@override@JsonKey(name: "longitude") final  double? longitude;

/// Create a copy of Coordinates
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoordinatesCopyWith<_Coordinates> get copyWith => __$CoordinatesCopyWithImpl<_Coordinates>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoordinatesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Coordinates&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'Coordinates(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$CoordinatesCopyWith<$Res> implements $CoordinatesCopyWith<$Res> {
  factory _$CoordinatesCopyWith(_Coordinates value, $Res Function(_Coordinates) _then) = __$CoordinatesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude
});




}
/// @nodoc
class __$CoordinatesCopyWithImpl<$Res>
    implements _$CoordinatesCopyWith<$Res> {
  __$CoordinatesCopyWithImpl(this._self, this._then);

  final _Coordinates _self;
  final $Res Function(_Coordinates) _then;

/// Create a copy of Coordinates
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_Coordinates(
latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$Prayer {

@JsonKey(name: "name") Name? get name;@JsonKey(name: "time", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch) DateTime? get time;@JsonKey(name: "audio") String? get audio;
/// Create a copy of Prayer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrayerCopyWith<Prayer> get copyWith => _$PrayerCopyWithImpl<Prayer>(this as Prayer, _$identity);

  /// Serializes this Prayer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Prayer&&(identical(other.name, name) || other.name == name)&&(identical(other.time, time) || other.time == time)&&(identical(other.audio, audio) || other.audio == audio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,time,audio);

@override
String toString() {
  return 'Prayer(name: $name, time: $time, audio: $audio)';
}


}

/// @nodoc
abstract mixin class $PrayerCopyWith<$Res>  {
  factory $PrayerCopyWith(Prayer value, $Res Function(Prayer) _then) = _$PrayerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "name") Name? name,@JsonKey(name: "time", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch) DateTime? time,@JsonKey(name: "audio") String? audio
});




}
/// @nodoc
class _$PrayerCopyWithImpl<$Res>
    implements $PrayerCopyWith<$Res> {
  _$PrayerCopyWithImpl(this._self, this._then);

  final Prayer _self;
  final $Res Function(Prayer) _then;

/// Create a copy of Prayer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? time = freezed,Object? audio = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Name?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,audio: freezed == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Prayer].
extension PrayerPatterns on Prayer {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Prayer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Prayer() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Prayer value)  $default,){
final _that = this;
switch (_that) {
case _Prayer():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Prayer value)?  $default,){
final _that = this;
switch (_that) {
case _Prayer() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "name")  Name? name, @JsonKey(name: "time", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch)  DateTime? time, @JsonKey(name: "audio")  String? audio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Prayer() when $default != null:
return $default(_that.name,_that.time,_that.audio);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "name")  Name? name, @JsonKey(name: "time", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch)  DateTime? time, @JsonKey(name: "audio")  String? audio)  $default,) {final _that = this;
switch (_that) {
case _Prayer():
return $default(_that.name,_that.time,_that.audio);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "name")  Name? name, @JsonKey(name: "time", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch)  DateTime? time, @JsonKey(name: "audio")  String? audio)?  $default,) {final _that = this;
switch (_that) {
case _Prayer() when $default != null:
return $default(_that.name,_that.time,_that.audio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Prayer implements Prayer {
  const _Prayer({@JsonKey(name: "name") this.name, @JsonKey(name: "time", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch) this.time, @JsonKey(name: "audio") this.audio});
  factory _Prayer.fromJson(Map<String, dynamic> json) => _$PrayerFromJson(json);

@override@JsonKey(name: "name") final  Name? name;
@override@JsonKey(name: "time", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch) final  DateTime? time;
@override@JsonKey(name: "audio") final  String? audio;

/// Create a copy of Prayer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrayerCopyWith<_Prayer> get copyWith => __$PrayerCopyWithImpl<_Prayer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrayerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Prayer&&(identical(other.name, name) || other.name == name)&&(identical(other.time, time) || other.time == time)&&(identical(other.audio, audio) || other.audio == audio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,time,audio);

@override
String toString() {
  return 'Prayer(name: $name, time: $time, audio: $audio)';
}


}

/// @nodoc
abstract mixin class _$PrayerCopyWith<$Res> implements $PrayerCopyWith<$Res> {
  factory _$PrayerCopyWith(_Prayer value, $Res Function(_Prayer) _then) = __$PrayerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "name") Name? name,@JsonKey(name: "time", fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: dateToMillisecondsSinceEpoch) DateTime? time,@JsonKey(name: "audio") String? audio
});




}
/// @nodoc
class __$PrayerCopyWithImpl<$Res>
    implements _$PrayerCopyWith<$Res> {
  __$PrayerCopyWithImpl(this._self, this._then);

  final _Prayer _self;
  final $Res Function(_Prayer) _then;

/// Create a copy of Prayer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? time = freezed,Object? audio = freezed,}) {
  return _then(_Prayer(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Name?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime?,audio: freezed == audio ? _self.audio : audio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
