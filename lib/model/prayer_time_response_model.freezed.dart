// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prayer_time_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrayerTimeResponseModel {

@JsonKey(name: "code") int? get code;@JsonKey(name: "status") String? get status;@JsonKey(name: "data") Data? get data;
/// Create a copy of PrayerTimeResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrayerTimeResponseModelCopyWith<PrayerTimeResponseModel> get copyWith => _$PrayerTimeResponseModelCopyWithImpl<PrayerTimeResponseModel>(this as PrayerTimeResponseModel, _$identity);

  /// Serializes this PrayerTimeResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrayerTimeResponseModel&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,status,data);

@override
String toString() {
  return 'PrayerTimeResponseModel(code: $code, status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class $PrayerTimeResponseModelCopyWith<$Res>  {
  factory $PrayerTimeResponseModelCopyWith(PrayerTimeResponseModel value, $Res Function(PrayerTimeResponseModel) _then) = _$PrayerTimeResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "code") int? code,@JsonKey(name: "status") String? status,@JsonKey(name: "data") Data? data
});


$DataCopyWith<$Res>? get data;

}
/// @nodoc
class _$PrayerTimeResponseModelCopyWithImpl<$Res>
    implements $PrayerTimeResponseModelCopyWith<$Res> {
  _$PrayerTimeResponseModelCopyWithImpl(this._self, this._then);

  final PrayerTimeResponseModel _self;
  final $Res Function(PrayerTimeResponseModel) _then;

/// Create a copy of PrayerTimeResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = freezed,Object? status = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data?,
  ));
}
/// Create a copy of PrayerTimeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [PrayerTimeResponseModel].
extension PrayerTimeResponseModelPatterns on PrayerTimeResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrayerTimeResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrayerTimeResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrayerTimeResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _PrayerTimeResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrayerTimeResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _PrayerTimeResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "code")  int? code, @JsonKey(name: "status")  String? status, @JsonKey(name: "data")  Data? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrayerTimeResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "code")  int? code, @JsonKey(name: "status")  String? status, @JsonKey(name: "data")  Data? data)  $default,) {final _that = this;
switch (_that) {
case _PrayerTimeResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "code")  int? code, @JsonKey(name: "status")  String? status, @JsonKey(name: "data")  Data? data)?  $default,) {final _that = this;
switch (_that) {
case _PrayerTimeResponseModel() when $default != null:
return $default(_that.code,_that.status,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrayerTimeResponseModel implements PrayerTimeResponseModel {
  const _PrayerTimeResponseModel({@JsonKey(name: "code") this.code, @JsonKey(name: "status") this.status, @JsonKey(name: "data") this.data});
  factory _PrayerTimeResponseModel.fromJson(Map<String, dynamic> json) => _$PrayerTimeResponseModelFromJson(json);

@override@JsonKey(name: "code") final  int? code;
@override@JsonKey(name: "status") final  String? status;
@override@JsonKey(name: "data") final  Data? data;

/// Create a copy of PrayerTimeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrayerTimeResponseModelCopyWith<_PrayerTimeResponseModel> get copyWith => __$PrayerTimeResponseModelCopyWithImpl<_PrayerTimeResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrayerTimeResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrayerTimeResponseModel&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,status,data);

@override
String toString() {
  return 'PrayerTimeResponseModel(code: $code, status: $status, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PrayerTimeResponseModelCopyWith<$Res> implements $PrayerTimeResponseModelCopyWith<$Res> {
  factory _$PrayerTimeResponseModelCopyWith(_PrayerTimeResponseModel value, $Res Function(_PrayerTimeResponseModel) _then) = __$PrayerTimeResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "code") int? code,@JsonKey(name: "status") String? status,@JsonKey(name: "data") Data? data
});


@override $DataCopyWith<$Res>? get data;

}
/// @nodoc
class __$PrayerTimeResponseModelCopyWithImpl<$Res>
    implements _$PrayerTimeResponseModelCopyWith<$Res> {
  __$PrayerTimeResponseModelCopyWithImpl(this._self, this._then);

  final _PrayerTimeResponseModel _self;
  final $Res Function(_PrayerTimeResponseModel) _then;

/// Create a copy of PrayerTimeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? status = freezed,Object? data = freezed,}) {
  return _then(_PrayerTimeResponseModel(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data?,
  ));
}

/// Create a copy of PrayerTimeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$Data {

@JsonKey(name: "timings") Timings? get timings;@JsonKey(name: "date") Date? get date;@JsonKey(name: "meta") Meta? get meta;
/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataCopyWith<Data> get copyWith => _$DataCopyWithImpl<Data>(this as Data, _$identity);

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Data&&(identical(other.timings, timings) || other.timings == timings)&&(identical(other.date, date) || other.date == date)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timings,date,meta);

@override
String toString() {
  return 'Data(timings: $timings, date: $date, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $DataCopyWith<$Res>  {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) = _$DataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "timings") Timings? timings,@JsonKey(name: "date") Date? date,@JsonKey(name: "meta") Meta? meta
});


$TimingsCopyWith<$Res>? get timings;$DateCopyWith<$Res>? get date;$MetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$DataCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._self, this._then);

  final Data _self;
  final $Res Function(Data) _then;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timings = freezed,Object? date = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
timings: freezed == timings ? _self.timings : timings // ignore: cast_nullable_to_non_nullable
as Timings?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as Date?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Meta?,
  ));
}
/// Create a copy of Data
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
}/// Create a copy of Data
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
}/// Create a copy of Data
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


/// Adds pattern-matching-related methods to [Data].
extension DataPatterns on Data {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Data value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Data() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Data value)  $default,){
final _that = this;
switch (_that) {
case _Data():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Data value)?  $default,){
final _that = this;
switch (_that) {
case _Data() when $default != null:
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
case _Data() when $default != null:
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
case _Data():
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
case _Data() when $default != null:
return $default(_that.timings,_that.date,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Data implements Data {
  const _Data({@JsonKey(name: "timings") this.timings, @JsonKey(name: "date") this.date, @JsonKey(name: "meta") this.meta});
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

@override@JsonKey(name: "timings") final  Timings? timings;
@override@JsonKey(name: "date") final  Date? date;
@override@JsonKey(name: "meta") final  Meta? meta;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCopyWith<_Data> get copyWith => __$DataCopyWithImpl<_Data>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data&&(identical(other.timings, timings) || other.timings == timings)&&(identical(other.date, date) || other.date == date)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timings,date,meta);

@override
String toString() {
  return 'Data(timings: $timings, date: $date, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) = __$DataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "timings") Timings? timings,@JsonKey(name: "date") Date? date,@JsonKey(name: "meta") Meta? meta
});


@override $TimingsCopyWith<$Res>? get timings;@override $DateCopyWith<$Res>? get date;@override $MetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timings = freezed,Object? date = freezed,Object? meta = freezed,}) {
  return _then(_Data(
timings: freezed == timings ? _self.timings : timings // ignore: cast_nullable_to_non_nullable
as Timings?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as Date?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Meta?,
  ));
}

/// Create a copy of Data
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
}/// Create a copy of Data
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
}/// Create a copy of Data
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

@JsonKey(name: "readable") String? get readable;@JsonKey(name: "timestamp") String? get timestamp;@JsonKey(name: "hijri") Hijri? get hijri;@JsonKey(name: "gregorian") Gregorian? get gregorian;
/// Create a copy of Date
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DateCopyWith<Date> get copyWith => _$DateCopyWithImpl<Date>(this as Date, _$identity);

  /// Serializes this Date to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Date&&(identical(other.readable, readable) || other.readable == readable)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.hijri, hijri) || other.hijri == hijri)&&(identical(other.gregorian, gregorian) || other.gregorian == gregorian));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,readable,timestamp,hijri,gregorian);

@override
String toString() {
  return 'Date(readable: $readable, timestamp: $timestamp, hijri: $hijri, gregorian: $gregorian)';
}


}

/// @nodoc
abstract mixin class $DateCopyWith<$Res>  {
  factory $DateCopyWith(Date value, $Res Function(Date) _then) = _$DateCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "readable") String? readable,@JsonKey(name: "timestamp") String? timestamp,@JsonKey(name: "hijri") Hijri? hijri,@JsonKey(name: "gregorian") Gregorian? gregorian
});


$HijriCopyWith<$Res>? get hijri;$GregorianCopyWith<$Res>? get gregorian;

}
/// @nodoc
class _$DateCopyWithImpl<$Res>
    implements $DateCopyWith<$Res> {
  _$DateCopyWithImpl(this._self, this._then);

  final Date _self;
  final $Res Function(Date) _then;

/// Create a copy of Date
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? readable = freezed,Object? timestamp = freezed,Object? hijri = freezed,Object? gregorian = freezed,}) {
  return _then(_self.copyWith(
readable: freezed == readable ? _self.readable : readable // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,hijri: freezed == hijri ? _self.hijri : hijri // ignore: cast_nullable_to_non_nullable
as Hijri?,gregorian: freezed == gregorian ? _self.gregorian : gregorian // ignore: cast_nullable_to_non_nullable
as Gregorian?,
  ));
}
/// Create a copy of Date
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
}/// Create a copy of Date
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "readable")  String? readable, @JsonKey(name: "timestamp")  String? timestamp, @JsonKey(name: "hijri")  Hijri? hijri, @JsonKey(name: "gregorian")  Gregorian? gregorian)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Date() when $default != null:
return $default(_that.readable,_that.timestamp,_that.hijri,_that.gregorian);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "readable")  String? readable, @JsonKey(name: "timestamp")  String? timestamp, @JsonKey(name: "hijri")  Hijri? hijri, @JsonKey(name: "gregorian")  Gregorian? gregorian)  $default,) {final _that = this;
switch (_that) {
case _Date():
return $default(_that.readable,_that.timestamp,_that.hijri,_that.gregorian);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "readable")  String? readable, @JsonKey(name: "timestamp")  String? timestamp, @JsonKey(name: "hijri")  Hijri? hijri, @JsonKey(name: "gregorian")  Gregorian? gregorian)?  $default,) {final _that = this;
switch (_that) {
case _Date() when $default != null:
return $default(_that.readable,_that.timestamp,_that.hijri,_that.gregorian);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Date implements Date {
  const _Date({@JsonKey(name: "readable") this.readable, @JsonKey(name: "timestamp") this.timestamp, @JsonKey(name: "hijri") this.hijri, @JsonKey(name: "gregorian") this.gregorian});
  factory _Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

@override@JsonKey(name: "readable") final  String? readable;
@override@JsonKey(name: "timestamp") final  String? timestamp;
@override@JsonKey(name: "hijri") final  Hijri? hijri;
@override@JsonKey(name: "gregorian") final  Gregorian? gregorian;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Date&&(identical(other.readable, readable) || other.readable == readable)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.hijri, hijri) || other.hijri == hijri)&&(identical(other.gregorian, gregorian) || other.gregorian == gregorian));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,readable,timestamp,hijri,gregorian);

@override
String toString() {
  return 'Date(readable: $readable, timestamp: $timestamp, hijri: $hijri, gregorian: $gregorian)';
}


}

/// @nodoc
abstract mixin class _$DateCopyWith<$Res> implements $DateCopyWith<$Res> {
  factory _$DateCopyWith(_Date value, $Res Function(_Date) _then) = __$DateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "readable") String? readable,@JsonKey(name: "timestamp") String? timestamp,@JsonKey(name: "hijri") Hijri? hijri,@JsonKey(name: "gregorian") Gregorian? gregorian
});


@override $HijriCopyWith<$Res>? get hijri;@override $GregorianCopyWith<$Res>? get gregorian;

}
/// @nodoc
class __$DateCopyWithImpl<$Res>
    implements _$DateCopyWith<$Res> {
  __$DateCopyWithImpl(this._self, this._then);

  final _Date _self;
  final $Res Function(_Date) _then;

/// Create a copy of Date
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? readable = freezed,Object? timestamp = freezed,Object? hijri = freezed,Object? gregorian = freezed,}) {
  return _then(_Date(
readable: freezed == readable ? _self.readable : readable // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,hijri: freezed == hijri ? _self.hijri : hijri // ignore: cast_nullable_to_non_nullable
as Hijri?,gregorian: freezed == gregorian ? _self.gregorian : gregorian // ignore: cast_nullable_to_non_nullable
as Gregorian?,
  ));
}

/// Create a copy of Date
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
}/// Create a copy of Date
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
}
}


/// @nodoc
mixin _$Gregorian {

@JsonKey(name: "date") String? get date;@JsonKey(name: "format") String? get format;@JsonKey(name: "day") String? get day;@JsonKey(name: "weekday") GregorianWeekday? get weekday;@JsonKey(name: "month") GregorianMonth? get month;@JsonKey(name: "year") String? get year;@JsonKey(name: "designation") Designation? get designation;@JsonKey(name: "lunarSighting") bool? get lunarSighting;
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
@JsonKey(name: "date") String? date,@JsonKey(name: "format") String? format,@JsonKey(name: "day") String? day,@JsonKey(name: "weekday") GregorianWeekday? weekday,@JsonKey(name: "month") GregorianMonth? month,@JsonKey(name: "year") String? year,@JsonKey(name: "designation") Designation? designation,@JsonKey(name: "lunarSighting") bool? lunarSighting
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
as String?,day: freezed == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "date")  String? date, @JsonKey(name: "format")  String? format, @JsonKey(name: "day")  String? day, @JsonKey(name: "weekday")  GregorianWeekday? weekday, @JsonKey(name: "month")  GregorianMonth? month, @JsonKey(name: "year")  String? year, @JsonKey(name: "designation")  Designation? designation, @JsonKey(name: "lunarSighting")  bool? lunarSighting)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "date")  String? date, @JsonKey(name: "format")  String? format, @JsonKey(name: "day")  String? day, @JsonKey(name: "weekday")  GregorianWeekday? weekday, @JsonKey(name: "month")  GregorianMonth? month, @JsonKey(name: "year")  String? year, @JsonKey(name: "designation")  Designation? designation, @JsonKey(name: "lunarSighting")  bool? lunarSighting)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "date")  String? date, @JsonKey(name: "format")  String? format, @JsonKey(name: "day")  String? day, @JsonKey(name: "weekday")  GregorianWeekday? weekday, @JsonKey(name: "month")  GregorianMonth? month, @JsonKey(name: "year")  String? year, @JsonKey(name: "designation")  Designation? designation, @JsonKey(name: "lunarSighting")  bool? lunarSighting)?  $default,) {final _that = this;
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
@override@JsonKey(name: "format") final  String? format;
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
@JsonKey(name: "date") String? date,@JsonKey(name: "format") String? format,@JsonKey(name: "day") String? day,@JsonKey(name: "weekday") GregorianWeekday? weekday,@JsonKey(name: "month") GregorianMonth? month,@JsonKey(name: "year") String? year,@JsonKey(name: "designation") Designation? designation,@JsonKey(name: "lunarSighting") bool? lunarSighting
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
as String?,day: freezed == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
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

@JsonKey(name: "abbreviated") String? get abbreviated;@JsonKey(name: "expanded") String? get expanded;
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
@JsonKey(name: "abbreviated") String? abbreviated,@JsonKey(name: "expanded") String? expanded
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
as String?,expanded: freezed == expanded ? _self.expanded : expanded // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "abbreviated")  String? abbreviated, @JsonKey(name: "expanded")  String? expanded)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "abbreviated")  String? abbreviated, @JsonKey(name: "expanded")  String? expanded)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "abbreviated")  String? abbreviated, @JsonKey(name: "expanded")  String? expanded)?  $default,) {final _that = this;
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

@override@JsonKey(name: "abbreviated") final  String? abbreviated;
@override@JsonKey(name: "expanded") final  String? expanded;

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
@JsonKey(name: "abbreviated") String? abbreviated,@JsonKey(name: "expanded") String? expanded
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
as String?,expanded: freezed == expanded ? _self.expanded : expanded // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GregorianMonth {

@JsonKey(name: "number") int? get number;@JsonKey(name: "en") String? get en;
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
@JsonKey(name: "number") int? number,@JsonKey(name: "en") String? en
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
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "number")  int? number, @JsonKey(name: "en")  String? en)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "number")  int? number, @JsonKey(name: "en")  String? en)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "number")  int? number, @JsonKey(name: "en")  String? en)?  $default,) {final _that = this;
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
@override@JsonKey(name: "en") final  String? en;

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
@JsonKey(name: "number") int? number,@JsonKey(name: "en") String? en
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
as String?,
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

@JsonKey(name: "date") String? get date;@JsonKey(name: "format") String? get format;@JsonKey(name: "day") String? get day;@JsonKey(name: "weekday") HijriWeekday? get weekday;@JsonKey(name: "month") HijriMonth? get month;@JsonKey(name: "year") String? get year;@JsonKey(name: "designation") Designation? get designation;@JsonKey(name: "holidays") List<dynamic>? get holidays;@JsonKey(name: "adjustedHolidays") List<dynamic>? get adjustedHolidays;@JsonKey(name: "method") String? get method;
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
@JsonKey(name: "date") String? date,@JsonKey(name: "format") String? format,@JsonKey(name: "day") String? day,@JsonKey(name: "weekday") HijriWeekday? weekday,@JsonKey(name: "month") HijriMonth? month,@JsonKey(name: "year") String? year,@JsonKey(name: "designation") Designation? designation,@JsonKey(name: "holidays") List<dynamic>? holidays,@JsonKey(name: "adjustedHolidays") List<dynamic>? adjustedHolidays,@JsonKey(name: "method") String? method
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
as String?,day: freezed == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String?,weekday: freezed == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as HijriWeekday?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as HijriMonth?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as Designation?,holidays: freezed == holidays ? _self.holidays : holidays // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,adjustedHolidays: freezed == adjustedHolidays ? _self.adjustedHolidays : adjustedHolidays // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "date")  String? date, @JsonKey(name: "format")  String? format, @JsonKey(name: "day")  String? day, @JsonKey(name: "weekday")  HijriWeekday? weekday, @JsonKey(name: "month")  HijriMonth? month, @JsonKey(name: "year")  String? year, @JsonKey(name: "designation")  Designation? designation, @JsonKey(name: "holidays")  List<dynamic>? holidays, @JsonKey(name: "adjustedHolidays")  List<dynamic>? adjustedHolidays, @JsonKey(name: "method")  String? method)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "date")  String? date, @JsonKey(name: "format")  String? format, @JsonKey(name: "day")  String? day, @JsonKey(name: "weekday")  HijriWeekday? weekday, @JsonKey(name: "month")  HijriMonth? month, @JsonKey(name: "year")  String? year, @JsonKey(name: "designation")  Designation? designation, @JsonKey(name: "holidays")  List<dynamic>? holidays, @JsonKey(name: "adjustedHolidays")  List<dynamic>? adjustedHolidays, @JsonKey(name: "method")  String? method)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "date")  String? date, @JsonKey(name: "format")  String? format, @JsonKey(name: "day")  String? day, @JsonKey(name: "weekday")  HijriWeekday? weekday, @JsonKey(name: "month")  HijriMonth? month, @JsonKey(name: "year")  String? year, @JsonKey(name: "designation")  Designation? designation, @JsonKey(name: "holidays")  List<dynamic>? holidays, @JsonKey(name: "adjustedHolidays")  List<dynamic>? adjustedHolidays, @JsonKey(name: "method")  String? method)?  $default,) {final _that = this;
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
  const _Hijri({@JsonKey(name: "date") this.date, @JsonKey(name: "format") this.format, @JsonKey(name: "day") this.day, @JsonKey(name: "weekday") this.weekday, @JsonKey(name: "month") this.month, @JsonKey(name: "year") this.year, @JsonKey(name: "designation") this.designation, @JsonKey(name: "holidays") final  List<dynamic>? holidays, @JsonKey(name: "adjustedHolidays") final  List<dynamic>? adjustedHolidays, @JsonKey(name: "method") this.method}): _holidays = holidays,_adjustedHolidays = adjustedHolidays;
  factory _Hijri.fromJson(Map<String, dynamic> json) => _$HijriFromJson(json);

@override@JsonKey(name: "date") final  String? date;
@override@JsonKey(name: "format") final  String? format;
@override@JsonKey(name: "day") final  String? day;
@override@JsonKey(name: "weekday") final  HijriWeekday? weekday;
@override@JsonKey(name: "month") final  HijriMonth? month;
@override@JsonKey(name: "year") final  String? year;
@override@JsonKey(name: "designation") final  Designation? designation;
 final  List<dynamic>? _holidays;
@override@JsonKey(name: "holidays") List<dynamic>? get holidays {
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

@override@JsonKey(name: "method") final  String? method;

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
@JsonKey(name: "date") String? date,@JsonKey(name: "format") String? format,@JsonKey(name: "day") String? day,@JsonKey(name: "weekday") HijriWeekday? weekday,@JsonKey(name: "month") HijriMonth? month,@JsonKey(name: "year") String? year,@JsonKey(name: "designation") Designation? designation,@JsonKey(name: "holidays") List<dynamic>? holidays,@JsonKey(name: "adjustedHolidays") List<dynamic>? adjustedHolidays,@JsonKey(name: "method") String? method
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
as String?,day: freezed == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String?,weekday: freezed == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as HijriWeekday?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as HijriMonth?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as Designation?,holidays: freezed == holidays ? _self._holidays : holidays // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,adjustedHolidays: freezed == adjustedHolidays ? _self._adjustedHolidays : adjustedHolidays // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,
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

@JsonKey(name: "number") int? get number;@JsonKey(name: "en") String? get en;@JsonKey(name: "ar") String? get ar;@JsonKey(name: "days") int? get days;
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
@JsonKey(name: "number") int? number,@JsonKey(name: "en") String? en,@JsonKey(name: "ar") String? ar,@JsonKey(name: "days") int? days
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
as String?,ar: freezed == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as String?,days: freezed == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "number")  int? number, @JsonKey(name: "en")  String? en, @JsonKey(name: "ar")  String? ar, @JsonKey(name: "days")  int? days)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "number")  int? number, @JsonKey(name: "en")  String? en, @JsonKey(name: "ar")  String? ar, @JsonKey(name: "days")  int? days)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "number")  int? number, @JsonKey(name: "en")  String? en, @JsonKey(name: "ar")  String? ar, @JsonKey(name: "days")  int? days)?  $default,) {final _that = this;
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
@override@JsonKey(name: "en") final  String? en;
@override@JsonKey(name: "ar") final  String? ar;
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
@JsonKey(name: "number") int? number,@JsonKey(name: "en") String? en,@JsonKey(name: "ar") String? ar,@JsonKey(name: "days") int? days
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
as String?,ar: freezed == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as String?,days: freezed == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
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

@JsonKey(name: "latitude") double? get latitude;@JsonKey(name: "longitude") double? get longitude;@JsonKey(name: "timezone") String? get timezone;@JsonKey(name: "method") Method? get method;@JsonKey(name: "latitudeAdjustmentMethod") String? get latitudeAdjustmentMethod;@JsonKey(name: "midnightMode") String? get midnightMode;@JsonKey(name: "school") String? get school;@JsonKey(name: "offset") Map<String, int>? get offset;
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
@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "timezone") String? timezone,@JsonKey(name: "method") Method? method,@JsonKey(name: "latitudeAdjustmentMethod") String? latitudeAdjustmentMethod,@JsonKey(name: "midnightMode") String? midnightMode,@JsonKey(name: "school") String? school,@JsonKey(name: "offset") Map<String, int>? offset
});


$MethodCopyWith<$Res>? get method;

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
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as Method?,latitudeAdjustmentMethod: freezed == latitudeAdjustmentMethod ? _self.latitudeAdjustmentMethod : latitudeAdjustmentMethod // ignore: cast_nullable_to_non_nullable
as String?,midnightMode: freezed == midnightMode ? _self.midnightMode : midnightMode // ignore: cast_nullable_to_non_nullable
as String?,school: freezed == school ? _self.school : school // ignore: cast_nullable_to_non_nullable
as String?,offset: freezed == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,
  ));
}
/// Create a copy of Meta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MethodCopyWith<$Res>? get method {
    if (_self.method == null) {
    return null;
  }

  return $MethodCopyWith<$Res>(_self.method!, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "timezone")  String? timezone, @JsonKey(name: "method")  Method? method, @JsonKey(name: "latitudeAdjustmentMethod")  String? latitudeAdjustmentMethod, @JsonKey(name: "midnightMode")  String? midnightMode, @JsonKey(name: "school")  String? school, @JsonKey(name: "offset")  Map<String, int>? offset)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "timezone")  String? timezone, @JsonKey(name: "method")  Method? method, @JsonKey(name: "latitudeAdjustmentMethod")  String? latitudeAdjustmentMethod, @JsonKey(name: "midnightMode")  String? midnightMode, @JsonKey(name: "school")  String? school, @JsonKey(name: "offset")  Map<String, int>? offset)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "latitude")  double? latitude, @JsonKey(name: "longitude")  double? longitude, @JsonKey(name: "timezone")  String? timezone, @JsonKey(name: "method")  Method? method, @JsonKey(name: "latitudeAdjustmentMethod")  String? latitudeAdjustmentMethod, @JsonKey(name: "midnightMode")  String? midnightMode, @JsonKey(name: "school")  String? school, @JsonKey(name: "offset")  Map<String, int>? offset)?  $default,) {final _that = this;
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
@override@JsonKey(name: "timezone") final  String? timezone;
@override@JsonKey(name: "method") final  Method? method;
@override@JsonKey(name: "latitudeAdjustmentMethod") final  String? latitudeAdjustmentMethod;
@override@JsonKey(name: "midnightMode") final  String? midnightMode;
@override@JsonKey(name: "school") final  String? school;
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
@JsonKey(name: "latitude") double? latitude,@JsonKey(name: "longitude") double? longitude,@JsonKey(name: "timezone") String? timezone,@JsonKey(name: "method") Method? method,@JsonKey(name: "latitudeAdjustmentMethod") String? latitudeAdjustmentMethod,@JsonKey(name: "midnightMode") String? midnightMode,@JsonKey(name: "school") String? school,@JsonKey(name: "offset") Map<String, int>? offset
});


@override $MethodCopyWith<$Res>? get method;

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
as String?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as Method?,latitudeAdjustmentMethod: freezed == latitudeAdjustmentMethod ? _self.latitudeAdjustmentMethod : latitudeAdjustmentMethod // ignore: cast_nullable_to_non_nullable
as String?,midnightMode: freezed == midnightMode ? _self.midnightMode : midnightMode // ignore: cast_nullable_to_non_nullable
as String?,school: freezed == school ? _self.school : school // ignore: cast_nullable_to_non_nullable
as String?,offset: freezed == offset ? _self._offset : offset // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,
  ));
}

/// Create a copy of Meta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MethodCopyWith<$Res>? get method {
    if (_self.method == null) {
    return null;
  }

  return $MethodCopyWith<$Res>(_self.method!, (value) {
    return _then(_self.copyWith(method: value));
  });
}
}


/// @nodoc
mixin _$Method {

@JsonKey(name: "id") int? get id;@JsonKey(name: "name") String? get name;@JsonKey(name: "params") Params? get params;@JsonKey(name: "location") Location? get location;
/// Create a copy of Method
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MethodCopyWith<Method> get copyWith => _$MethodCopyWithImpl<Method>(this as Method, _$identity);

  /// Serializes this Method to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Method&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.params, params) || other.params == params)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,params,location);

@override
String toString() {
  return 'Method(id: $id, name: $name, params: $params, location: $location)';
}


}

/// @nodoc
abstract mixin class $MethodCopyWith<$Res>  {
  factory $MethodCopyWith(Method value, $Res Function(Method) _then) = _$MethodCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "params") Params? params,@JsonKey(name: "location") Location? location
});


$ParamsCopyWith<$Res>? get params;$LocationCopyWith<$Res>? get location;

}
/// @nodoc
class _$MethodCopyWithImpl<$Res>
    implements $MethodCopyWith<$Res> {
  _$MethodCopyWithImpl(this._self, this._then);

  final Method _self;
  final $Res Function(Method) _then;

/// Create a copy of Method
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? params = freezed,Object? location = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as Params?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,
  ));
}
/// Create a copy of Method
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
}/// Create a copy of Method
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


/// Adds pattern-matching-related methods to [Method].
extension MethodPatterns on Method {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Method value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Method() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Method value)  $default,){
final _that = this;
switch (_that) {
case _Method():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Method value)?  $default,){
final _that = this;
switch (_that) {
case _Method() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "params")  Params? params, @JsonKey(name: "location")  Location? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Method() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "params")  Params? params, @JsonKey(name: "location")  Location? location)  $default,) {final _that = this;
switch (_that) {
case _Method():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "params")  Params? params, @JsonKey(name: "location")  Location? location)?  $default,) {final _that = this;
switch (_that) {
case _Method() when $default != null:
return $default(_that.id,_that.name,_that.params,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Method implements Method {
  const _Method({@JsonKey(name: "id") this.id, @JsonKey(name: "name") this.name, @JsonKey(name: "params") this.params, @JsonKey(name: "location") this.location});
  factory _Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "params") final  Params? params;
@override@JsonKey(name: "location") final  Location? location;

/// Create a copy of Method
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MethodCopyWith<_Method> get copyWith => __$MethodCopyWithImpl<_Method>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MethodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Method&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.params, params) || other.params == params)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,params,location);

@override
String toString() {
  return 'Method(id: $id, name: $name, params: $params, location: $location)';
}


}

/// @nodoc
abstract mixin class _$MethodCopyWith<$Res> implements $MethodCopyWith<$Res> {
  factory _$MethodCopyWith(_Method value, $Res Function(_Method) _then) = __$MethodCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "params") Params? params,@JsonKey(name: "location") Location? location
});


@override $ParamsCopyWith<$Res>? get params;@override $LocationCopyWith<$Res>? get location;

}
/// @nodoc
class __$MethodCopyWithImpl<$Res>
    implements _$MethodCopyWith<$Res> {
  __$MethodCopyWithImpl(this._self, this._then);

  final _Method _self;
  final $Res Function(_Method) _then;

/// Create a copy of Method
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? params = freezed,Object? location = freezed,}) {
  return _then(_Method(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as Params?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,
  ));
}

/// Create a copy of Method
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
}/// Create a copy of Method
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

@JsonKey(name: "Fajr", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? get fajr;@JsonKey(name: "Sunrise", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? get sunrise;@JsonKey(name: "Dhuhr", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? get dhuhr;@JsonKey(name: "Asr", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? get asr;@JsonKey(name: "Sunset", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? get sunset;@JsonKey(name: "Maghrib", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? get maghrib;@JsonKey(name: "Isha", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? get isha;@JsonKey(name: "Imsak", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? get imsak;@JsonKey(name: "Midnight", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? get midnight;@JsonKey(name: "Firstthird", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? get firstthird;@JsonKey(name: "Lastthird", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? get lastthird;
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
@JsonKey(name: "Fajr", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? fajr,@JsonKey(name: "Sunrise", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? sunrise,@JsonKey(name: "Dhuhr", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? dhuhr,@JsonKey(name: "Asr", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? asr,@JsonKey(name: "Sunset", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? sunset,@JsonKey(name: "Maghrib", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? maghrib,@JsonKey(name: "Isha", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? isha,@JsonKey(name: "Imsak", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? imsak,@JsonKey(name: "Midnight", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? midnight,@JsonKey(name: "Firstthird", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? firstthird,@JsonKey(name: "Lastthird", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? lastthird
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
as TimeOfDay?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,dhuhr: freezed == dhuhr ? _self.dhuhr : dhuhr // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,asr: freezed == asr ? _self.asr : asr // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,maghrib: freezed == maghrib ? _self.maghrib : maghrib // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,isha: freezed == isha ? _self.isha : isha // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,imsak: freezed == imsak ? _self.imsak : imsak // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,midnight: freezed == midnight ? _self.midnight : midnight // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,firstthird: freezed == firstthird ? _self.firstthird : firstthird // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,lastthird: freezed == lastthird ? _self.lastthird : lastthird // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "Fajr", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? fajr, @JsonKey(name: "Sunrise", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? sunrise, @JsonKey(name: "Dhuhr", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? dhuhr, @JsonKey(name: "Asr", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? asr, @JsonKey(name: "Sunset", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? sunset, @JsonKey(name: "Maghrib", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? maghrib, @JsonKey(name: "Isha", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? isha, @JsonKey(name: "Imsak", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? imsak, @JsonKey(name: "Midnight", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? midnight, @JsonKey(name: "Firstthird", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? firstthird, @JsonKey(name: "Lastthird", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? lastthird)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "Fajr", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? fajr, @JsonKey(name: "Sunrise", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? sunrise, @JsonKey(name: "Dhuhr", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? dhuhr, @JsonKey(name: "Asr", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? asr, @JsonKey(name: "Sunset", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? sunset, @JsonKey(name: "Maghrib", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? maghrib, @JsonKey(name: "Isha", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? isha, @JsonKey(name: "Imsak", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? imsak, @JsonKey(name: "Midnight", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? midnight, @JsonKey(name: "Firstthird", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? firstthird, @JsonKey(name: "Lastthird", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? lastthird)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "Fajr", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? fajr, @JsonKey(name: "Sunrise", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? sunrise, @JsonKey(name: "Dhuhr", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? dhuhr, @JsonKey(name: "Asr", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? asr, @JsonKey(name: "Sunset", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? sunset, @JsonKey(name: "Maghrib", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? maghrib, @JsonKey(name: "Isha", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? isha, @JsonKey(name: "Imsak", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? imsak, @JsonKey(name: "Midnight", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? midnight, @JsonKey(name: "Firstthird", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? firstthird, @JsonKey(name: "Lastthird", fromJson: convertTo12Hour, toJson: convertTo24Hour)  TimeOfDay? lastthird)?  $default,) {final _that = this;
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
  const _Timings({@JsonKey(name: "Fajr", fromJson: convertTo12Hour, toJson: convertTo24Hour) this.fajr, @JsonKey(name: "Sunrise", fromJson: convertTo12Hour, toJson: convertTo24Hour) this.sunrise, @JsonKey(name: "Dhuhr", fromJson: convertTo12Hour, toJson: convertTo24Hour) this.dhuhr, @JsonKey(name: "Asr", fromJson: convertTo12Hour, toJson: convertTo24Hour) this.asr, @JsonKey(name: "Sunset", fromJson: convertTo12Hour, toJson: convertTo24Hour) this.sunset, @JsonKey(name: "Maghrib", fromJson: convertTo12Hour, toJson: convertTo24Hour) this.maghrib, @JsonKey(name: "Isha", fromJson: convertTo12Hour, toJson: convertTo24Hour) this.isha, @JsonKey(name: "Imsak", fromJson: convertTo12Hour, toJson: convertTo24Hour) this.imsak, @JsonKey(name: "Midnight", fromJson: convertTo12Hour, toJson: convertTo24Hour) this.midnight, @JsonKey(name: "Firstthird", fromJson: convertTo12Hour, toJson: convertTo24Hour) this.firstthird, @JsonKey(name: "Lastthird", fromJson: convertTo12Hour, toJson: convertTo24Hour) this.lastthird});
  factory _Timings.fromJson(Map<String, dynamic> json) => _$TimingsFromJson(json);

@override@JsonKey(name: "Fajr", fromJson: convertTo12Hour, toJson: convertTo24Hour) final  TimeOfDay? fajr;
@override@JsonKey(name: "Sunrise", fromJson: convertTo12Hour, toJson: convertTo24Hour) final  TimeOfDay? sunrise;
@override@JsonKey(name: "Dhuhr", fromJson: convertTo12Hour, toJson: convertTo24Hour) final  TimeOfDay? dhuhr;
@override@JsonKey(name: "Asr", fromJson: convertTo12Hour, toJson: convertTo24Hour) final  TimeOfDay? asr;
@override@JsonKey(name: "Sunset", fromJson: convertTo12Hour, toJson: convertTo24Hour) final  TimeOfDay? sunset;
@override@JsonKey(name: "Maghrib", fromJson: convertTo12Hour, toJson: convertTo24Hour) final  TimeOfDay? maghrib;
@override@JsonKey(name: "Isha", fromJson: convertTo12Hour, toJson: convertTo24Hour) final  TimeOfDay? isha;
@override@JsonKey(name: "Imsak", fromJson: convertTo12Hour, toJson: convertTo24Hour) final  TimeOfDay? imsak;
@override@JsonKey(name: "Midnight", fromJson: convertTo12Hour, toJson: convertTo24Hour) final  TimeOfDay? midnight;
@override@JsonKey(name: "Firstthird", fromJson: convertTo12Hour, toJson: convertTo24Hour) final  TimeOfDay? firstthird;
@override@JsonKey(name: "Lastthird", fromJson: convertTo12Hour, toJson: convertTo24Hour) final  TimeOfDay? lastthird;

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
@JsonKey(name: "Fajr", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? fajr,@JsonKey(name: "Sunrise", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? sunrise,@JsonKey(name: "Dhuhr", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? dhuhr,@JsonKey(name: "Asr", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? asr,@JsonKey(name: "Sunset", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? sunset,@JsonKey(name: "Maghrib", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? maghrib,@JsonKey(name: "Isha", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? isha,@JsonKey(name: "Imsak", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? imsak,@JsonKey(name: "Midnight", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? midnight,@JsonKey(name: "Firstthird", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? firstthird,@JsonKey(name: "Lastthird", fromJson: convertTo12Hour, toJson: convertTo24Hour) TimeOfDay? lastthird
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
as TimeOfDay?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,dhuhr: freezed == dhuhr ? _self.dhuhr : dhuhr // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,asr: freezed == asr ? _self.asr : asr // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,maghrib: freezed == maghrib ? _self.maghrib : maghrib // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,isha: freezed == isha ? _self.isha : isha // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,imsak: freezed == imsak ? _self.imsak : imsak // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,midnight: freezed == midnight ? _self.midnight : midnight // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,firstthird: freezed == firstthird ? _self.firstthird : firstthird // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,lastthird: freezed == lastthird ? _self.lastthird : lastthird // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,
  ));
}


}

// dart format on
