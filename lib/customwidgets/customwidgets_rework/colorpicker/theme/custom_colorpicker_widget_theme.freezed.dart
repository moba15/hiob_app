// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_colorpicker_widget_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomColorpickerWidgetTheme {

 String get id; set id(String value); LabelTheme get labelTheme; set labelTheme(LabelTheme value);
/// Create a copy of CustomColorpickerWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomColorpickerWidgetThemeCopyWith<CustomColorpickerWidgetTheme> get copyWith => _$CustomColorpickerWidgetThemeCopyWithImpl<CustomColorpickerWidgetTheme>(this as CustomColorpickerWidgetTheme, _$identity);

  /// Serializes this CustomColorpickerWidgetTheme to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomColorpickerWidgetTheme(id: $id, labelTheme: $labelTheme)';
}


}

/// @nodoc
abstract mixin class $CustomColorpickerWidgetThemeCopyWith<$Res>  {
  factory $CustomColorpickerWidgetThemeCopyWith(CustomColorpickerWidgetTheme value, $Res Function(CustomColorpickerWidgetTheme) _then) = _$CustomColorpickerWidgetThemeCopyWithImpl;
@useResult
$Res call({
 String id, LabelTheme labelTheme
});


$LabelThemeCopyWith<$Res> get labelTheme;

}
/// @nodoc
class _$CustomColorpickerWidgetThemeCopyWithImpl<$Res>
    implements $CustomColorpickerWidgetThemeCopyWith<$Res> {
  _$CustomColorpickerWidgetThemeCopyWithImpl(this._self, this._then);

  final CustomColorpickerWidgetTheme _self;
  final $Res Function(CustomColorpickerWidgetTheme) _then;

/// Create a copy of CustomColorpickerWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? labelTheme = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,labelTheme: null == labelTheme ? _self.labelTheme : labelTheme // ignore: cast_nullable_to_non_nullable
as LabelTheme,
  ));
}
/// Create a copy of CustomColorpickerWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelThemeCopyWith<$Res> get labelTheme {
  
  return $LabelThemeCopyWith<$Res>(_self.labelTheme, (value) {
    return _then(_self.copyWith(labelTheme: value));
  });
}
}


/// Adds pattern-matching-related methods to [CustomColorpickerWidgetTheme].
extension CustomColorpickerWidgetThemePatterns on CustomColorpickerWidgetTheme {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomColorpickerWidgetTheme value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomColorpickerWidgetTheme() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomColorpickerWidgetTheme value)  $default,){
final _that = this;
switch (_that) {
case _CustomColorpickerWidgetTheme():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomColorpickerWidgetTheme value)?  $default,){
final _that = this;
switch (_that) {
case _CustomColorpickerWidgetTheme() when $default != null:
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
case _CustomColorpickerWidgetTheme() when $default != null:
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
case _CustomColorpickerWidgetTheme():
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
case _CustomColorpickerWidgetTheme() when $default != null:
return $default(_that.id,_that.labelTheme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomColorpickerWidgetTheme extends CustomColorpickerWidgetTheme implements CustomThemeForWidget {
   _CustomColorpickerWidgetTheme(this.id, this.labelTheme): super._();
  factory _CustomColorpickerWidgetTheme.fromJson(Map<String, dynamic> json) => _$CustomColorpickerWidgetThemeFromJson(json);

@override  String id;
@override  LabelTheme labelTheme;

/// Create a copy of CustomColorpickerWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomColorpickerWidgetThemeCopyWith<_CustomColorpickerWidgetTheme> get copyWith => __$CustomColorpickerWidgetThemeCopyWithImpl<_CustomColorpickerWidgetTheme>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomColorpickerWidgetThemeToJson(this, );
}



@override
String toString() {
  return 'CustomColorpickerWidgetTheme(id: $id, labelTheme: $labelTheme)';
}


}

/// @nodoc
abstract mixin class _$CustomColorpickerWidgetThemeCopyWith<$Res> implements $CustomColorpickerWidgetThemeCopyWith<$Res> {
  factory _$CustomColorpickerWidgetThemeCopyWith(_CustomColorpickerWidgetTheme value, $Res Function(_CustomColorpickerWidgetTheme) _then) = __$CustomColorpickerWidgetThemeCopyWithImpl;
@override @useResult
$Res call({
 String id, LabelTheme labelTheme
});


@override $LabelThemeCopyWith<$Res> get labelTheme;

}
/// @nodoc
class __$CustomColorpickerWidgetThemeCopyWithImpl<$Res>
    implements _$CustomColorpickerWidgetThemeCopyWith<$Res> {
  __$CustomColorpickerWidgetThemeCopyWithImpl(this._self, this._then);

  final _CustomColorpickerWidgetTheme _self;
  final $Res Function(_CustomColorpickerWidgetTheme) _then;

/// Create a copy of CustomColorpickerWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? labelTheme = null,}) {
  return _then(_CustomColorpickerWidgetTheme(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,null == labelTheme ? _self.labelTheme : labelTheme // ignore: cast_nullable_to_non_nullable
as LabelTheme,
  ));
}

/// Create a copy of CustomColorpickerWidgetTheme
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
