// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'widget_label_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LabelTheme {

 String get id; set id(String value);@MaterialColorConverter() Color? get labelColor;@MaterialColorConverter() set labelColor(Color? value); double? get labelFonSize; set labelFonSize(double? value);@FontWeightConverter() FontWeight? get labelFontWeight;@FontWeightConverter() set labelFontWeight(FontWeight? value); FontStyle? get labelFontStyle; set labelFontStyle(FontStyle? value);
/// Create a copy of LabelTheme
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabelThemeCopyWith<LabelTheme> get copyWith => _$LabelThemeCopyWithImpl<LabelTheme>(this as LabelTheme, _$identity);

  /// Serializes this LabelTheme to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'LabelTheme(id: $id, labelColor: $labelColor, labelFonSize: $labelFonSize, labelFontWeight: $labelFontWeight, labelFontStyle: $labelFontStyle)';
}


}

/// @nodoc
abstract mixin class $LabelThemeCopyWith<$Res>  {
  factory $LabelThemeCopyWith(LabelTheme value, $Res Function(LabelTheme) _then) = _$LabelThemeCopyWithImpl;
@useResult
$Res call({
 String id,@MaterialColorConverter() Color? labelColor, double? labelFonSize,@FontWeightConverter() FontWeight? labelFontWeight, FontStyle? labelFontStyle
});




}
/// @nodoc
class _$LabelThemeCopyWithImpl<$Res>
    implements $LabelThemeCopyWith<$Res> {
  _$LabelThemeCopyWithImpl(this._self, this._then);

  final LabelTheme _self;
  final $Res Function(LabelTheme) _then;

/// Create a copy of LabelTheme
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? labelColor = freezed,Object? labelFonSize = freezed,Object? labelFontWeight = freezed,Object? labelFontStyle = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,labelColor: freezed == labelColor ? _self.labelColor : labelColor // ignore: cast_nullable_to_non_nullable
as Color?,labelFonSize: freezed == labelFonSize ? _self.labelFonSize : labelFonSize // ignore: cast_nullable_to_non_nullable
as double?,labelFontWeight: freezed == labelFontWeight ? _self.labelFontWeight : labelFontWeight // ignore: cast_nullable_to_non_nullable
as FontWeight?,labelFontStyle: freezed == labelFontStyle ? _self.labelFontStyle : labelFontStyle // ignore: cast_nullable_to_non_nullable
as FontStyle?,
  ));
}

}


/// Adds pattern-matching-related methods to [LabelTheme].
extension LabelThemePatterns on LabelTheme {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabelTheme value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabelTheme() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabelTheme value)  $default,){
final _that = this;
switch (_that) {
case _LabelTheme():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabelTheme value)?  $default,){
final _that = this;
switch (_that) {
case _LabelTheme() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @MaterialColorConverter()  Color? labelColor,  double? labelFonSize, @FontWeightConverter()  FontWeight? labelFontWeight,  FontStyle? labelFontStyle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabelTheme() when $default != null:
return $default(_that.id,_that.labelColor,_that.labelFonSize,_that.labelFontWeight,_that.labelFontStyle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @MaterialColorConverter()  Color? labelColor,  double? labelFonSize, @FontWeightConverter()  FontWeight? labelFontWeight,  FontStyle? labelFontStyle)  $default,) {final _that = this;
switch (_that) {
case _LabelTheme():
return $default(_that.id,_that.labelColor,_that.labelFonSize,_that.labelFontWeight,_that.labelFontStyle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @MaterialColorConverter()  Color? labelColor,  double? labelFonSize, @FontWeightConverter()  FontWeight? labelFontWeight,  FontStyle? labelFontStyle)?  $default,) {final _that = this;
switch (_that) {
case _LabelTheme() when $default != null:
return $default(_that.id,_that.labelColor,_that.labelFonSize,_that.labelFontWeight,_that.labelFontStyle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LabelTheme extends LabelTheme implements CustomThemeForWidget {
   _LabelTheme(this.id, @MaterialColorConverter() this.labelColor, this.labelFonSize, @FontWeightConverter() this.labelFontWeight, this.labelFontStyle): super._();
  factory _LabelTheme.fromJson(Map<String, dynamic> json) => _$LabelThemeFromJson(json);

@override  String id;
@override@MaterialColorConverter()  Color? labelColor;
@override  double? labelFonSize;
@override@FontWeightConverter()  FontWeight? labelFontWeight;
@override  FontStyle? labelFontStyle;

/// Create a copy of LabelTheme
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabelThemeCopyWith<_LabelTheme> get copyWith => __$LabelThemeCopyWithImpl<_LabelTheme>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabelThemeToJson(this, );
}



@override
String toString() {
  return 'LabelTheme(id: $id, labelColor: $labelColor, labelFonSize: $labelFonSize, labelFontWeight: $labelFontWeight, labelFontStyle: $labelFontStyle)';
}


}

/// @nodoc
abstract mixin class _$LabelThemeCopyWith<$Res> implements $LabelThemeCopyWith<$Res> {
  factory _$LabelThemeCopyWith(_LabelTheme value, $Res Function(_LabelTheme) _then) = __$LabelThemeCopyWithImpl;
@override @useResult
$Res call({
 String id,@MaterialColorConverter() Color? labelColor, double? labelFonSize,@FontWeightConverter() FontWeight? labelFontWeight, FontStyle? labelFontStyle
});




}
/// @nodoc
class __$LabelThemeCopyWithImpl<$Res>
    implements _$LabelThemeCopyWith<$Res> {
  __$LabelThemeCopyWithImpl(this._self, this._then);

  final _LabelTheme _self;
  final $Res Function(_LabelTheme) _then;

/// Create a copy of LabelTheme
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? labelColor = freezed,Object? labelFonSize = freezed,Object? labelFontWeight = freezed,Object? labelFontStyle = freezed,}) {
  return _then(_LabelTheme(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,freezed == labelColor ? _self.labelColor : labelColor // ignore: cast_nullable_to_non_nullable
as Color?,freezed == labelFonSize ? _self.labelFonSize : labelFonSize // ignore: cast_nullable_to_non_nullable
as double?,freezed == labelFontWeight ? _self.labelFontWeight : labelFontWeight // ignore: cast_nullable_to_non_nullable
as FontWeight?,freezed == labelFontStyle ? _self.labelFontStyle : labelFontStyle // ignore: cast_nullable_to_non_nullable
as FontStyle?,
  ));
}


}

// dart format on
