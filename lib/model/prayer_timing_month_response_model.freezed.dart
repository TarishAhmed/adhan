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

@JsonKey(name: "code") int? get code;@JsonKey(name: "status") String? get status;@JsonKey(name: "data") List<Datum>? get data;
/// Create a copy of PrayerTimingMonthResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrayerTimingMonthResponseModelCopyWith<PrayerTimingMonthResponseModel> get copyWith => _$PrayerTimingMonthResponseModelCopyWithImpl<PrayerTimingMonthResponseModel>(this as PrayerTimingMonthResponseModel, _$identity);

  /// Serializes this PrayerTimingMonthResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrayerTimingMonthResponseModel&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,status,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'PrayerTimingMonthResponseModel(code: $code, status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $PrayerTimingMonthResponseModelCopyWith<$Res>  {
  factory $PrayerTimingMonthResponseModelCopyWith(PrayerTimingMonthResponseModel value, $Res Function(PrayerTimingMonthResponseModel) _then) = _$PrayerTimingMonthResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "code") int? code,@JsonKey(name: "status") String? status,@JsonKey(name: "data") List<Datum>? data
});




}
/// @nodoc
class _$PrayerTimingMonthResponseModelCopyWithImpl<$Res>
    implements $PrayerTimingMonthResponseModelCopyWith<$Res> {
  _$PrayerTimingMonthResponseModelCopyWithImpl(this._self, this._then);

  final PrayerTimingMonthResponseModel _self;
  final $Res Function(PrayerTimingMonthResponseModel) _then;

/// Create a copy of PrayerTimingMonthResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = freezed,Object? status = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Datum>?,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "code")  int? code, @JsonKey(name: "status")  String? status, @JsonKey(name: "data")  List<Datum>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrayerTimingMonthResponseModel() when $default != null:
return $default(_that.code,_that.status,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "code")  int? code, @JsonKey(name: "status")  String? status, @JsonKey(name: "data")  List<Datum>? data)  $default,) {final _that = this;
switch (_that) {
case _PrayerTimingMonthResponseModel():
return $default(_that.code,_that.status,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "code")  int? code, @JsonKey(name: "status")  String? status, @JsonKey(name: "data")  List<Datum>? data)?  $default,) {final _that = this;
switch (_that) {
case _PrayerTimingMonthResponseModel() when $default != null:
return $default(_that.code,_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrayerTimingMonthResponseModel implements PrayerTimingMonthResponseModel {
  const _PrayerTimingMonthResponseModel({@JsonKey(name: "code") this.code, @JsonKey(name: "status") this.status, @JsonKey(name: "data") final  List<Datum>? data}): _data = data;
  factory _PrayerTimingMonthResponseModel.fromJson(Map<String, dynamic> json) => _$PrayerTimingMonthResponseModelFromJson(json);

@override@JsonKey(name: "code") final  int? code;
@override@JsonKey(name: "status") final  String? status;
 final  List<Datum>? _data;
@override@JsonKey(name: "data") List<Datum>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrayerTimingMonthResponseModel&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,status,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'PrayerTimingMonthResponseModel(code: $code, status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PrayerTimingMonthResponseModelCopyWith<$Res> implements $PrayerTimingMonthResponseModelCopyWith<$Res> {
  factory _$PrayerTimingMonthResponseModelCopyWith(_PrayerTimingMonthResponseModel value, $Res Function(_PrayerTimingMonthResponseModel) _then) = __$PrayerTimingMonthResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "code") int? code,@JsonKey(name: "status") String? status,@JsonKey(name: "data") List<Datum>? data
});




}
/// @nodoc
class __$PrayerTimingMonthResponseModelCopyWithImpl<$Res>
    implements _$PrayerTimingMonthResponseModelCopyWith<$Res> {
  __$PrayerTimingMonthResponseModelCopyWithImpl(this._self, this._then);

  final _PrayerTimingMonthResponseModel _self;
  final $Res Function(_PrayerTimingMonthResponseModel) _then;

/// Create a copy of PrayerTimingMonthResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? status = freezed,Object? data = freezed,}) {
  return _then(_PrayerTimingMonthResponseModel(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Datum>?,
  ));
}


}


/// @nodoc
mixin _$Datum {

@JsonKey(name: "timings") Timings? get timings;@JsonKey(name: "date") Date? get date;@JsonKey(name: "meta") Meta? get meta;
/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatumCopyWith<Datum> get copyWith => _$DatumCopyWithImpl<Datum>(this as Datum, _$identity);

  /// Serializes this Datum to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Datum&&(identical(other.timings, timings) || other.timings == timings)&&(identical(other.date, date) || other.date == date)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timings,date,meta);

@override
String toString() {
  return 'Datum(timings: $timings, date: $date, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $DatumCopyWith<$Res>  {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) _then) = _$DatumCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "timings") Timings? timings,@JsonKey(name: "date") Date? date,@JsonKey(name: "meta") Meta? meta
});


$TimingsCopyWith<$Res>? get timings;$DateCopyWith<$Res>? get date;$MetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$DatumCopyWithImpl<$Res>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._self, this._then);

  final Datum _self;
  final $Res Function(Datum) _then;

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timings = freezed,Object? date = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
timings: freezed == timings ? _self.timings : timings // ignore: cast_nullable_to_non_nullable
as Timings?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as Date?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Meta?,
  ));
}
/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimingsCopyWith<$Res>? get timings {
    if (_self.timings == null) {
    return null;
  }

  return $TimingsCopyWith<$Res>(_self.timings!, (value) {
    return _then(_self.copyWith(timings: value));
  });
}/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DateCopyWith<$Res>? get date {
    if (_self.date == null) {
    return null;
  }

  return $DateCopyWith<$Res>(_self.date!, (value) {
    return _then(_self.copyWith(date: value));
  });
}/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $MetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [Datum].
extension DatumPatterns on Datum {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Datum value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Datum() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Datum value)  $default,){
final _that = this;
switch (_that) {
case _Datum():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Datum value)?  $default,){
final _that = this;
switch (_that) {
case _Datum() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "timings")  Timings? timings, @JsonKey(name: "date")  Date? date, @JsonKey(name: "meta")  Meta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Datum() when $default != null:
return $default(_that.timings,_that.date,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "timings")  Timings? timings, @JsonKey(name: "date")  Date? date, @JsonKey(name: "meta")  Meta? meta)  $default,) {final _that = this;
switch (_that) {
case _Datum():
return $default(_that.timings,_that.date,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "timings")  Timings? timings, @JsonKey(name: "date")  Date? date, @JsonKey(name: "meta")  Meta? meta)?  $default,) {final _that = this;
switch (_that) {
case _Datum() when $default != null:
return $default(_that.timings,_that.date,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Datum implements Datum {
  const _Datum({@JsonKey(name: "timings") this.timings, @JsonKey(name: "date") this.date, @JsonKey(name: "meta") this.meta});
  factory _Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

@override@JsonKey(name: "timings") final  Timings? timings;
@override@JsonKey(name: "date") final  Date? date;
@override@JsonKey(name: "meta") final  Meta? meta;

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DatumCopyWith<_Datum> get copyWith => __$DatumCopyWithImpl<_Datum>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DatumToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Datum&&(identical(other.timings, timings) || other.timings == timings)&&(identical(other.date, date) || other.date == date)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timings,date,meta);

@override
String toString() {
  return 'Datum(timings: $timings, date: $date, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$DatumCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$DatumCopyWith(_Datum value, $Res Function(_Datum) _then) = __$DatumCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "timings") Timings? timings,@JsonKey(name: "date") Date? date,@JsonKey(name: "meta") Meta? meta
});


@override $TimingsCopyWith<$Res>? get timings;@override $DateCopyWith<$Res>? get date;@override $MetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$DatumCopyWithImpl<$Res>
    implements _$DatumCopyWith<$Res> {
  __$DatumCopyWithImpl(this._self, this._then);

  final _Datum _self;
  final $Res Function(_Datum) _then;

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timings = freezed,Object? date = freezed,Object? meta = freezed,}) {
  return _then(_Datum(
timings: freezed == timings ? _self.timings : timings // ignore: cast_nullable_to_non_nullable
as Timings?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as Date?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Meta?,
  ));
}

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimingsCopyWith<$Res>? get timings {
    if (_self.timings == null) {
    return null;
  }

  return $TimingsCopyWith<$Res>(_self.timings!, (value) {
    return _then(_self.copyWith(timings: value));
  });
}/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DateCopyWith<$Res>? get date {
    if (_self.date == null) {
    return null;
  }

  return $DateCopyWith<$Res>(_self.date!, (value) {
    return _then(_self.copyWith(date: value));
  });
}/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $MetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$Date {

@JsonKey(name: "readable") String? get readable;@JsonKey(name: "timestamp") String? get timestamp;@JsonKey(name: "gregorian") Gregorian? get gregorian;@JsonKey(name: "hijri") Hijri? get hijri;
/// Create a copy of Date
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DateCopyWith<Date> get copyWith => _$DateCopyWithImpl<Date>(this as Date, _$identity);

  /// Serializes this Date to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Date&&(identical(other.readable, readable) || other.readable == readable)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.gregorian, gregorian) || other.gregorian == gregorian)&&(identical(other.hijri, hijri) || other.hijri == hijri));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,readable,timestamp,gregorian,hijri);

@override
String toString() {
  return 'Date(readable: $readable, timestamp: $timestamp, gregorian: $gregorian, hijri: $hijri)';
}


}

/// @nodoc
abstract mixin class $DateCopyWith<$Res>  {
  factory $DateCopyWith(Date value, $Res Function(Date) _then) = _$DateCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "readable") String? readable,@JsonKey(name: "timestamp") String? timestamp,@JsonKey(name: "gregorian") Gregorian? gregorian,@JsonKey(name: "hijri") Hijri? hijri
});


$GregorianCopyWith<$Res>? get gregorian;$HijriCopyWith<$Res>? get hijri;

}
/// @nodoc
class _$DateCopyWithImpl<$Res>
    implements $DateCopyWith<$Res> {
  _$DateCopyWithImpl(this._self, this._then);

  final Date _self;
  final $Res Function(Date) _then;

/// Create a copy of Date
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? readable = freezed,Object? timestamp = freezed,Object? gregorian = freezed,Object? hijri = freezed,}) {
  return _then(_self.copyWith(
readable: freezed == readable ? _self.readable : readable // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,gregorian: freezed == gregorian ? _self.gregorian : gregorian // ignore: cast_nullable_to_non_nullable
as Gregorian?,hijri: freezed == hijri ? _self.hijri : hijri // ignore: cast_nullable_to_non_nullable
as Hijri?,
  ));
}
/// Create a copy of Date
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GregorianCopyWith<$Res>? get gregorian {
    if (_self.gregorian == null) {
    return null;
  }

  return $GregorianCopyWith<$Res>(_self.gregorian!, (value) {
    return _then(_self.copyWith(gregorian: value));
  });
}/// Create a copy of Date
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HijriCopyWith<$Res>? get hijri {
    if (_self.hijri == null) {
    return null;
  }

  return $HijriCopyWith<$Res>(_self.hijri!, (value) {
    return _then(_self.copyWith(hijri: value));
  });
}
}


/// Adds pattern-matching-related methods to [Date].
extension DatePatterns on Date {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Date value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Date() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Date value)  $default,){
final _that = this;
switch (_that) {
case _Date():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Date value)?  $default,){
final _that = this;
switch (_that) {
case _Date() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "readable")  String? readable, @JsonKey(name: "timestamp")  String? timestamp, @JsonKey(name: "gregorian")  Gregorian? gregorian, @JsonKey(name: "hijri")  Hijri? hijri)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Date() when $default != null:
return $default(_that.readable,_that.timestamp,_that.gregorian,_that.hijri);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "readable")  String? readable, @JsonKey(name: "timestamp")  String? timestamp, @JsonKey(name: "gregorian")  Gregorian? gregorian, @JsonKey(name: "hijri")  Hijri? hijri)  $default,) {final _that = this;
switch (_that) {
case _Date():
return $default(_that.readable,_that.timestamp,_that.gregorian,_that.hijri);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "readable")  String? readable, @JsonKey(name: "timestamp")  String? timestamp, @JsonKey(name: "gregorian")  Gregorian? gregorian, @JsonKey(name: "hijri")  Hijri? hijri)?  $default,) {final _that = this;
switch (_that) {
case _Date() when $default != null:
return $default(_that.readable,_that.timestamp,_that.gregorian,_that.hijri);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Date implements Date {
  const _Date({@JsonKey(name: "readable") this.readable, @JsonKey(name: "timestamp") this.timestamp, @JsonKey(name: "gregorian") this.gregorian, @JsonKey(name: "hijri") this.hijri});
  factory _Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

@override@JsonKey(name: "readable") final  String? readable;
@override@JsonKey(name: "timestamp") final  String? timestamp;
@override@JsonKey(name: "gregorian") final  Gregorian? gregorian;
@override@JsonKey(name: "hijri") final  Hijri? hijri;

/// Create a copy of Date
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DateCopyWith<_Date> get copyWith => __$DateCopyWithImpl<_Date>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Date&&(identical(other.readable, readable) || other.readable == readable)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.gregorian, gregorian) || other.gregorian == gregorian)&&(identical(other.hijri, hijri) || other.hijri == hijri));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,readable,timestamp,gregorian,hijri);

@override
String toString() {
  return 'Date(readable: $readable, timestamp: $timestamp, gregorian: $gregorian, hijri: $hijri)';
}


}

/// @nodoc
abstract mixin class _$DateCopyWith<$Res> implements $DateCopyWith<$Res> {
  factory _$DateCopyWith(_Date value, $Res Function(_Date) _then) = __$DateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "readable") String? readable,@JsonKey(name: "timestamp") String? timestamp,@JsonKey(name: "gregorian") Gregorian? gregorian,@JsonKey(name: "hijri") Hijri? hijri
});


@override $GregorianCopyWith<$Res>? get gregorian;@override $HijriCopyWith<$Res>? get hijri;

}
/// @nodoc
class __$DateCopyWithImpl<$Res>
    implements _$DateCopyWith<$Res> {
  __$DateCopyWithImpl(this._self, this._then);

  final _Date _self;
  final $Res Function(_Date) _then;

/// Create a copy of Date
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? readable = freezed,Object? timestamp = freezed,Object? gregorian = freezed,Object? hijri = freezed,}) {
  return _then(_Date(
readable: freezed == readable ? _self.readable : readable // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,gregorian: freezed == gregorian ? _self.gregorian : gregorian // ignore: cast_nullable_to_non_nullable
as Gregorian?,hijri: freezed == hijri ? _self.hijri : hijri // ignore: cast_nullable_to_non_nullable
as Hijri?,
  ));
}

/// Create a copy of Date
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GregorianCopyWith<$Res>? get gregorian {
    if (_self.gregorian == null) {
    return null;
  }

  return $GregorianCopyWith<$Res>(_self.gregorian!, (value) {
    return _then(_self.copyWith(gregorian: value));
  });
}/// Create a copy of Date
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HijriCopyWith<$Res>? get hijri {
    if (_self.hijri == null) {
    return null;
  }

  return $HijriCopyWith<$Res>(_self.hijri!, (value) {
    return _then(_self.copyWith(hijri: value));
  });
}
}


/// @nodoc
mixin _$Gregorian {

@JsonKey(name: "date") String? get date;@JsonKey(name: "format") Format? get format;@JsonKey(name: "day") String? get day;@JsonKey(name: "weekday") GregorianWeekday? get weekday;@JsonKey(name: "month") GregorianMonth? get month;@JsonKey(name: "year") String? get year;@JsonKey(name: "designation") Designation? get designation;@JsonKey(name: "lunarSighting") bool? get lunarSighting;
/// Create a copy of Gregorian
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GregorianCopyWith<Gregorian> get copyWith => _$GregorianCopyWithImpl<Gregorian>(this as Gregorian, _$identity);

  /// Serializes this Gregorian to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Gregorian&&(identical(other.date, date) || other.date == date)&&(identical(other.format, format) || other.format == format)&&(identical(other.day, day) || other.day == day)&&(identical(other.weekday, weekday) || other.weekday == weekday)&&(identical(other.month, month) || other.month == month)&&(identical(other.year, year) || other.year == year)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.lunarSighting, lunarSighting) || other.lunarSighting == lunarSighting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,format,day,weekday,month,year,designation,lunarSighting);

@override
String toString() {
  return 'Gregorian(date: $date, format: $format, day: $day, weekday: $weekday, month: $month, year: $year, designation: $designation, lunarSighting: $lunarSighting)';
}


}

/// @nodoc
abstract mixin class $GregorianCopyWith<$Res>  {
  factory $GregorianCopyWith(Gregorian value, $Res Function(Gregorian) _then) = _$GregorianCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "date") String? date,@JsonKey(name: "format") Format? format,@JsonKey(name: "day") String? day,@JsonKey(name: "weekday") GregorianWeekday? weekday,@JsonKey(name: "month") GregorianMonth? month,@JsonKey(name: "year") String? year,@JsonKey(name: "designation") Designation? designation,@JsonKey(name: "lunarSighting") bool? lunarSighting
});


$GregorianWeekdayCopyWith<$Res>? get weekday;$GregorianMonthCopyWith<$Res>? get month;$DesignationCopyWith<$Res>? get designation;

}
/// @nodoc
class _$GregorianCopyWithImpl<$Res>
    implements $GregorianCopyWith<$Res> {
  _$GregorianCopyWithImpl(this._self, this._then);

  final Gregorian _self;
  final $Res Function(Gregorian) _then;

/// Create a copy of Gregorian
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? format = freezed,Object? day = freezed,Object? weekday = freezed,Object? month = freezed,Object? year = freezed,Object? designation = freezed,Object? lunarSighting = freezed,}) {
  return _then(_self.copyWith(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as Format?,day: freezed == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String?,weekday: freezed == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as GregorianWeekday?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as GregorianMonth?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as Designation?,lunarSighting: freezed == lunarSighting ? _self.lunarSighting : lunarSighting // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of Gregorian
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GregorianWeekdayCopyWith<$Res>? get weekday {
    if (_self.weekday == null) {
    return null;
  }

  return $GregorianWeekdayCopyWith<$Res>(_self.weekday!, (value) {
    return _then(_self.copyWith(weekday: value));
  });
}/// Create a copy of Gregorian
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GregorianMonthCopyWith<$Res>? get month {
    if (_self.month == null) {
    return null;
  }

  return $GregorianMonthCopyWith<$Res>(_self.month!, (value) {
    return _then(_self.copyWith(month: value));
  });
}/// Create a copy of Gregorian
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignationCopyWith<$Res>? get designation {
    if (_self.designation == null) {
    return null;
  }

  return $DesignationCopyWith<$Res>(_self.designation!, (value) {
    return _then(_self.copyWith(designation: value));
  });
}
}


/// Adds pattern-matching-related methods to [Gregorian].
extension GregorianPatterns on Gregorian {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Gregorian value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Gregorian() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Gregorian value)  $default,){
final _that = this;
switch (_that) {
case _Gregorian():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Gregorian value)?  $default,){
final _that = this;
switch (_that) {
case _Gregorian() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "date")  String? date, @JsonKey(name: "format")  Format? format, @JsonKey(name: "day")  String? day, @JsonKey(name: "weekday")  GregorianWeekday? weekday, @JsonKey(name: "month")  GregorianMonth? month, @JsonKey(name: "year")  String? year, @JsonKey(name: "designation")  Designation? designation, @JsonKey(name: "lunarSighting")  bool? lunarSighting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Gregorian() when $default != null:
return $default(_that.date,_that.format,_that.day,_that.weekday,_that.month,_that.year,_that.designation,_that.lunarSighting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "date")  String? date, @JsonKey(name: "format")  Format? format, @JsonKey(name: "day")  String? day, @JsonKey(name: "weekday")  GregorianWeekday? weekday, @JsonKey(name: "month")  GregorianMonth? month, @JsonKey(name: "year")  String? year, @JsonKey(name: "designation")  Designation? designation, @JsonKey(name: "lunarSighting")  bool? lunarSighting)  $default,) {final _that = this;
switch (_that) {
case _Gregorian():
return $default(_that.date,_that.format,_that.day,_that.weekday,_that.month,_that.year,_that.designation,_that.lunarSighting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "date")  String? date, @JsonKey(name: "format")  Format? format, @JsonKey(name: "day")  String? day, @JsonKey(name: "weekday")  GregorianWeekday? weekday, @JsonKey(name: "month")  GregorianMonth? month, @JsonKey(name: "year")  String? year, @JsonKey(name: "designation")  Designation? designation, @JsonKey(name: "lunarSighting")  bool? lunarSighting)?  $default,) {final _that = this;
switch (_that) {
case _Gregorian() when $default != null:
return $default(_that.date,_that.format,_that.day,_that.weekday,_that.month,_that.year,_that.designation,_that.lunarSighting);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Gregorian implements Gregorian {
  const _Gregorian({@JsonKey(name: "date") this.date, @JsonKey(name: "format") this.format, @JsonKey(name: "day") this.day, @JsonKey(name: "weekday") this.weekday, @JsonKey(name: "month") this.month, @JsonKey(name: "year") this.year, @JsonKey(name: "designation") this.designation, @JsonKey(name: "lunarSighting") this.lunarSighting});
  factory _Gregorian.fromJson(Map<String, dynamic> json) => _$GregorianFromJson(json);

@override@JsonKey(name: "date") final  String? date;
@override@JsonKey(name: "format") final  Format? format;
@override@JsonKey(name: "day") final  String? day;
@override@JsonKey(name: "weekday") final  GregorianWeekday? weekday;
@override@JsonKey(name: "month") final  GregorianMonth? month;
@override@JsonKey(name: "year") final  String? year;
@override@JsonKey(name: "designation") final  Designation? designation;
@override@JsonKey(name: "lunarSighting") final  bool? lunarSighting;

/// Create a copy of Gregorian
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GregorianCopyWith<_Gregorian> get copyWith => __$GregorianCopyWithImpl<_Gregorian>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GregorianToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Gregorian&&(identical(other.date, date) || other.date == date)&&(identical(other.format, format) || other.format == format)&&(identical(other.day, day) || other.day == day)&&(identical(other.weekday, weekday) || other.weekday == weekday)&&(identical(other.month, month) || other.month == month)&&(identical(other.year, year) || other.year == year)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.lunarSighting, lunarSighting) || other.lunarSighting == lunarSighting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,format,day,weekday,month,year,designation,lunarSighting);

@override
String toString() {
  return 'Gregorian(date: $date, format: $format, day: $day, weekday: $weekday, month: $month, year: $year, designation: $designation, lunarSighting: $lunarSighting)';
}


}

/// @nodoc
abstract mixin class _$GregorianCopyWith<$Res> implements $GregorianCopyWith<$Res> {
  factory _$GregorianCopyWith(_Gregorian value, $Res Function(_Gregorian) _then) = __$GregorianCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "date") String? date,@JsonKey(name: "format") Format? format,@JsonKey(name: "day") String? day,@JsonKey(name: "weekday") GregorianWeekday? weekday,@JsonKey(name: "month") GregorianMonth? month,@JsonKey(name: "year") String? year,@JsonKey(name: "designation") Designation? designation,@JsonKey(name: "lunarSighting") bool? lunarSighting
});


@override $GregorianWeekdayCopyWith<$Res>? get weekday;@override $GregorianMonthCopyWith<$Res>? get month;@override $DesignationCopyWith<$Res>? get designation;

}
/// @nodoc
class __$GregorianCopyWithImpl<$Res>
    implements _$GregorianCopyWith<$Res> {
  __$GregorianCopyWithImpl(this._self, this._then);

  final _Gregorian _self;
  final $Res Function(_Gregorian) _then;

/// Create a copy of Gregorian
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? format = freezed,Object? day = freezed,Object? weekday = freezed,Object? month = freezed,Object? year = freezed,Object? designation = freezed,Object? lunarSighting = freezed,}) {
  return _then(_Gregorian(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as Format?,day: freezed == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String?,weekday: freezed == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as GregorianWeekday?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as GregorianMonth?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as Designation?,lunarSighting: freezed == lunarSighting ? _self.lunarSighting : lunarSighting // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of Gregorian
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GregorianWeekdayCopyWith<$Res>? get weekday {
    if (_self.weekday == null) {
    return null;
  }

  return $GregorianWeekdayCopyWith<$Res>(_self.weekday!, (value) {
    return _then(_self.copyWith(weekday: value));
  });
}/// Create a copy of Gregorian
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GregorianMonthCopyWith<$Res>? get month {
    if (_self.month == null) {
    return null;
  }

  return $GregorianMonthCopyWith<$Res>(_self.month!, (value) {
    return _then(_self.copyWith(month: value));
  });
}/// Create a copy of Gregorian
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignationCopyWith<$Res>? get designation {
    if (_self.designation == null) {
    return null;
  }

  return $DesignationCopyWith<$Res>(_self.designation!, (value) {
    return _then(_self.copyWith(designation: value));
  });
}
}


/// @nodoc
mixin _$Designation {

@JsonKey(name: "abbreviated") Abbreviated? get abbreviated;@JsonKey(name: "expanded") Expanded? get expanded;
/// Create a copy of Designation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignationCopyWith<Designation> get copyWith => _$DesignationCopyWithImpl<Designation>(this as Designation, _$identity);

  /// Serializes this Designation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Designation&&(identical(other.abbreviated, abbreviated) || other.abbreviated == abbreviated)&&(identical(other.expanded, expanded) || other.expanded == expanded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,abbreviated,expanded);

@override
String toString() {
  return 'Designation(abbreviated: $abbreviated, expanded: $expanded)';
}


}

/// @nodoc
abstract mixin class $DesignationCopyWith<$Res>  {
  factory $DesignationCopyWith(Designation value, $Res Function(Designation) _then) = _$DesignationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "abbreviated") Abbreviated? abbreviated,@JsonKey(name: "expanded") Expanded? expanded
});




}
/// @nodoc
class _$DesignationCopyWithImpl<$Res>
    implements $DesignationCopyWith<$Res> {
  _$DesignationCopyWithImpl(this._self, this._then);

  final Designation _self;
  final $Res Function(Designation) _then;

/// Create a copy of Designation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? abbreviated = freezed,Object? expanded = freezed,}) {
  return _then(_self.copyWith(
abbreviated: freezed == abbreviated ? _self.abbreviated : abbreviated // ignore: cast_nullable_to_non_nullable
as Abbreviated?,expanded: freezed == expanded ? _self.expanded : expanded // ignore: cast_nullable_to_non_nullable
as Expanded?,
  ));
}

}


/// Adds pattern-matching-related methods to [Designation].
extension DesignationPatterns on Designation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Designation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Designation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Designation value)  $default,){
final _that = this;
switch (_that) {
case _Designation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Designation value)?  $default,){
final _that = this;
switch (_that) {
case _Designation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "abbreviated")  Abbreviated? abbreviated, @JsonKey(name: "expanded")  Expanded? expanded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Designation() when $default != null:
return $default(_that.abbreviated,_that.expanded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "abbreviated")  Abbreviated? abbreviated, @JsonKey(name: "expanded")  Expanded? expanded)  $default,) {final _that = this;
switch (_that) {
case _Designation():
return $default(_that.abbreviated,_that.expanded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "abbreviated")  Abbreviated? abbreviated, @JsonKey(name: "expanded")  Expanded? expanded)?  $default,) {final _that = this;
switch (_that) {
case _Designation() when $default != null:
return $default(_that.abbreviated,_that.expanded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Designation implements Designation {
  const _Designation({@JsonKey(name: "abbreviated") this.abbreviated, @JsonKey(name: "expanded") this.expanded});
  factory _Designation.fromJson(Map<String, dynamic> json) => _$DesignationFromJson(json);

@override@JsonKey(name: "abbreviated") final  Abbreviated? abbreviated;
@override@JsonKey(name: "expanded") final  Expanded? expanded;

/// Create a copy of Designation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignationCopyWith<_Designation> get copyWith => __$DesignationCopyWithImpl<_Designation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DesignationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Designation&&(identical(other.abbreviated, abbreviated) || other.abbreviated == abbreviated)&&(identical(other.expanded, expanded) || other.expanded == expanded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,abbreviated,expanded);

@override
String toString() {
  return 'Designation(abbreviated: $abbreviated, expanded: $expanded)';
}


}

/// @nodoc
abstract mixin class _$DesignationCopyWith<$Res> implements $DesignationCopyWith<$Res> {
  factory _$DesignationCopyWith(_Designation value, $Res Function(_Designation) _then) = __$DesignationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "abbreviated") Abbreviated? abbreviated,@JsonKey(name: "expanded") Expanded? expanded
});




}
/// @nodoc
class __$DesignationCopyWithImpl<$Res>
    implements _$DesignationCopyWith<$Res> {
  __$DesignationCopyWithImpl(this._self, this._then);

  final _Designation _self;
  final $Res Function(_Designation) _then;

/// Create a copy of Designation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? abbreviated = freezed,Object? expanded = freezed,}) {
  return _then(_Designation(
abbreviated: freezed == abbreviated ? _self.abbreviated : abbreviated // ignore: cast_nullable_to_non_nullable
as Abbreviated?,expanded: freezed == expanded ? _self.expanded : expanded // ignore: cast_nullable_to_non_nullable
as Expanded?,
  ));
}


}


/// @nodoc
mixin _$GregorianMonth {

@JsonKey(name: "number") int? get number;@JsonKey(name: "en") PurpleEn? get en;
/// Create a copy of GregorianMonth
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GregorianMonthCopyWith<GregorianMonth> get copyWith => _$GregorianMonthCopyWithImpl<GregorianMonth>(this as GregorianMonth, _$identity);

  /// Serializes this GregorianMonth to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GregorianMonth&&(identical(other.number, number) || other.number == number)&&(identical(other.en, en) || other.en == en));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,en);

@override
String toString() {
  return 'GregorianMonth(number: $number, en: $en)';
}


}

/// @nodoc
abstract mixin class $GregorianMonthCopyWith<$Res>  {
  factory $GregorianMonthCopyWith(GregorianMonth value, $Res Function(GregorianMonth) _then) = _$GregorianMonthCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "number") int? number,@JsonKey(name: "en") PurpleEn? en
});




}
/// @nodoc
class _$GregorianMonthCopyWithImpl<$Res>
    implements $GregorianMonthCopyWith<$Res> {
  _$GregorianMonthCopyWithImpl(this._self, this._then);

  final GregorianMonth _self;
  final $Res Function(GregorianMonth) _then;

/// Create a copy of GregorianMonth
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = freezed,Object? en = freezed,}) {
  return _then(_self.copyWith(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as PurpleEn?,
  ));
}

}


/// Adds pattern-matching-related methods to [GregorianMonth].
extension GregorianMonthPatterns on GregorianMonth {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GregorianMonth value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GregorianMonth() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GregorianMonth value)  $default,){
final _that = this;
switch (_that) {
case _GregorianMonth():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GregorianMonth value)?  $default,){
final _that = this;
switch (_that) {
case _GregorianMonth() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "number")  int? number, @JsonKey(name: "en")  PurpleEn? en)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GregorianMonth() when $default != null:
return $default(_that.number,_that.en);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "number")  int? number, @JsonKey(name: "en")  PurpleEn? en)  $default,) {final _that = this;
switch (_that) {
case _GregorianMonth():
return $default(_that.number,_that.en);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "number")  int? number, @JsonKey(name: "en")  PurpleEn? en)?  $default,) {final _that = this;
switch (_that) {
case _GregorianMonth() when $default != null:
return $default(_that.number,_that.en);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GregorianMonth implements GregorianMonth {
  const _GregorianMonth({@JsonKey(name: "number") this.number, @JsonKey(name: "en") this.en});
  factory _GregorianMonth.fromJson(Map<String, dynamic> json) => _$GregorianMonthFromJson(json);

@override@JsonKey(name: "number") final  int? number;
@override@JsonKey(name: "en") final  PurpleEn? en;

/// Create a copy of GregorianMonth
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GregorianMonthCopyWith<_GregorianMonth> get copyWith => __$GregorianMonthCopyWithImpl<_GregorianMonth>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GregorianMonthToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GregorianMonth&&(identical(other.number, number) || other.number == number)&&(identical(other.en, en) || other.en == en));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,en);

@override
String toString() {
  return 'GregorianMonth(number: $number, en: $en)';
}


}

/// @nodoc
abstract mixin class _$GregorianMonthCopyWith<$Res> implements $GregorianMonthCopyWith<$Res> {
  factory _$GregorianMonthCopyWith(_GregorianMonth value, $Res Function(_GregorianMonth) _then) = __$GregorianMonthCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "number") int? number,@JsonKey(name: "en") PurpleEn? en
});




}
/// @nodoc
class __$GregorianMonthCopyWithImpl<$Res>
    implements _$GregorianMonthCopyWith<$Res> {
  __$GregorianMonthCopyWithImpl(this._self, this._then);

  final _GregorianMonth _self;
  final $Res Function(_GregorianMonth) _then;

/// Create a copy of GregorianMonth
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = freezed,Object? en = freezed,}) {
  return _then(_GregorianMonth(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as PurpleEn?,
  ));
}


}


/// @nodoc
mixin _$GregorianWeekday {

@JsonKey(name: "en") String? get en;
/// Create a copy of GregorianWeekday
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GregorianWeekdayCopyWith<GregorianWeekday> get copyWith => _$GregorianWeekdayCopyWithImpl<GregorianWeekday>(this as GregorianWeekday, _$identity);

  /// Serializes this GregorianWeekday to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GregorianWeekday&&(identical(other.en, en) || other.en == en));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,en);

@override
String toString() {
  return 'GregorianWeekday(en: $en)';
}


}

/// @nodoc
abstract mixin class $GregorianWeekdayCopyWith<$Res>  {
  factory $GregorianWeekdayCopyWith(GregorianWeekday value, $Res Function(GregorianWeekday) _then) = _$GregorianWeekdayCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "en") String? en
});




}
/// @nodoc
class _$GregorianWeekdayCopyWithImpl<$Res>
    implements $GregorianWeekdayCopyWith<$Res> {
  _$GregorianWeekdayCopyWithImpl(this._self, this._then);

  final GregorianWeekday _self;
  final $Res Function(GregorianWeekday) _then;

/// Create a copy of GregorianWeekday
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? en = freezed,}) {
  return _then(_self.copyWith(
en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GregorianWeekday].
extension GregorianWeekdayPatterns on GregorianWeekday {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GregorianWeekday value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GregorianWeekday() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GregorianWeekday value)  $default,){
final _that = this;
switch (_that) {
case _GregorianWeekday():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GregorianWeekday value)?  $default,){
final _that = this;
switch (_that) {
case _GregorianWeekday() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "en")  String? en)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GregorianWeekday() when $default != null:
return $default(_that.en);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "en")  String? en)  $default,) {final _that = this;
switch (_that) {
case _GregorianWeekday():
return $default(_that.en);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "en")  String? en)?  $default,) {final _that = this;
switch (_that) {
case _GregorianWeekday() when $default != null:
return $default(_that.en);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GregorianWeekday implements GregorianWeekday {
  const _GregorianWeekday({@JsonKey(name: "en") this.en});
  factory _GregorianWeekday.fromJson(Map<String, dynamic> json) => _$GregorianWeekdayFromJson(json);

@override@JsonKey(name: "en") final  String? en;

/// Create a copy of GregorianWeekday
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GregorianWeekdayCopyWith<_GregorianWeekday> get copyWith => __$GregorianWeekdayCopyWithImpl<_GregorianWeekday>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GregorianWeekdayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GregorianWeekday&&(identical(other.en, en) || other.en == en));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,en);

@override
String toString() {
  return 'GregorianWeekday(en: $en)';
}


}

/// @nodoc
abstract mixin class _$GregorianWeekdayCopyWith<$Res> implements $GregorianWeekdayCopyWith<$Res> {
  factory _$GregorianWeekdayCopyWith(_GregorianWeekday value, $Res Function(_GregorianWeekday) _then) = __$GregorianWeekdayCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "en") String? en
});




}
/// @nodoc
class __$GregorianWeekdayCopyWithImpl<$Res>
    implements _$GregorianWeekdayCopyWith<$Res> {
  __$GregorianWeekdayCopyWithImpl(this._self, this._then);

  final _GregorianWeekday _self;
  final $Res Function(_GregorianWeekday) _then;

/// Create a copy of GregorianWeekday
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? en = freezed,}) {
  return _then(_GregorianWeekday(
en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Hijri {

@JsonKey(name: "date") String? get date;@JsonKey(name: "format") Format? get format;@JsonKey(name: "day") String? get day;@JsonKey(name: "weekday") HijriWeekday? get weekday;@JsonKey(name: "month") HijriMonth? get month;@JsonKey(name: "year") String? get year;@JsonKey(name: "designation") Designation? get designation;@JsonKey(name: "holidays") List<String>? get holidays;@JsonKey(name: "adjustedHolidays") List<dynamic>? get adjustedHolidays;@JsonKey(name: "method") MethodEnum? get method;
/// Create a copy of Hijri
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HijriCopyWith<Hijri> get copyWith => _$HijriCopyWithImpl<Hijri>(this as Hijri, _$identity);

  /// Serializes this Hijri to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hijri&&(identical(other.date, date) || other.date == date)&&(identical(other.format, format) || other.format == format)&&(identical(other.day, day) || other.day == day)&&(identical(other.weekday, weekday) || other.weekday == weekday)&&(identical(other.month, month) || other.month == month)&&(identical(other.year, year) || other.year == year)&&(identical(other.designation, designation) || other.designation == designation)&&const DeepCollectionEquality().equals(other.holidays, holidays)&&const DeepCollectionEquality().equals(other.adjustedHolidays, adjustedHolidays)&&(identical(other.method, method) || other.method == method));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,format,day,weekday,month,year,designation,const DeepCollectionEquality().hash(holidays),const DeepCollectionEquality().hash(adjustedHolidays),method);

@override
String toString() {
  return 'Hijri(date: $date, format: $format, day: $day, weekday: $weekday, month: $month, year: $year, designation: $designation, holidays: $holidays, adjustedHolidays: $adjustedHolidays, method: $method)';
}


}

/// @nodoc
abstract mixin class $HijriCopyWith<$Res>  {
  factory $HijriCopyWith(Hijri value, $Res Function(Hijri) _then) = _$HijriCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "date") String? date,@JsonKey(name: "format") Format? format,@JsonKey(name: "day") String? day,@JsonKey(name: "weekday") HijriWeekday? weekday,@JsonKey(name: "month") HijriMonth? month,@JsonKey(name: "year") String? year,@JsonKey(name: "designation") Designation? designation,@JsonKey(name: "holidays") List<String>? holidays,@JsonKey(name: "adjustedHolidays") List<dynamic>? adjustedHolidays,@JsonKey(name: "method") MethodEnum? method
});


$HijriWeekdayCopyWith<$Res>? get weekday;$HijriMonthCopyWith<$Res>? get month;$DesignationCopyWith<$Res>? get designation;

}
/// @nodoc
class _$HijriCopyWithImpl<$Res>
    implements $HijriCopyWith<$Res> {
  _$HijriCopyWithImpl(this._self, this._then);

  final Hijri _self;
  final $Res Function(Hijri) _then;

/// Create a copy of Hijri
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? format = freezed,Object? day = freezed,Object? weekday = freezed,Object? month = freezed,Object? year = freezed,Object? designation = freezed,Object? holidays = freezed,Object? adjustedHolidays = freezed,Object? method = freezed,}) {
  return _then(_self.copyWith(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as Format?,day: freezed == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String?,weekday: freezed == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as HijriWeekday?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as HijriMonth?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as Designation?,holidays: freezed == holidays ? _self.holidays : holidays // ignore: cast_nullable_to_non_nullable
as List<String>?,adjustedHolidays: freezed == adjustedHolidays ? _self.adjustedHolidays : adjustedHolidays // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as MethodEnum?,
  ));
}
/// Create a copy of Hijri
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HijriWeekdayCopyWith<$Res>? get weekday {
    if (_self.weekday == null) {
    return null;
  }

  return $HijriWeekdayCopyWith<$Res>(_self.weekday!, (value) {
    return _then(_self.copyWith(weekday: value));
  });
}/// Create a copy of Hijri
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HijriMonthCopyWith<$Res>? get month {
    if (_self.month == null) {
    return null;
  }

  return $HijriMonthCopyWith<$Res>(_self.month!, (value) {
    return _then(_self.copyWith(month: value));
  });
}/// Create a copy of Hijri
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignationCopyWith<$Res>? get designation {
    if (_self.designation == null) {
    return null;
  }

  return $DesignationCopyWith<$Res>(_self.designation!, (value) {
    return _then(_self.copyWith(designation: value));
  });
}
}


/// Adds pattern-matching-related methods to [Hijri].
extension HijriPatterns on Hijri {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Hijri value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hijri() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Hijri value)  $default,){
final _that = this;
switch (_that) {
case _Hijri():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Hijri value)?  $default,){
final _that = this;
switch (_that) {
case _Hijri() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "date")  String? date, @JsonKey(name: "format")  Format? format, @JsonKey(name: "day")  String? day, @JsonKey(name: "weekday")  HijriWeekday? weekday, @JsonKey(name: "month")  HijriMonth? month, @JsonKey(name: "year")  String? year, @JsonKey(name: "designation")  Designation? designation, @JsonKey(name: "holidays")  List<String>? holidays, @JsonKey(name: "adjustedHolidays")  List<dynamic>? adjustedHolidays, @JsonKey(name: "method")  MethodEnum? method)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hijri() when $default != null:
return $default(_that.date,_that.format,_that.day,_that.weekday,_that.month,_that.year,_that.designation,_that.holidays,_that.adjustedHolidays,_that.method);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "date")  String? date, @JsonKey(name: "format")  Format? format, @JsonKey(name: "day")  String? day, @JsonKey(name: "weekday")  HijriWeekday? weekday, @JsonKey(name: "month")  HijriMonth? month, @JsonKey(name: "year")  String? year, @JsonKey(name: "designation")  Designation? designation, @JsonKey(name: "holidays")  List<String>? holidays, @JsonKey(name: "adjustedHolidays")  List<dynamic>? adjustedHolidays, @JsonKey(name: "method")  MethodEnum? method)  $default,) {final _that = this;
switch (_that) {
case _Hijri():
return $default(_that.date,_that.format,_that.day,_that.weekday,_that.month,_that.year,_that.designation,_that.holidays,_that.adjustedHolidays,_that.method);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "date")  String? date, @JsonKey(name: "format")  Format? format, @JsonKey(name: "day")  String? day, @JsonKey(name: "weekday")  HijriWeekday? weekday, @JsonKey(name: "month")  HijriMonth? month, @JsonKey(name: "year")  String? year, @JsonKey(name: "designation")  Designation? designation, @JsonKey(name: "holidays")  List<String>? holidays, @JsonKey(name: "adjustedHolidays")  List<dynamic>? adjustedHolidays, @JsonKey(name: "method")  MethodEnum? method)?  $default,) {final _that = this;
switch (_that) {
case _Hijri() when $default != null:
return $default(_that.date,_that.format,_that.day,_that.weekday,_that.month,_that.year,_that.designation,_that.holidays,_that.adjustedHolidays,_that.method);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Hijri implements Hijri {
  const _Hijri({@JsonKey(name: "date") this.date, @JsonKey(name: "format") this.format, @JsonKey(name: "day") this.day, @JsonKey(name: "weekday") this.weekday, @JsonKey(name: "month") this.month, @JsonKey(name: "year") this.year, @JsonKey(name: "designation") this.designation, @JsonKey(name: "holidays") final  List<String>? holidays, @JsonKey(name: "adjustedHolidays") final  List<dynamic>? adjustedHolidays, @JsonKey(name: "method") this.method}): _holidays = holidays,_adjustedHolidays = adjustedHolidays;
  factory _Hijri.fromJson(Map<String, dynamic> json) => _$HijriFromJson(json);

@override@JsonKey(name: "date") final  String? date;
@override@JsonKey(name: "format") final  Format? format;
@override@JsonKey(name: "day") final  String? day;
@override@JsonKey(name: "weekday") final  HijriWeekday? weekday;
@override@JsonKey(name: "month") final  HijriMonth? month;
@override@JsonKey(name: "year") final  String? year;
@override@JsonKey(name: "designation") final  Designation? designation;
 final  List<String>? _holidays;
@override@JsonKey(name: "holidays") List<String>? get holidays {
  final value = _holidays;
  if (value == null) return null;
  if (_holidays is EqualUnmodifiableListView) return _holidays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _adjustedHolidays;
@override@JsonKey(name: "adjustedHolidays") List<dynamic>? get adjustedHolidays {
  final value = _adjustedHolidays;
  if (value == null) return null;
  if (_adjustedHolidays is EqualUnmodifiableListView) return _adjustedHolidays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "method") final  MethodEnum? method;

/// Create a copy of Hijri
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HijriCopyWith<_Hijri> get copyWith => __$HijriCopyWithImpl<_Hijri>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HijriToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hijri&&(identical(other.date, date) || other.date == date)&&(identical(other.format, format) || other.format == format)&&(identical(other.day, day) || other.day == day)&&(identical(other.weekday, weekday) || other.weekday == weekday)&&(identical(other.month, month) || other.month == month)&&(identical(other.year, year) || other.year == year)&&(identical(other.designation, designation) || other.designation == designation)&&const DeepCollectionEquality().equals(other._holidays, _holidays)&&const DeepCollectionEquality().equals(other._adjustedHolidays, _adjustedHolidays)&&(identical(other.method, method) || other.method == method));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,format,day,weekday,month,year,designation,const DeepCollectionEquality().hash(_holidays),const DeepCollectionEquality().hash(_adjustedHolidays),method);

@override
String toString() {
  return 'Hijri(date: $date, format: $format, day: $day, weekday: $weekday, month: $month, year: $year, designation: $designation, holidays: $holidays, adjustedHolidays: $adjustedHolidays, method: $method)';
}


}

/// @nodoc
abstract mixin class _$HijriCopyWith<$Res> implements $HijriCopyWith<$Res> {
  factory _$HijriCopyWith(_Hijri value, $Res Function(_Hijri) _then) = __$HijriCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "date") String? date,@JsonKey(name: "format") Format? format,@JsonKey(name: "day") String? day,@JsonKey(name: "weekday") HijriWeekday? weekday,@JsonKey(name: "month") HijriMonth? month,@JsonKey(name: "year") String? year,@JsonKey(name: "designation") Designation? designation,@JsonKey(name: "holidays") List<String>? holidays,@JsonKey(name: "adjustedHolidays") List<dynamic>? adjustedHolidays,@JsonKey(name: "method") MethodEnum? method
});


@override $HijriWeekdayCopyWith<$Res>? get weekday;@override $HijriMonthCopyWith<$Res>? get month;@override $DesignationCopyWith<$Res>? get designation;

}
/// @nodoc
class __$HijriCopyWithImpl<$Res>
    implements _$HijriCopyWith<$Res> {
  __$HijriCopyWithImpl(this._self, this._then);

  final _Hijri _self;
  final $Res Function(_Hijri) _then;

/// Create a copy of Hijri
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? format = freezed,Object? day = freezed,Object? weekday = freezed,Object? month = freezed,Object? year = freezed,Object? designation = freezed,Object? holidays = freezed,Object? adjustedHolidays = freezed,Object? method = freezed,}) {
  return _then(_Hijri(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as Format?,day: freezed == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String?,weekday: freezed == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as HijriWeekday?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as HijriMonth?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as Designation?,holidays: freezed == holidays ? _self._holidays : holidays // ignore: cast_nullable_to_non_nullable
as List<String>?,adjustedHolidays: freezed == adjustedHolidays ? _self._adjustedHolidays : adjustedHolidays // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as MethodEnum?,
  ));
}

/// Create a copy of Hijri
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HijriWeekdayCopyWith<$Res>? get weekday {
    if (_self.weekday == null) {
    return null;
  }

  return $HijriWeekdayCopyWith<$Res>(_self.weekday!, (value) {
    return _then(_self.copyWith(weekday: value));
  });
}/// Create a copy of Hijri
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HijriMonthCopyWith<$Res>? get month {
    if (_self.month == null) {
    return null;
  }

  return $HijriMonthCopyWith<$Res>(_self.month!, (value) {
    return _then(_self.copyWith(month: value));
  });
}/// Create a copy of Hijri
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignationCopyWith<$Res>? get designation {
    if (_self.designation == null) {
    return null;
  }

  return $DesignationCopyWith<$Res>(_self.designation!, (value) {
    return _then(_self.copyWith(designation: value));
  });
}
}


/// @nodoc
mixin _$HijriMonth {

@JsonKey(name: "number") int? get number;@JsonKey(name: "en") FluffyEn? get en;@JsonKey(name: "ar") Ar? get ar;@JsonKey(name: "days") int? get days;
/// Create a copy of HijriMonth
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HijriMonthCopyWith<HijriMonth> get copyWith => _$HijriMonthCopyWithImpl<HijriMonth>(this as HijriMonth, _$identity);

  /// Serializes this HijriMonth to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HijriMonth&&(identical(other.number, number) || other.number == number)&&(identical(other.en, en) || other.en == en)&&(identical(other.ar, ar) || other.ar == ar)&&(identical(other.days, days) || other.days == days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,en,ar,days);

@override
String toString() {
  return 'HijriMonth(number: $number, en: $en, ar: $ar, days: $days)';
}


}

/// @nodoc
abstract mixin class $HijriMonthCopyWith<$Res>  {
  factory $HijriMonthCopyWith(HijriMonth value, $Res Function(HijriMonth) _then) = _$HijriMonthCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "number") int? number,@JsonKey(name: "en") FluffyEn? en,@JsonKey(name: "ar") Ar? ar,@JsonKey(name: "days") int? days
});




}
/// @nodoc
class _$HijriMonthCopyWithImpl<$Res>
    implements $HijriMonthCopyWith<$Res> {
  _$HijriMonthCopyWithImpl(this._self, this._then);

  final HijriMonth _self;
  final $Res Function(HijriMonth) _then;

/// Create a copy of HijriMonth
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = freezed,Object? en = freezed,Object? ar = freezed,Object? days = freezed,}) {
  return _then(_self.copyWith(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as FluffyEn?,ar: freezed == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as Ar?,days: freezed == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [HijriMonth].
extension HijriMonthPatterns on HijriMonth {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HijriMonth value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HijriMonth() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HijriMonth value)  $default,){
final _that = this;
switch (_that) {
case _HijriMonth():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HijriMonth value)?  $default,){
final _that = this;
switch (_that) {
case _HijriMonth() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "number")  int? number, @JsonKey(name: "en")  FluffyEn? en, @JsonKey(name: "ar")  Ar? ar, @JsonKey(name: "days")  int? days)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HijriMonth() when $default != null:
return $default(_that.number,_that.en,_that.ar,_that.days);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "number")  int? number, @JsonKey(name: "en")  FluffyEn? en, @JsonKey(name: "ar")  Ar? ar, @JsonKey(name: "days")  int? days)  $default,) {final _that = this;
switch (_that) {
case _HijriMonth():
return $default(_that.number,_that.en,_that.ar,_that.days);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "number")  int? number, @JsonKey(name: "en")  FluffyEn? en, @JsonKey(name: "ar")  Ar? ar, @JsonKey(name: "days")  int? days)?  $default,) {final _that = this;
switch (_that) {
case _HijriMonth() when $default != null:
return $default(_that.number,_that.en,_that.ar,_that.days);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HijriMonth implements HijriMonth {
  const _HijriMonth({@JsonKey(name: "number") this.number, @JsonKey(name: "en") this.en, @JsonKey(name: "ar") this.ar, @JsonKey(name: "days") this.days});
  factory _HijriMonth.fromJson(Map<String, dynamic> json) => _$HijriMonthFromJson(json);

@override@JsonKey(name: "number") final  int? number;
@override@JsonKey(name: "en") final  FluffyEn? en;
@override@JsonKey(name: "ar") final  Ar? ar;
@override@JsonKey(name: "days") final  int? days;

/// Create a copy of HijriMonth
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HijriMonthCopyWith<_HijriMonth> get copyWith => __$HijriMonthCopyWithImpl<_HijriMonth>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HijriMonthToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HijriMonth&&(identical(other.number, number) || other.number == number)&&(identical(other.en, en) || other.en == en)&&(identical(other.ar, ar) || other.ar == ar)&&(identical(other.days, days) || other.days == days));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,en,ar,days);

@override
String toString() {
  return 'HijriMonth(number: $number, en: $en, ar: $ar, days: $days)';
}


}

/// @nodoc
abstract mixin class _$HijriMonthCopyWith<$Res> implements $HijriMonthCopyWith<$Res> {
  factory _$HijriMonthCopyWith(_HijriMonth value, $Res Function(_HijriMonth) _then) = __$HijriMonthCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "number") int? number,@JsonKey(name: "en") FluffyEn? en,@JsonKey(name: "ar") Ar? ar,@JsonKey(name: "days") int? days
});




}
/// @nodoc
class __$HijriMonthCopyWithImpl<$Res>
    implements _$HijriMonthCopyWith<$Res> {
  __$HijriMonthCopyWithImpl(this._self, this._then);

  final _HijriMonth _self;
  final $Res Function(_HijriMonth) _then;

/// Create a copy of HijriMonth
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = freezed,Object? en = freezed,Object? ar = freezed,Object? days = freezed,}) {
  return _then(_HijriMonth(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as FluffyEn?,ar: freezed == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as Ar?,days: freezed == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$HijriWeekday {

@JsonKey(name: "en") String? get en;@JsonKey(name: "ar") String? get ar;
/// Create a copy of HijriWeekday
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HijriWeekdayCopyWith<HijriWeekday> get copyWith => _$HijriWeekdayCopyWithImpl<HijriWeekday>(this as HijriWeekday, _$identity);

  /// Serializes this HijriWeekday to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HijriWeekday&&(identical(other.en, en) || other.en == en)&&(identical(other.ar, ar) || other.ar == ar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,en,ar);

@override
String toString() {
  return 'HijriWeekday(en: $en, ar: $ar)';
}


}

/// @nodoc
abstract mixin class $HijriWeekdayCopyWith<$Res>  {
  factory $HijriWeekdayCopyWith(HijriWeekday value, $Res Function(HijriWeekday) _then) = _$HijriWeekdayCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "en") String? en,@JsonKey(name: "ar") String? ar
});




}
/// @nodoc
class _$HijriWeekdayCopyWithImpl<$Res>
    implements $HijriWeekdayCopyWith<$Res> {
  _$HijriWeekdayCopyWithImpl(this._self, this._then);

  final HijriWeekday _self;
  final $Res Function(HijriWeekday) _then;

/// Create a copy of HijriWeekday
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? en = freezed,Object? ar = freezed,}) {
  return _then(_self.copyWith(
en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String?,ar: freezed == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HijriWeekday].
extension HijriWeekdayPatterns on HijriWeekday {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HijriWeekday value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HijriWeekday() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HijriWeekday value)  $default,){
final _that = this;
switch (_that) {
case _HijriWeekday():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HijriWeekday value)?  $default,){
final _that = this;
switch (_that) {
case _HijriWeekday() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "en")  String? en, @JsonKey(name: "ar")  String? ar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HijriWeekday() when $default != null:
return $default(_that.en,_that.ar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "en")  String? en, @JsonKey(name: "ar")  String? ar)  $default,) {final _that = this;
switch (_that) {
case _HijriWeekday():
return $default(_that.en,_that.ar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "en")  String? en, @JsonKey(name: "ar")  String? ar)?  $default,) {final _that = this;
switch (_that) {
case _HijriWeekday() when $default != null:
return $default(_that.en,_that.ar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HijriWeekday implements HijriWeekday {
  const _HijriWeekday({@JsonKey(name: "en") this.en, @JsonKey(name: "ar") this.ar});
  factory _HijriWeekday.fromJson(Map<String, dynamic> json) => _$HijriWeekdayFromJson(json);

@override@JsonKey(name: "en") final  String? en;
@override@JsonKey(name: "ar") final  String? ar;

/// Create a copy of HijriWeekday
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HijriWeekdayCopyWith<_HijriWeekday> get copyWith => __$HijriWeekdayCopyWithImpl<_HijriWeekday>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HijriWeekdayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HijriWeekday&&(identical(other.en, en) || other.en == en)&&(identical(other.ar, ar) || other.ar == ar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,en,ar);

@override
String toString() {
  return 'HijriWeekday(en: $en, ar: $ar)';
}


}

/// @nodoc
abstract mixin class _$HijriWeekdayCopyWith<$Res> implements $HijriWeekdayCopyWith<$Res> {
  factory _$HijriWeekdayCopyWith(_HijriWeekday value, $Res Function(_HijriWeekday) _then) = __$HijriWeekdayCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "en") String? en,@JsonKey(name: "ar") String? ar
});




}
/// @nodoc
class __$HijriWeekdayCopyWithImpl<$Res>
    implements _$HijriWeekdayCopyWith<$Res> {
  __$HijriWeekdayCopyWithImpl(this._self, this._then);

  final _HijriWeekday _self;
  final $Res Function(_HijriWeekday) _then;

/// Create a copy of HijriWeekday
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? en = freezed,Object? ar = freezed,}) {
  return _then(_HijriWeekday(
en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String?,ar: freezed == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Meta {

@JsonKey(name: "latitude") double? get latitude;@JsonKey(name: "longitude") double? get longitude;@JsonKey(name: "timezone") Timezone? get timezone;@JsonKey(name: "method") MethodClass? get method;@JsonKey(name: "latitudeAdjustmentMethod") LatitudeAdjustmentMethod? get latitudeAdjustmentMethod;@JsonKey(name: "midnightMode") MidnightMode? get midnightMode;@JsonKey(name: "school") MidnightMode? get school;@JsonKey(name: "offset") Map<String, int>? get offset;
/// Create a copy of Meta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaCopyWith<Meta> get copyWith => _$MetaCopyWithImpl<Meta>(this as Meta, _$identity);

  /// Serializes this Meta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Meta&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.method, method) || other.method == method)&&(identical(other.latitudeAdjustmentMethod, latitudeAdjustmentMethod) || other.latitudeAdjustmentMethod == latitudeAdjustmentMethod)&&(identical(other.midnightMode, midnightMode) || other.midnightMode == midnightMode)&&(identical(other.school, school) || other.school == school)&&const DeepCollectionEquality().equals(other.offset, offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,timezone,method,latitudeAdjustmentMethod,midnightMode,school,const DeepCollectionEquality().hash(offset));

@override
String toString() {
  return 'Meta(latitude: $latitude, longitude: $longitude, timezone: $timezone, method: $method, latitudeAdjustmentMethod: $latitudeAdjustmentMethod, midnightMode: $midnightMode, school: $school, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $MetaCopyWith<$Res>  {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) _then) = _$MetaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "timezone") Timezone? timezone,@JsonKey(name: "method") MethodClass? method,@JsonKey(name: "latitudeAdjustmentMethod") LatitudeAdjustmentMethod? latitudeAdjustmentMethod,@JsonKey(name: "midnightMode") MidnightMode? midnightMode,@JsonKey(name: "school") MidnightMode? school,@JsonKey(name: "offset") Map<String, int>? offset
});


$MethodClassCopyWith<$Res>? get method;

}
/// @nodoc
class _$MetaCopyWithImpl<$Res>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._self, this._then);

  final Meta _self;
  final $Res Function(Meta) _then;

/// Create a copy of Meta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = freezed,Object? longitude = freezed,Object? timezone = freezed,Object? method = freezed,Object? latitudeAdjustmentMethod = freezed,Object? midnightMode = freezed,Object? school = freezed,Object? offset = freezed,}) {
  return _then(_self.copyWith(
latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as Timezone?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as MethodClass?,latitudeAdjustmentMethod: freezed == latitudeAdjustmentMethod ? _self.latitudeAdjustmentMethod : latitudeAdjustmentMethod // ignore: cast_nullable_to_non_nullable
as LatitudeAdjustmentMethod?,midnightMode: freezed == midnightMode ? _self.midnightMode : midnightMode // ignore: cast_nullable_to_non_nullable
as MidnightMode?,school: freezed == school ? _self.school : school // ignore: cast_nullable_to_non_nullable
as MidnightMode?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,
  ));
}
/// Create a copy of Meta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MethodClassCopyWith<$Res>? get method {
    if (_self.method == null) {
    return null;
  }

  return $MethodClassCopyWith<$Res>(_self.method!, (value) {
    return _then(_self.copyWith(method: value));
  });
}
}


/// Adds pattern-matching-related methods to [Meta].
extension MetaPatterns on Meta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Meta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Meta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Meta value)  $default,){
final _that = this;
switch (_that) {
case _Meta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Meta value)?  $default,){
final _that = this;
switch (_that) {
case _Meta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "timezone")  Timezone? timezone, @JsonKey(name: "method")  MethodClass? method, @JsonKey(name: "latitudeAdjustmentMethod")  LatitudeAdjustmentMethod? latitudeAdjustmentMethod, @JsonKey(name: "midnightMode")  MidnightMode? midnightMode, @JsonKey(name: "school")  MidnightMode? school, @JsonKey(name: "offset")  Map<String, int>? offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Meta() when $default != null:
return $default(_that.latitude,_that.longitude,_that.timezone,_that.method,_that.latitudeAdjustmentMethod,_that.midnightMode,_that.school,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "timezone")  Timezone? timezone, @JsonKey(name: "method")  MethodClass? method, @JsonKey(name: "latitudeAdjustmentMethod")  LatitudeAdjustmentMethod? latitudeAdjustmentMethod, @JsonKey(name: "midnightMode")  MidnightMode? midnightMode, @JsonKey(name: "school")  MidnightMode? school, @JsonKey(name: "offset")  Map<String, int>? offset)  $default,) {final _that = this;
switch (_that) {
case _Meta():
return $default(_that.latitude,_that.longitude,_that.timezone,_that.method,_that.latitudeAdjustmentMethod,_that.midnightMode,_that.school,_that.offset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "timezone")  Timezone? timezone, @JsonKey(name: "method")  MethodClass? method, @JsonKey(name: "latitudeAdjustmentMethod")  LatitudeAdjustmentMethod? latitudeAdjustmentMethod, @JsonKey(name: "midnightMode")  MidnightMode? midnightMode, @JsonKey(name: "school")  MidnightMode? school, @JsonKey(name: "offset")  Map<String, int>? offset)?  $default,) {final _that = this;
switch (_that) {
case _Meta() when $default != null:
return $default(_that.latitude,_that.longitude,_that.timezone,_that.method,_that.latitudeAdjustmentMethod,_that.midnightMode,_that.school,_that.offset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Meta implements Meta {
  const _Meta({@JsonKey(name: "latitude") this.latitude, @JsonKey(name: "longitude") this.longitude, @JsonKey(name: "timezone") this.timezone, @JsonKey(name: "method") this.method, @JsonKey(name: "latitudeAdjustmentMethod") this.latitudeAdjustmentMethod, @JsonKey(name: "midnightMode") this.midnightMode, @JsonKey(name: "school") this.school, @JsonKey(name: "offset") final  Map<String, int>? offset}): _offset = offset;
  factory _Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

@override@JsonKey(name: "latitude") final  double? latitude;
@override@JsonKey(name: "longitude") final  double? longitude;
@override@JsonKey(name: "timezone") final  Timezone? timezone;
@override@JsonKey(name: "method") final  MethodClass? method;
@override@JsonKey(name: "latitudeAdjustmentMethod") final  LatitudeAdjustmentMethod? latitudeAdjustmentMethod;
@override@JsonKey(name: "midnightMode") final  MidnightMode? midnightMode;
@override@JsonKey(name: "school") final  MidnightMode? school;
 final  Map<String, int>? _offset;
@override@JsonKey(name: "offset") Map<String, int>? get offset {
  final value = _offset;
  if (value == null) return null;
  if (_offset is EqualUnmodifiableMapView) return _offset;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Meta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaCopyWith<_Meta> get copyWith => __$MetaCopyWithImpl<_Meta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Meta&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.method, method) || other.method == method)&&(identical(other.latitudeAdjustmentMethod, latitudeAdjustmentMethod) || other.latitudeAdjustmentMethod == latitudeAdjustmentMethod)&&(identical(other.midnightMode, midnightMode) || other.midnightMode == midnightMode)&&(identical(other.school, school) || other.school == school)&&const DeepCollectionEquality().equals(other._offset, _offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,timezone,method,latitudeAdjustmentMethod,midnightMode,school,const DeepCollectionEquality().hash(_offset));

@override
String toString() {
  return 'Meta(latitude: $latitude, longitude: $longitude, timezone: $timezone, method: $method, latitudeAdjustmentMethod: $latitudeAdjustmentMethod, midnightMode: $midnightMode, school: $school, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$MetaCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$MetaCopyWith(_Meta value, $Res Function(_Meta) _then) = __$MetaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "timezone") Timezone? timezone,@JsonKey(name: "method") MethodClass? method,@JsonKey(name: "latitudeAdjustmentMethod") LatitudeAdjustmentMethod? latitudeAdjustmentMethod,@JsonKey(name: "midnightMode") MidnightMode? midnightMode,@JsonKey(name: "school") MidnightMode? school,@JsonKey(name: "offset") Map<String, int>? offset
});


@override $MethodClassCopyWith<$Res>? get method;

}
/// @nodoc
class __$MetaCopyWithImpl<$Res>
    implements _$MetaCopyWith<$Res> {
  __$MetaCopyWithImpl(this._self, this._then);

  final _Meta _self;
  final $Res Function(_Meta) _then;

/// Create a copy of Meta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = freezed,Object? longitude = freezed,Object? timezone = freezed,Object? method = freezed,Object? latitudeAdjustmentMethod = freezed,Object? midnightMode = freezed,Object? school = freezed,Object? offset = freezed,}) {
  return _then(_Meta(
latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as Timezone?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as MethodClass?,latitudeAdjustmentMethod: freezed == latitudeAdjustmentMethod ? _self.latitudeAdjustmentMethod : latitudeAdjustmentMethod // ignore: cast_nullable_to_non_nullable
as LatitudeAdjustmentMethod?,midnightMode: freezed == midnightMode ? _self.midnightMode : midnightMode // ignore: cast_nullable_to_non_nullable
as MidnightMode?,school: freezed == school ? _self.school : school // ignore: cast_nullable_to_non_nullable
as MidnightMode?,offset: freezed == offset ? _self._offset : offset // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,
  ));
}

/// Create a copy of Meta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MethodClassCopyWith<$Res>? get method {
    if (_self.method == null) {
    return null;
  }

  return $MethodClassCopyWith<$Res>(_self.method!, (value) {
    return _then(_self.copyWith(method: value));
  });
}
}


/// @nodoc
mixin _$MethodClass {

@JsonKey(name: "id") int? get id;@JsonKey(name: "name") Name? get name;@JsonKey(name: "params") Params? get params;@JsonKey(name: "location") Location? get location;
/// Create a copy of MethodClass
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MethodClassCopyWith<MethodClass> get copyWith => _$MethodClassCopyWithImpl<MethodClass>(this as MethodClass, _$identity);

  /// Serializes this MethodClass to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MethodClass&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.params, params) || other.params == params)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,params,location);

@override
String toString() {
  return 'MethodClass(id: $id, name: $name, params: $params, location: $location)';
}


}

/// @nodoc
abstract mixin class $MethodClassCopyWith<$Res>  {
  factory $MethodClassCopyWith(MethodClass value, $Res Function(MethodClass) _then) = _$MethodClassCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") Name? name,@JsonKey(name: "params") Params? params,@JsonKey(name: "location") Location? location
});


$ParamsCopyWith<$Res>? get params;$LocationCopyWith<$Res>? get location;

}
/// @nodoc
class _$MethodClassCopyWithImpl<$Res>
    implements $MethodClassCopyWith<$Res> {
  _$MethodClassCopyWithImpl(this._self, this._then);

  final MethodClass _self;
  final $Res Function(MethodClass) _then;

/// Create a copy of MethodClass
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? params = freezed,Object? location = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Name?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as Params?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,
  ));
}
/// Create a copy of MethodClass
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParamsCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $ParamsCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of MethodClass
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [MethodClass].
extension MethodClassPatterns on MethodClass {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MethodClass value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MethodClass() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MethodClass value)  $default,){
final _that = this;
switch (_that) {
case _MethodClass():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MethodClass value)?  $default,){
final _that = this;
switch (_that) {
case _MethodClass() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  Name? name, @JsonKey(name: "params")  Params? params, @JsonKey(name: "location")  Location? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MethodClass() when $default != null:
return $default(_that.id,_that.name,_that.params,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  Name? name, @JsonKey(name: "params")  Params? params, @JsonKey(name: "location")  Location? location)  $default,) {final _that = this;
switch (_that) {
case _MethodClass():
return $default(_that.id,_that.name,_that.params,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  Name? name, @JsonKey(name: "params")  Params? params, @JsonKey(name: "location")  Location? location)?  $default,) {final _that = this;
switch (_that) {
case _MethodClass() when $default != null:
return $default(_that.id,_that.name,_that.params,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MethodClass implements MethodClass {
  const _MethodClass({@JsonKey(name: "id") this.id, @JsonKey(name: "name") this.name, @JsonKey(name: "params") this.params, @JsonKey(name: "location") this.location});
  factory _MethodClass.fromJson(Map<String, dynamic> json) => _$MethodClassFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "name") final  Name? name;
@override@JsonKey(name: "params") final  Params? params;
@override@JsonKey(name: "location") final  Location? location;

/// Create a copy of MethodClass
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MethodClassCopyWith<_MethodClass> get copyWith => __$MethodClassCopyWithImpl<_MethodClass>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MethodClassToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MethodClass&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.params, params) || other.params == params)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,params,location);

@override
String toString() {
  return 'MethodClass(id: $id, name: $name, params: $params, location: $location)';
}


}

/// @nodoc
abstract mixin class _$MethodClassCopyWith<$Res> implements $MethodClassCopyWith<$Res> {
  factory _$MethodClassCopyWith(_MethodClass value, $Res Function(_MethodClass) _then) = __$MethodClassCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") Name? name,@JsonKey(name: "params") Params? params,@JsonKey(name: "location") Location? location
});


@override $ParamsCopyWith<$Res>? get params;@override $LocationCopyWith<$Res>? get location;

}
/// @nodoc
class __$MethodClassCopyWithImpl<$Res>
    implements _$MethodClassCopyWith<$Res> {
  __$MethodClassCopyWithImpl(this._self, this._then);

  final _MethodClass _self;
  final $Res Function(_MethodClass) _then;

/// Create a copy of MethodClass
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? params = freezed,Object? location = freezed,}) {
  return _then(_MethodClass(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Name?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as Params?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,
  ));
}

/// Create a copy of MethodClass
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParamsCopyWith<$Res>? get params {
    if (_self.params == null) {
    return null;
  }

  return $ParamsCopyWith<$Res>(_self.params!, (value) {
    return _then(_self.copyWith(params: value));
  });
}/// Create a copy of MethodClass
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// @nodoc
mixin _$Location {

@JsonKey(name: "latitude") double? get latitude;@JsonKey(name: "longitude") double? get longitude;
/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationCopyWith<Location> get copyWith => _$LocationCopyWithImpl<Location>(this as Location, _$identity);

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Location&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'Location(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $LocationCopyWith<$Res>  {
  factory $LocationCopyWith(Location value, $Res Function(Location) _then) = _$LocationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude
});




}
/// @nodoc
class _$LocationCopyWithImpl<$Res>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._self, this._then);

  final Location _self;
  final $Res Function(Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Location].
extension LocationPatterns on Location {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Location value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Location() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Location value)  $default,){
final _that = this;
switch (_that) {
case _Location():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Location value)?  $default,){
final _that = this;
switch (_that) {
case _Location() when $default != null:
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
case _Location() when $default != null:
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
case _Location():
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
case _Location() when $default != null:
return $default(_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Location implements Location {
  const _Location({@JsonKey(name: "latitude") this.latitude, @JsonKey(name: "longitude") this.longitude});
  factory _Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

@override@JsonKey(name: "latitude") final  double? latitude;
@override@JsonKey(name: "longitude") final  double? longitude;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationCopyWith<_Location> get copyWith => __$LocationCopyWithImpl<_Location>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Location&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'Location(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) _then) = __$LocationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude
});




}
/// @nodoc
class __$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(this._self, this._then);

  final _Location _self;
  final $Res Function(_Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_Location(
latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$Params {

@JsonKey(name: "Fajr") int? get fajr;@JsonKey(name: "Isha") int? get isha;
/// Create a copy of Params
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParamsCopyWith<Params> get copyWith => _$ParamsCopyWithImpl<Params>(this as Params, _$identity);

  /// Serializes this Params to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Params&&(identical(other.fajr, fajr) || other.fajr == fajr)&&(identical(other.isha, isha) || other.isha == isha));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fajr,isha);

@override
String toString() {
  return 'Params(fajr: $fajr, isha: $isha)';
}


}

/// @nodoc
abstract mixin class $ParamsCopyWith<$Res>  {
  factory $ParamsCopyWith(Params value, $Res Function(Params) _then) = _$ParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Fajr") int? fajr,@JsonKey(name: "Isha") int? isha
});




}
/// @nodoc
class _$ParamsCopyWithImpl<$Res>
    implements $ParamsCopyWith<$Res> {
  _$ParamsCopyWithImpl(this._self, this._then);

  final Params _self;
  final $Res Function(Params) _then;

/// Create a copy of Params
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fajr = freezed,Object? isha = freezed,}) {
  return _then(_self.copyWith(
fajr: freezed == fajr ? _self.fajr : fajr // ignore: cast_nullable_to_non_nullable
as int?,isha: freezed == isha ? _self.isha : isha // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Params].
extension ParamsPatterns on Params {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Params value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Params() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Params value)  $default,){
final _that = this;
switch (_that) {
case _Params():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Params value)?  $default,){
final _that = this;
switch (_that) {
case _Params() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Fajr")  int? fajr, @JsonKey(name: "Isha")  int? isha)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Params() when $default != null:
return $default(_that.fajr,_that.isha);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Fajr")  int? fajr, @JsonKey(name: "Isha")  int? isha)  $default,) {final _that = this;
switch (_that) {
case _Params():
return $default(_that.fajr,_that.isha);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Fajr")  int? fajr, @JsonKey(name: "Isha")  int? isha)?  $default,) {final _that = this;
switch (_that) {
case _Params() when $default != null:
return $default(_that.fajr,_that.isha);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Params implements Params {
  const _Params({@JsonKey(name: "Fajr") this.fajr, @JsonKey(name: "Isha") this.isha});
  factory _Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);

@override@JsonKey(name: "Fajr") final  int? fajr;
@override@JsonKey(name: "Isha") final  int? isha;

/// Create a copy of Params
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParamsCopyWith<_Params> get copyWith => __$ParamsCopyWithImpl<_Params>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Params&&(identical(other.fajr, fajr) || other.fajr == fajr)&&(identical(other.isha, isha) || other.isha == isha));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fajr,isha);

@override
String toString() {
  return 'Params(fajr: $fajr, isha: $isha)';
}


}

/// @nodoc
abstract mixin class _$ParamsCopyWith<$Res> implements $ParamsCopyWith<$Res> {
  factory _$ParamsCopyWith(_Params value, $Res Function(_Params) _then) = __$ParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Fajr") int? fajr,@JsonKey(name: "Isha") int? isha
});




}
/// @nodoc
class __$ParamsCopyWithImpl<$Res>
    implements _$ParamsCopyWith<$Res> {
  __$ParamsCopyWithImpl(this._self, this._then);

  final _Params _self;
  final $Res Function(_Params) _then;

/// Create a copy of Params
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fajr = freezed,Object? isha = freezed,}) {
  return _then(_Params(
fajr: freezed == fajr ? _self.fajr : fajr // ignore: cast_nullable_to_non_nullable
as int?,isha: freezed == isha ? _self.isha : isha // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Timings {

@JsonKey(name: "Fajr") DateTime? get fajr;@JsonKey(name: "Sunrise") DateTime? get sunrise;@JsonKey(name: "Dhuhr") DateTime? get dhuhr;@JsonKey(name: "Asr") DateTime? get asr;@JsonKey(name: "Sunset") DateTime? get sunset;@JsonKey(name: "Maghrib") DateTime? get maghrib;@JsonKey(name: "Isha") DateTime? get isha;@JsonKey(name: "Imsak") DateTime? get imsak;@JsonKey(name: "Midnight") DateTime? get midnight;@JsonKey(name: "Firstthird") DateTime? get firstthird;@JsonKey(name: "Lastthird") DateTime? get lastthird;
/// Create a copy of Timings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimingsCopyWith<Timings> get copyWith => _$TimingsCopyWithImpl<Timings>(this as Timings, _$identity);

  /// Serializes this Timings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Timings&&(identical(other.fajr, fajr) || other.fajr == fajr)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.dhuhr, dhuhr) || other.dhuhr == dhuhr)&&(identical(other.asr, asr) || other.asr == asr)&&(identical(other.sunset, sunset) || other.sunset == sunset)&&(identical(other.maghrib, maghrib) || other.maghrib == maghrib)&&(identical(other.isha, isha) || other.isha == isha)&&(identical(other.imsak, imsak) || other.imsak == imsak)&&(identical(other.midnight, midnight) || other.midnight == midnight)&&(identical(other.firstthird, firstthird) || other.firstthird == firstthird)&&(identical(other.lastthird, lastthird) || other.lastthird == lastthird));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fajr,sunrise,dhuhr,asr,sunset,maghrib,isha,imsak,midnight,firstthird,lastthird);

@override
String toString() {
  return 'Timings(fajr: $fajr, sunrise: $sunrise, dhuhr: $dhuhr, asr: $asr, sunset: $sunset, maghrib: $maghrib, isha: $isha, imsak: $imsak, midnight: $midnight, firstthird: $firstthird, lastthird: $lastthird)';
}


}

/// @nodoc
abstract mixin class $TimingsCopyWith<$Res>  {
  factory $TimingsCopyWith(Timings value, $Res Function(Timings) _then) = _$TimingsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Fajr") DateTime? fajr,@JsonKey(name: "Sunrise") DateTime? sunrise,@JsonKey(name: "Dhuhr") DateTime? dhuhr,@JsonKey(name: "Asr") DateTime? asr,@JsonKey(name: "Sunset") DateTime? sunset,@JsonKey(name: "Maghrib") DateTime? maghrib,@JsonKey(name: "Isha") DateTime? isha,@JsonKey(name: "Imsak") DateTime? imsak,@JsonKey(name: "Midnight") DateTime? midnight,@JsonKey(name: "Firstthird") DateTime? firstthird,@JsonKey(name: "Lastthird") DateTime? lastthird
});




}
/// @nodoc
class _$TimingsCopyWithImpl<$Res>
    implements $TimingsCopyWith<$Res> {
  _$TimingsCopyWithImpl(this._self, this._then);

  final Timings _self;
  final $Res Function(Timings) _then;

/// Create a copy of Timings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fajr = freezed,Object? sunrise = freezed,Object? dhuhr = freezed,Object? asr = freezed,Object? sunset = freezed,Object? maghrib = freezed,Object? isha = freezed,Object? imsak = freezed,Object? midnight = freezed,Object? firstthird = freezed,Object? lastthird = freezed,}) {
  return _then(_self.copyWith(
fajr: freezed == fajr ? _self.fajr : fajr // ignore: cast_nullable_to_non_nullable
as DateTime?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as DateTime?,dhuhr: freezed == dhuhr ? _self.dhuhr : dhuhr // ignore: cast_nullable_to_non_nullable
as DateTime?,asr: freezed == asr ? _self.asr : asr // ignore: cast_nullable_to_non_nullable
as DateTime?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as DateTime?,maghrib: freezed == maghrib ? _self.maghrib : maghrib // ignore: cast_nullable_to_non_nullable
as DateTime?,isha: freezed == isha ? _self.isha : isha // ignore: cast_nullable_to_non_nullable
as DateTime?,imsak: freezed == imsak ? _self.imsak : imsak // ignore: cast_nullable_to_non_nullable
as DateTime?,midnight: freezed == midnight ? _self.midnight : midnight // ignore: cast_nullable_to_non_nullable
as DateTime?,firstthird: freezed == firstthird ? _self.firstthird : firstthird // ignore: cast_nullable_to_non_nullable
as DateTime?,lastthird: freezed == lastthird ? _self.lastthird : lastthird // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Timings].
extension TimingsPatterns on Timings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Timings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Timings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Timings value)  $default,){
final _that = this;
switch (_that) {
case _Timings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Timings value)?  $default,){
final _that = this;
switch (_that) {
case _Timings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Fajr")  DateTime? fajr, @JsonKey(name: "Sunrise")  DateTime? sunrise, @JsonKey(name: "Dhuhr")  DateTime? dhuhr, @JsonKey(name: "Asr")  DateTime? asr, @JsonKey(name: "Sunset")  DateTime? sunset, @JsonKey(name: "Maghrib")  DateTime? maghrib, @JsonKey(name: "Isha")  DateTime? isha, @JsonKey(name: "Imsak")  DateTime? imsak, @JsonKey(name: "Midnight")  DateTime? midnight, @JsonKey(name: "Firstthird")  DateTime? firstthird, @JsonKey(name: "Lastthird")  DateTime? lastthird)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Timings() when $default != null:
return $default(_that.fajr,_that.sunrise,_that.dhuhr,_that.asr,_that.sunset,_that.maghrib,_that.isha,_that.imsak,_that.midnight,_that.firstthird,_that.lastthird);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Fajr")  DateTime? fajr, @JsonKey(name: "Sunrise")  DateTime? sunrise, @JsonKey(name: "Dhuhr")  DateTime? dhuhr, @JsonKey(name: "Asr")  DateTime? asr, @JsonKey(name: "Sunset")  DateTime? sunset, @JsonKey(name: "Maghrib")  DateTime? maghrib, @JsonKey(name: "Isha")  DateTime? isha, @JsonKey(name: "Imsak")  DateTime? imsak, @JsonKey(name: "Midnight")  DateTime? midnight, @JsonKey(name: "Firstthird")  DateTime? firstthird, @JsonKey(name: "Lastthird")  DateTime? lastthird)  $default,) {final _that = this;
switch (_that) {
case _Timings():
return $default(_that.fajr,_that.sunrise,_that.dhuhr,_that.asr,_that.sunset,_that.maghrib,_that.isha,_that.imsak,_that.midnight,_that.firstthird,_that.lastthird);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Fajr")  DateTime? fajr, @JsonKey(name: "Sunrise")  DateTime? sunrise, @JsonKey(name: "Dhuhr")  DateTime? dhuhr, @JsonKey(name: "Asr")  DateTime? asr, @JsonKey(name: "Sunset")  DateTime? sunset, @JsonKey(name: "Maghrib")  DateTime? maghrib, @JsonKey(name: "Isha")  DateTime? isha, @JsonKey(name: "Imsak")  DateTime? imsak, @JsonKey(name: "Midnight")  DateTime? midnight, @JsonKey(name: "Firstthird")  DateTime? firstthird, @JsonKey(name: "Lastthird")  DateTime? lastthird)?  $default,) {final _that = this;
switch (_that) {
case _Timings() when $default != null:
return $default(_that.fajr,_that.sunrise,_that.dhuhr,_that.asr,_that.sunset,_that.maghrib,_that.isha,_that.imsak,_that.midnight,_that.firstthird,_that.lastthird);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Timings implements Timings {
  const _Timings({@JsonKey(name: "Fajr") this.fajr, @JsonKey(name: "Sunrise") this.sunrise, @JsonKey(name: "Dhuhr") this.dhuhr, @JsonKey(name: "Asr") this.asr, @JsonKey(name: "Sunset") this.sunset, @JsonKey(name: "Maghrib") this.maghrib, @JsonKey(name: "Isha") this.isha, @JsonKey(name: "Imsak") this.imsak, @JsonKey(name: "Midnight") this.midnight, @JsonKey(name: "Firstthird") this.firstthird, @JsonKey(name: "Lastthird") this.lastthird});
  factory _Timings.fromJson(Map<String, dynamic> json) => _$TimingsFromJson(json);

@override@JsonKey(name: "Fajr") final  DateTime? fajr;
@override@JsonKey(name: "Sunrise") final  DateTime? sunrise;
@override@JsonKey(name: "Dhuhr") final  DateTime? dhuhr;
@override@JsonKey(name: "Asr") final  DateTime? asr;
@override@JsonKey(name: "Sunset") final  DateTime? sunset;
@override@JsonKey(name: "Maghrib") final  DateTime? maghrib;
@override@JsonKey(name: "Isha") final  DateTime? isha;
@override@JsonKey(name: "Imsak") final  DateTime? imsak;
@override@JsonKey(name: "Midnight") final  DateTime? midnight;
@override@JsonKey(name: "Firstthird") final  DateTime? firstthird;
@override@JsonKey(name: "Lastthird") final  DateTime? lastthird;

/// Create a copy of Timings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimingsCopyWith<_Timings> get copyWith => __$TimingsCopyWithImpl<_Timings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Timings&&(identical(other.fajr, fajr) || other.fajr == fajr)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.dhuhr, dhuhr) || other.dhuhr == dhuhr)&&(identical(other.asr, asr) || other.asr == asr)&&(identical(other.sunset, sunset) || other.sunset == sunset)&&(identical(other.maghrib, maghrib) || other.maghrib == maghrib)&&(identical(other.isha, isha) || other.isha == isha)&&(identical(other.imsak, imsak) || other.imsak == imsak)&&(identical(other.midnight, midnight) || other.midnight == midnight)&&(identical(other.firstthird, firstthird) || other.firstthird == firstthird)&&(identical(other.lastthird, lastthird) || other.lastthird == lastthird));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fajr,sunrise,dhuhr,asr,sunset,maghrib,isha,imsak,midnight,firstthird,lastthird);

@override
String toString() {
  return 'Timings(fajr: $fajr, sunrise: $sunrise, dhuhr: $dhuhr, asr: $asr, sunset: $sunset, maghrib: $maghrib, isha: $isha, imsak: $imsak, midnight: $midnight, firstthird: $firstthird, lastthird: $lastthird)';
}


}

/// @nodoc
abstract mixin class _$TimingsCopyWith<$Res> implements $TimingsCopyWith<$Res> {
  factory _$TimingsCopyWith(_Timings value, $Res Function(_Timings) _then) = __$TimingsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Fajr") DateTime? fajr,@JsonKey(name: "Sunrise") DateTime? sunrise,@JsonKey(name: "Dhuhr") DateTime? dhuhr,@JsonKey(name: "Asr") DateTime? asr,@JsonKey(name: "Sunset") DateTime? sunset,@JsonKey(name: "Maghrib") DateTime? maghrib,@JsonKey(name: "Isha") DateTime? isha,@JsonKey(name: "Imsak") DateTime? imsak,@JsonKey(name: "Midnight") DateTime? midnight,@JsonKey(name: "Firstthird") DateTime? firstthird,@JsonKey(name: "Lastthird") DateTime? lastthird
});




}
/// @nodoc
class __$TimingsCopyWithImpl<$Res>
    implements _$TimingsCopyWith<$Res> {
  __$TimingsCopyWithImpl(this._self, this._then);

  final _Timings _self;
  final $Res Function(_Timings) _then;

/// Create a copy of Timings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fajr = freezed,Object? sunrise = freezed,Object? dhuhr = freezed,Object? asr = freezed,Object? sunset = freezed,Object? maghrib = freezed,Object? isha = freezed,Object? imsak = freezed,Object? midnight = freezed,Object? firstthird = freezed,Object? lastthird = freezed,}) {
  return _then(_Timings(
fajr: freezed == fajr ? _self.fajr : fajr // ignore: cast_nullable_to_non_nullable
as DateTime?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as DateTime?,dhuhr: freezed == dhuhr ? _self.dhuhr : dhuhr // ignore: cast_nullable_to_non_nullable
as DateTime?,asr: freezed == asr ? _self.asr : asr // ignore: cast_nullable_to_non_nullable
as DateTime?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as DateTime?,maghrib: freezed == maghrib ? _self.maghrib : maghrib // ignore: cast_nullable_to_non_nullable
as DateTime?,isha: freezed == isha ? _self.isha : isha // ignore: cast_nullable_to_non_nullable
as DateTime?,imsak: freezed == imsak ? _self.imsak : imsak // ignore: cast_nullable_to_non_nullable
as DateTime?,midnight: freezed == midnight ? _self.midnight : midnight // ignore: cast_nullable_to_non_nullable
as DateTime?,firstthird: freezed == firstthird ? _self.firstthird : firstthird // ignore: cast_nullable_to_non_nullable
as DateTime?,lastthird: freezed == lastthird ? _self.lastthird : lastthird // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
