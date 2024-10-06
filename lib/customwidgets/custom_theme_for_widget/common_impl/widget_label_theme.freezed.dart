// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'widget_label_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LabelTheme _$LabelThemeFromJson(Map<String, dynamic> json) {
  return _LabelTheme.fromJson(json);
}

/// @nodoc
mixin _$LabelTheme {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  @MaterialColorConverter()
  Color? get labelColor => throw _privateConstructorUsedError;
  @MaterialColorConverter()
  set labelColor(Color? value) => throw _privateConstructorUsedError;
  double? get labelFonSize => throw _privateConstructorUsedError;
  set labelFonSize(double? value) => throw _privateConstructorUsedError;
  @FontWeightConverter()
  FontWeight? get labelFontWeight => throw _privateConstructorUsedError;
  @FontWeightConverter()
  set labelFontWeight(FontWeight? value) => throw _privateConstructorUsedError;
  FontStyle get labelFontStyle => throw _privateConstructorUsedError;
  set labelFontStyle(FontStyle value) => throw _privateConstructorUsedError;

  /// Serializes this LabelTheme to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LabelTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LabelThemeCopyWith<LabelTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabelThemeCopyWith<$Res> {
  factory $LabelThemeCopyWith(
          LabelTheme value, $Res Function(LabelTheme) then) =
      _$LabelThemeCopyWithImpl<$Res, LabelTheme>;
  @useResult
  $Res call(
      {String id,
      @MaterialColorConverter() Color? labelColor,
      double? labelFonSize,
      @FontWeightConverter() FontWeight? labelFontWeight,
      FontStyle labelFontStyle});
}

/// @nodoc
class _$LabelThemeCopyWithImpl<$Res, $Val extends LabelTheme>
    implements $LabelThemeCopyWith<$Res> {
  _$LabelThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LabelTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labelColor = freezed,
    Object? labelFonSize = freezed,
    Object? labelFontWeight = freezed,
    Object? labelFontStyle = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      labelColor: freezed == labelColor
          ? _value.labelColor
          : labelColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      labelFonSize: freezed == labelFonSize
          ? _value.labelFonSize
          : labelFonSize // ignore: cast_nullable_to_non_nullable
              as double?,
      labelFontWeight: freezed == labelFontWeight
          ? _value.labelFontWeight
          : labelFontWeight // ignore: cast_nullable_to_non_nullable
              as FontWeight?,
      labelFontStyle: null == labelFontStyle
          ? _value.labelFontStyle
          : labelFontStyle // ignore: cast_nullable_to_non_nullable
              as FontStyle,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LabelThemeImplCopyWith<$Res>
    implements $LabelThemeCopyWith<$Res> {
  factory _$$LabelThemeImplCopyWith(
          _$LabelThemeImpl value, $Res Function(_$LabelThemeImpl) then) =
      __$$LabelThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @MaterialColorConverter() Color? labelColor,
      double? labelFonSize,
      @FontWeightConverter() FontWeight? labelFontWeight,
      FontStyle labelFontStyle});
}

/// @nodoc
class __$$LabelThemeImplCopyWithImpl<$Res>
    extends _$LabelThemeCopyWithImpl<$Res, _$LabelThemeImpl>
    implements _$$LabelThemeImplCopyWith<$Res> {
  __$$LabelThemeImplCopyWithImpl(
      _$LabelThemeImpl _value, $Res Function(_$LabelThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of LabelTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labelColor = freezed,
    Object? labelFonSize = freezed,
    Object? labelFontWeight = freezed,
    Object? labelFontStyle = null,
  }) {
    return _then(_$LabelThemeImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == labelColor
          ? _value.labelColor
          : labelColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      freezed == labelFonSize
          ? _value.labelFonSize
          : labelFonSize // ignore: cast_nullable_to_non_nullable
              as double?,
      freezed == labelFontWeight
          ? _value.labelFontWeight
          : labelFontWeight // ignore: cast_nullable_to_non_nullable
              as FontWeight?,
      null == labelFontStyle
          ? _value.labelFontStyle
          : labelFontStyle // ignore: cast_nullable_to_non_nullable
              as FontStyle,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LabelThemeImpl extends _LabelTheme {
  _$LabelThemeImpl(
      this.id,
      @MaterialColorConverter() this.labelColor,
      this.labelFonSize,
      @FontWeightConverter() this.labelFontWeight,
      this.labelFontStyle)
      : super._();

  factory _$LabelThemeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LabelThemeImplFromJson(json);

  @override
  String id;
  @override
  @MaterialColorConverter()
  Color? labelColor;
  @override
  double? labelFonSize;
  @override
  @FontWeightConverter()
  FontWeight? labelFontWeight;
  @override
  FontStyle labelFontStyle;

  @override
  String toString() {
    return 'LabelTheme(id: $id, labelColor: $labelColor, labelFonSize: $labelFonSize, labelFontWeight: $labelFontWeight, labelFontStyle: $labelFontStyle)';
  }

  /// Create a copy of LabelTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LabelThemeImplCopyWith<_$LabelThemeImpl> get copyWith =>
      __$$LabelThemeImplCopyWithImpl<_$LabelThemeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LabelThemeImplToJson(
      this,
    );
  }
}

abstract class _LabelTheme extends LabelTheme implements CustomThemeForWidget {
  factory _LabelTheme(
      String id,
      @MaterialColorConverter() Color? labelColor,
      double? labelFonSize,
      @FontWeightConverter() FontWeight? labelFontWeight,
      FontStyle labelFontStyle) = _$LabelThemeImpl;
  _LabelTheme._() : super._();

  factory _LabelTheme.fromJson(Map<String, dynamic> json) =
      _$LabelThemeImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  @MaterialColorConverter()
  Color? get labelColor;
  @MaterialColorConverter()
  set labelColor(Color? value);
  @override
  double? get labelFonSize;
  set labelFonSize(double? value);
  @override
  @FontWeightConverter()
  FontWeight? get labelFontWeight;
  @FontWeightConverter()
  set labelFontWeight(FontWeight? value);
  @override
  FontStyle get labelFontStyle;
  set labelFontStyle(FontStyle value);

  /// Create a copy of LabelTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LabelThemeImplCopyWith<_$LabelThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
