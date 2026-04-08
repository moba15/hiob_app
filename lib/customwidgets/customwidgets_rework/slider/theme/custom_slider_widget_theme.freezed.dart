// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_slider_widget_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomSliderWidgetTheme {

 String get id; set id(String value); LabelTheme get labelTheme; set labelTheme(LabelTheme value);
/// Create a copy of CustomSliderWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomSliderWidgetThemeCopyWith<CustomSliderWidgetTheme> get copyWith => _$CustomSliderWidgetThemeCopyWithImpl<CustomSliderWidgetTheme>(this as CustomSliderWidgetTheme, _$identity);

  /// Serializes this CustomSliderWidgetTheme to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomSliderWidgetTheme(id: $id, labelTheme: $labelTheme)';
}


}

/// @nodoc
abstract mixin class $CustomSliderWidgetThemeCopyWith<$Res>  {
  factory $CustomSliderWidgetThemeCopyWith(CustomSliderWidgetTheme value, $Res Function(CustomSliderWidgetTheme) _then) = _$CustomSliderWidgetThemeCopyWithImpl;
@useResult
$Res call({
 String id, LabelTheme labelTheme
});


$LabelThemeCopyWith<$Res> get labelTheme;

}
/// @nodoc
class _$CustomSliderWidgetThemeCopyWithImpl<$Res>
    implements $CustomSliderWidgetThemeCopyWith<$Res> {
  _$CustomSliderWidgetThemeCopyWithImpl(this._self, this._then);

  final CustomSliderWidgetTheme _self;
  final $Res Function(CustomSliderWidgetTheme) _then;

/// Create a copy of CustomSliderWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? labelTheme = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,labelTheme: null == labelTheme ? _self.labelTheme : labelTheme // ignore: cast_nullable_to_non_nullable
as LabelTheme,
  ));
}
/// Create a copy of CustomSliderWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelThemeCopyWith<$Res> get labelTheme {
  
  return $LabelThemeCopyWith<$Res>(_self.labelTheme, (value) {
    return _then(_self.copyWith(labelTheme: value));
  });
}
}


/// Adds pattern-matching-related methods to [CustomSliderWidgetTheme].
extension CustomSliderWidgetThemePatterns on CustomSliderWidgetTheme {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomSliderWidgetTheme value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomSliderWidgetTheme() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomSliderWidgetTheme value)  $default,){
final _that = this;
switch (_that) {
case _CustomSliderWidgetTheme():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomSliderWidgetTheme value)?  $default,){
final _that = this;
switch (_that) {
case _CustomSliderWidgetTheme() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LabelTheme labelTheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomSliderWidgetTheme() when $default != null:
return $default(_that.id,_that.labelTheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LabelTheme labelTheme)  $default,) {final _that = this;
switch (_that) {
case _CustomSliderWidgetTheme():
return $default(_that.id,_that.labelTheme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LabelTheme labelTheme)?  $default,) {final _that = this;
switch (_that) {
case _CustomSliderWidgetTheme() when $default != null:
return $default(_that.id,_that.labelTheme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomSliderWidgetTheme extends CustomSliderWidgetTheme implements CustomThemeForWidget {
   _CustomSliderWidgetTheme(this.id, this.labelTheme): super._();
  factory _CustomSliderWidgetTheme.fromJson(Map<String, dynamic> json) => _$CustomSliderWidgetThemeFromJson(json);

@override  String id;
@override  LabelTheme labelTheme;

/// Create a copy of CustomSliderWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomSliderWidgetThemeCopyWith<_CustomSliderWidgetTheme> get copyWith => __$CustomSliderWidgetThemeCopyWithImpl<_CustomSliderWidgetTheme>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomSliderWidgetThemeToJson(this, );
}



@override
String toString() {
  return 'CustomSliderWidgetTheme(id: $id, labelTheme: $labelTheme)';
}


}

/// @nodoc
abstract mixin class _$CustomSliderWidgetThemeCopyWith<$Res> implements $CustomSliderWidgetThemeCopyWith<$Res> {
  factory _$CustomSliderWidgetThemeCopyWith(_CustomSliderWidgetTheme value, $Res Function(_CustomSliderWidgetTheme) _then) = __$CustomSliderWidgetThemeCopyWithImpl;
@override @useResult
$Res call({
 String id, LabelTheme labelTheme
});


@override $LabelThemeCopyWith<$Res> get labelTheme;

}
/// @nodoc
class __$CustomSliderWidgetThemeCopyWithImpl<$Res>
    implements _$CustomSliderWidgetThemeCopyWith<$Res> {
  __$CustomSliderWidgetThemeCopyWithImpl(this._self, this._then);

  final _CustomSliderWidgetTheme _self;
  final $Res Function(_CustomSliderWidgetTheme) _then;

/// Create a copy of CustomSliderWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? labelTheme = null,}) {
  return _then(_CustomSliderWidgetTheme(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,null == labelTheme ? _self.labelTheme : labelTheme // ignore: cast_nullable_to_non_nullable
as LabelTheme,
  ));
}

/// Create a copy of CustomSliderWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelThemeCopyWith<$Res> get labelTheme {
  
  return $LabelThemeCopyWith<$Res>(_self.labelTheme, (value) {
    return _then(_self.copyWith(labelTheme: value));
  });
}
}

// dart format on
