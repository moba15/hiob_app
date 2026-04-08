// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_value_widget_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomValueWidgetTheme {

 String get id; set id(String value); LabelTheme get labelTheme; set labelTheme(LabelTheme value);@MaterialColorConverter() Color? get valueTextColor;@MaterialColorConverter() set valueTextColor(Color? value); double? get valueTextFonSize; set valueTextFonSize(double? value);@FontWeightConverter() FontWeight? get valueTextFontWeight;@FontWeightConverter() set valueTextFontWeight(FontWeight? value);
/// Create a copy of CustomValueWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomValueWidgetThemeCopyWith<CustomValueWidgetTheme> get copyWith => _$CustomValueWidgetThemeCopyWithImpl<CustomValueWidgetTheme>(this as CustomValueWidgetTheme, _$identity);

  /// Serializes this CustomValueWidgetTheme to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomValueWidgetTheme(id: $id, labelTheme: $labelTheme, valueTextColor: $valueTextColor, valueTextFonSize: $valueTextFonSize, valueTextFontWeight: $valueTextFontWeight)';
}


}

/// @nodoc
abstract mixin class $CustomValueWidgetThemeCopyWith<$Res>  {
  factory $CustomValueWidgetThemeCopyWith(CustomValueWidgetTheme value, $Res Function(CustomValueWidgetTheme) _then) = _$CustomValueWidgetThemeCopyWithImpl;
@useResult
$Res call({
 String id, LabelTheme labelTheme,@MaterialColorConverter() Color? valueTextColor, double? valueTextFonSize,@FontWeightConverter() FontWeight? valueTextFontWeight
});


$LabelThemeCopyWith<$Res> get labelTheme;

}
/// @nodoc
class _$CustomValueWidgetThemeCopyWithImpl<$Res>
    implements $CustomValueWidgetThemeCopyWith<$Res> {
  _$CustomValueWidgetThemeCopyWithImpl(this._self, this._then);

  final CustomValueWidgetTheme _self;
  final $Res Function(CustomValueWidgetTheme) _then;

/// Create a copy of CustomValueWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? labelTheme = null,Object? valueTextColor = freezed,Object? valueTextFonSize = freezed,Object? valueTextFontWeight = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,labelTheme: null == labelTheme ? _self.labelTheme : labelTheme // ignore: cast_nullable_to_non_nullable
as LabelTheme,valueTextColor: freezed == valueTextColor ? _self.valueTextColor : valueTextColor // ignore: cast_nullable_to_non_nullable
as Color?,valueTextFonSize: freezed == valueTextFonSize ? _self.valueTextFonSize : valueTextFonSize // ignore: cast_nullable_to_non_nullable
as double?,valueTextFontWeight: freezed == valueTextFontWeight ? _self.valueTextFontWeight : valueTextFontWeight // ignore: cast_nullable_to_non_nullable
as FontWeight?,
  ));
}
/// Create a copy of CustomValueWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LabelThemeCopyWith<$Res> get labelTheme {
  
  return $LabelThemeCopyWith<$Res>(_self.labelTheme, (value) {
    return _then(_self.copyWith(labelTheme: value));
  });
}
}


/// Adds pattern-matching-related methods to [CustomValueWidgetTheme].
extension CustomValueWidgetThemePatterns on CustomValueWidgetTheme {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomValueWidgetTheme value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomValueWidgetTheme() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomValueWidgetTheme value)  $default,){
final _that = this;
switch (_that) {
case _CustomValueWidgetTheme():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomValueWidgetTheme value)?  $default,){
final _that = this;
switch (_that) {
case _CustomValueWidgetTheme() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LabelTheme labelTheme, @MaterialColorConverter()  Color? valueTextColor,  double? valueTextFonSize, @FontWeightConverter()  FontWeight? valueTextFontWeight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomValueWidgetTheme() when $default != null:
return $default(_that.id,_that.labelTheme,_that.valueTextColor,_that.valueTextFonSize,_that.valueTextFontWeight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LabelTheme labelTheme, @MaterialColorConverter()  Color? valueTextColor,  double? valueTextFonSize, @FontWeightConverter()  FontWeight? valueTextFontWeight)  $default,) {final _that = this;
switch (_that) {
case _CustomValueWidgetTheme():
return $default(_that.id,_that.labelTheme,_that.valueTextColor,_that.valueTextFonSize,_that.valueTextFontWeight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LabelTheme labelTheme, @MaterialColorConverter()  Color? valueTextColor,  double? valueTextFonSize, @FontWeightConverter()  FontWeight? valueTextFontWeight)?  $default,) {final _that = this;
switch (_that) {
case _CustomValueWidgetTheme() when $default != null:
return $default(_that.id,_that.labelTheme,_that.valueTextColor,_that.valueTextFonSize,_that.valueTextFontWeight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomValueWidgetTheme extends CustomValueWidgetTheme implements CustomThemeForWidget {
   _CustomValueWidgetTheme(this.id, this.labelTheme, @MaterialColorConverter() this.valueTextColor, this.valueTextFonSize, @FontWeightConverter() this.valueTextFontWeight): super._();
  factory _CustomValueWidgetTheme.fromJson(Map<String, dynamic> json) => _$CustomValueWidgetThemeFromJson(json);

@override  String id;
@override  LabelTheme labelTheme;
@override@MaterialColorConverter()  Color? valueTextColor;
@override  double? valueTextFonSize;
@override@FontWeightConverter()  FontWeight? valueTextFontWeight;

/// Create a copy of CustomValueWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomValueWidgetThemeCopyWith<_CustomValueWidgetTheme> get copyWith => __$CustomValueWidgetThemeCopyWithImpl<_CustomValueWidgetTheme>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomValueWidgetThemeToJson(this, );
}



@override
String toString() {
  return 'CustomValueWidgetTheme(id: $id, labelTheme: $labelTheme, valueTextColor: $valueTextColor, valueTextFonSize: $valueTextFonSize, valueTextFontWeight: $valueTextFontWeight)';
}


}

/// @nodoc
abstract mixin class _$CustomValueWidgetThemeCopyWith<$Res> implements $CustomValueWidgetThemeCopyWith<$Res> {
  factory _$CustomValueWidgetThemeCopyWith(_CustomValueWidgetTheme value, $Res Function(_CustomValueWidgetTheme) _then) = __$CustomValueWidgetThemeCopyWithImpl;
@override @useResult
$Res call({
 String id, LabelTheme labelTheme,@MaterialColorConverter() Color? valueTextColor, double? valueTextFonSize,@FontWeightConverter() FontWeight? valueTextFontWeight
});


@override $LabelThemeCopyWith<$Res> get labelTheme;

}
/// @nodoc
class __$CustomValueWidgetThemeCopyWithImpl<$Res>
    implements _$CustomValueWidgetThemeCopyWith<$Res> {
  __$CustomValueWidgetThemeCopyWithImpl(this._self, this._then);

  final _CustomValueWidgetTheme _self;
  final $Res Function(_CustomValueWidgetTheme) _then;

/// Create a copy of CustomValueWidgetTheme
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? labelTheme = null,Object? valueTextColor = freezed,Object? valueTextFonSize = freezed,Object? valueTextFontWeight = freezed,}) {
  return _then(_CustomValueWidgetTheme(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,null == labelTheme ? _self.labelTheme : labelTheme // ignore: cast_nullable_to_non_nullable
as LabelTheme,freezed == valueTextColor ? _self.valueTextColor : valueTextColor // ignore: cast_nullable_to_non_nullable
as Color?,freezed == valueTextFonSize ? _self.valueTextFonSize : valueTextFonSize // ignore: cast_nullable_to_non_nullable
as double?,freezed == valueTextFontWeight ? _self.valueTextFontWeight : valueTextFontWeight // ignore: cast_nullable_to_non_nullable
as FontWeight?,
  ));
}

/// Create a copy of CustomValueWidgetTheme
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
