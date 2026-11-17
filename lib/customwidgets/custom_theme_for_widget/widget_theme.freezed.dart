// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'widget_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WidgetTheme {

 String get id; set id(String value); LabelTheme? get labelTheme; set labelTheme(LabelTheme? value); LabelTheme? get valueTheme; set valueTheme(LabelTheme? value);@DividerThemeDataConverter() DividerThemeData? get dividerTheme;@DividerThemeDataConverter() set dividerTheme(DividerThemeData? value); Map<String, dynamic>? get extras; set extras(Map<String, dynamic>? value);
/// Create a copy of WidgetTheme
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WidgetThemeCopyWith<WidgetTheme> get copyWith => _$WidgetThemeCopyWithImpl<WidgetTheme>(this as WidgetTheme, _$identity);

  /// Serializes this WidgetTheme to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'WidgetTheme(id: $id, labelTheme: $labelTheme, valueTheme: $valueTheme, dividerTheme: $dividerTheme, extras: $extras)';
}


}

/// @nodoc
abstract mixin class $WidgetThemeCopyWith<$Res>  {
  factory $WidgetThemeCopyWith(WidgetTheme value, $Res Function(WidgetTheme) _then) = _$WidgetThemeCopyWithImpl;
@useResult
$Res call({
 String id, LabelTheme? labelTheme, LabelTheme? valueTheme,@DividerThemeDataConverter() DividerThemeData? dividerTheme, Map<String, dynamic>? extras
});


$LabelThemeCopyWith<$Res>? get labelTheme;$LabelThemeCopyWith<$Res>? get valueTheme;

}
/// @nodoc
class _$WidgetThemeCopyWithImpl<$Res>
    implements $WidgetThemeCopyWith<$Res> {
  _$WidgetThemeCopyWithImpl(this._self, this._then);

  final WidgetTheme _self;
  final $Res Function(WidgetTheme) _then;

/// Create a copy of WidgetTheme
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? labelTheme = freezed,Object? valueTheme = freezed,Object? dividerTheme = freezed,Object? extras = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,labelTheme: freezed == labelTheme ? _self.labelTheme : labelTheme // ignore: cast_nullable_to_non_nullable
as LabelTheme?,valueTheme: freezed == valueTheme ? _self.valueTheme : valueTheme // ignore: cast_nullable_to_non_nullable
as LabelTheme?,dividerTheme: freezed == dividerTheme ? _self.dividerTheme : dividerTheme // ignore: cast_nullable_to_non_nullable
as DividerThemeData?,extras: freezed == extras ? _self.extras : extras // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of WidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelThemeCopyWith<$Res>? get labelTheme {
    if (_self.labelTheme == null) {
    return null;
  }

  return $LabelThemeCopyWith<$Res>(_self.labelTheme!, (value) {
    return _then(_self.copyWith(labelTheme: value));
  });
}/// Create a copy of WidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelThemeCopyWith<$Res>? get valueTheme {
    if (_self.valueTheme == null) {
    return null;
  }

  return $LabelThemeCopyWith<$Res>(_self.valueTheme!, (value) {
    return _then(_self.copyWith(valueTheme: value));
  });
}
}


/// Adds pattern-matching-related methods to [WidgetTheme].
extension WidgetThemePatterns on WidgetTheme {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WidgetTheme value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WidgetTheme() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WidgetTheme value)  $default,){
final _that = this;
switch (_that) {
case _WidgetTheme():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WidgetTheme value)?  $default,){
final _that = this;
switch (_that) {
case _WidgetTheme() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LabelTheme? labelTheme,  LabelTheme? valueTheme, @DividerThemeDataConverter()  DividerThemeData? dividerTheme,  Map<String, dynamic>? extras)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WidgetTheme() when $default != null:
return $default(_that.id,_that.labelTheme,_that.valueTheme,_that.dividerTheme,_that.extras);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LabelTheme? labelTheme,  LabelTheme? valueTheme, @DividerThemeDataConverter()  DividerThemeData? dividerTheme,  Map<String, dynamic>? extras)  $default,) {final _that = this;
switch (_that) {
case _WidgetTheme():
return $default(_that.id,_that.labelTheme,_that.valueTheme,_that.dividerTheme,_that.extras);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LabelTheme? labelTheme,  LabelTheme? valueTheme, @DividerThemeDataConverter()  DividerThemeData? dividerTheme,  Map<String, dynamic>? extras)?  $default,) {final _that = this;
switch (_that) {
case _WidgetTheme() when $default != null:
return $default(_that.id,_that.labelTheme,_that.valueTheme,_that.dividerTheme,_that.extras);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WidgetTheme extends WidgetTheme {
   _WidgetTheme({required this.id, this.labelTheme, this.valueTheme, @DividerThemeDataConverter() this.dividerTheme, this.extras}): super._();
  factory _WidgetTheme.fromJson(Map<String, dynamic> json) => _$WidgetThemeFromJson(json);

@override  String id;
@override  LabelTheme? labelTheme;
@override  LabelTheme? valueTheme;
@override@DividerThemeDataConverter()  DividerThemeData? dividerTheme;
@override  Map<String, dynamic>? extras;

/// Create a copy of WidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WidgetThemeCopyWith<_WidgetTheme> get copyWith => __$WidgetThemeCopyWithImpl<_WidgetTheme>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WidgetThemeToJson(this, );
}



@override
String toString() {
  return 'WidgetTheme(id: $id, labelTheme: $labelTheme, valueTheme: $valueTheme, dividerTheme: $dividerTheme, extras: $extras)';
}


}

/// @nodoc
abstract mixin class _$WidgetThemeCopyWith<$Res> implements $WidgetThemeCopyWith<$Res> {
  factory _$WidgetThemeCopyWith(_WidgetTheme value, $Res Function(_WidgetTheme) _then) = __$WidgetThemeCopyWithImpl;
@override @useResult
$Res call({
 String id, LabelTheme? labelTheme, LabelTheme? valueTheme,@DividerThemeDataConverter() DividerThemeData? dividerTheme, Map<String, dynamic>? extras
});


@override $LabelThemeCopyWith<$Res>? get labelTheme;@override $LabelThemeCopyWith<$Res>? get valueTheme;

}
/// @nodoc
class __$WidgetThemeCopyWithImpl<$Res>
    implements _$WidgetThemeCopyWith<$Res> {
  __$WidgetThemeCopyWithImpl(this._self, this._then);

  final _WidgetTheme _self;
  final $Res Function(_WidgetTheme) _then;

/// Create a copy of WidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? labelTheme = freezed,Object? valueTheme = freezed,Object? dividerTheme = freezed,Object? extras = freezed,}) {
  return _then(_WidgetTheme(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,labelTheme: freezed == labelTheme ? _self.labelTheme : labelTheme // ignore: cast_nullable_to_non_nullable
as LabelTheme?,valueTheme: freezed == valueTheme ? _self.valueTheme : valueTheme // ignore: cast_nullable_to_non_nullable
as LabelTheme?,dividerTheme: freezed == dividerTheme ? _self.dividerTheme : dividerTheme // ignore: cast_nullable_to_non_nullable
as DividerThemeData?,extras: freezed == extras ? _self.extras : extras // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of WidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelThemeCopyWith<$Res>? get labelTheme {
    if (_self.labelTheme == null) {
    return null;
  }

  return $LabelThemeCopyWith<$Res>(_self.labelTheme!, (value) {
    return _then(_self.copyWith(labelTheme: value));
  });
}/// Create a copy of WidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelThemeCopyWith<$Res>? get valueTheme {
    if (_self.valueTheme == null) {
    return null;
  }

  return $LabelThemeCopyWith<$Res>(_self.valueTheme!, (value) {
    return _then(_self.copyWith(valueTheme: value));
  });
}
}

// dart format on
