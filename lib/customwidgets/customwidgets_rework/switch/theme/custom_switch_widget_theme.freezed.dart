// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_switch_widget_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomSwitchWidgetTheme {

 String get id; set id(String value); LabelTheme get labelTheme; set labelTheme(LabelTheme value);
/// Create a copy of CustomSwitchWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomSwitchWidgetThemeCopyWith<CustomSwitchWidgetTheme> get copyWith => _$CustomSwitchWidgetThemeCopyWithImpl<CustomSwitchWidgetTheme>(this as CustomSwitchWidgetTheme, _$identity);

  /// Serializes this CustomSwitchWidgetTheme to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomSwitchWidgetTheme(id: $id, labelTheme: $labelTheme)';
}


}

/// @nodoc
abstract mixin class $CustomSwitchWidgetThemeCopyWith<$Res>  {
  factory $CustomSwitchWidgetThemeCopyWith(CustomSwitchWidgetTheme value, $Res Function(CustomSwitchWidgetTheme) _then) = _$CustomSwitchWidgetThemeCopyWithImpl;
@useResult
$Res call({
 String id, LabelTheme labelTheme
});


$LabelThemeCopyWith<$Res> get labelTheme;

}
/// @nodoc
class _$CustomSwitchWidgetThemeCopyWithImpl<$Res>
    implements $CustomSwitchWidgetThemeCopyWith<$Res> {
  _$CustomSwitchWidgetThemeCopyWithImpl(this._self, this._then);

  final CustomSwitchWidgetTheme _self;
  final $Res Function(CustomSwitchWidgetTheme) _then;

/// Create a copy of CustomSwitchWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? labelTheme = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,labelTheme: null == labelTheme ? _self.labelTheme : labelTheme // ignore: cast_nullable_to_non_nullable
as LabelTheme,
  ));
}
/// Create a copy of CustomSwitchWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelThemeCopyWith<$Res> get labelTheme {
  
  return $LabelThemeCopyWith<$Res>(_self.labelTheme, (value) {
    return _then(_self.copyWith(labelTheme: value));
  });
}
}


/// Adds pattern-matching-related methods to [CustomSwitchWidgetTheme].
extension CustomSwitchWidgetThemePatterns on CustomSwitchWidgetTheme {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomSwitchWidgetTheme value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomSwitchWidgetTheme() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomSwitchWidgetTheme value)  $default,){
final _that = this;
switch (_that) {
case _CustomSwitchWidgetTheme():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomSwitchWidgetTheme value)?  $default,){
final _that = this;
switch (_that) {
case _CustomSwitchWidgetTheme() when $default != null:
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
case _CustomSwitchWidgetTheme() when $default != null:
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
case _CustomSwitchWidgetTheme():
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
case _CustomSwitchWidgetTheme() when $default != null:
return $default(_that.id,_that.labelTheme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomSwitchWidgetTheme extends CustomSwitchWidgetTheme implements CustomThemeForWidget {
   _CustomSwitchWidgetTheme(this.id, this.labelTheme): super._();
  factory _CustomSwitchWidgetTheme.fromJson(Map<String, dynamic> json) => _$CustomSwitchWidgetThemeFromJson(json);

@override  String id;
@override  LabelTheme labelTheme;

/// Create a copy of CustomSwitchWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomSwitchWidgetThemeCopyWith<_CustomSwitchWidgetTheme> get copyWith => __$CustomSwitchWidgetThemeCopyWithImpl<_CustomSwitchWidgetTheme>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomSwitchWidgetThemeToJson(this, );
}



@override
String toString() {
  return 'CustomSwitchWidgetTheme(id: $id, labelTheme: $labelTheme)';
}


}

/// @nodoc
abstract mixin class _$CustomSwitchWidgetThemeCopyWith<$Res> implements $CustomSwitchWidgetThemeCopyWith<$Res> {
  factory _$CustomSwitchWidgetThemeCopyWith(_CustomSwitchWidgetTheme value, $Res Function(_CustomSwitchWidgetTheme) _then) = __$CustomSwitchWidgetThemeCopyWithImpl;
@override @useResult
$Res call({
 String id, LabelTheme labelTheme
});


@override $LabelThemeCopyWith<$Res> get labelTheme;

}
/// @nodoc
class __$CustomSwitchWidgetThemeCopyWithImpl<$Res>
    implements _$CustomSwitchWidgetThemeCopyWith<$Res> {
  __$CustomSwitchWidgetThemeCopyWithImpl(this._self, this._then);

  final _CustomSwitchWidgetTheme _self;
  final $Res Function(_CustomSwitchWidgetTheme) _then;

/// Create a copy of CustomSwitchWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? labelTheme = null,}) {
  return _then(_CustomSwitchWidgetTheme(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,null == labelTheme ? _self.labelTheme : labelTheme // ignore: cast_nullable_to_non_nullable
as LabelTheme,
  ));
}

/// Create a copy of CustomSwitchWidgetTheme
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
