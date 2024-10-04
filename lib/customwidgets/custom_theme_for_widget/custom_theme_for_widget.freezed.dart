// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_theme_for_widget.dart';

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
/**
     * Common Label
     */
  @MaterialColorConverter()
  Color? get labelColor => throw _privateConstructorUsedError;
  double? get labelFonSize => throw _privateConstructorUsedError;
  @FontWeightConverter()
  FontWeight? get labelFontWeight => throw _privateConstructorUsedError;

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
      {@MaterialColorConverter() Color? labelColor,
      double? labelFonSize,
      @FontWeightConverter() FontWeight? labelFontWeight});
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
    Object? labelColor = freezed,
    Object? labelFonSize = freezed,
    Object? labelFontWeight = freezed,
  }) {
    return _then(_value.copyWith(
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
      {@MaterialColorConverter() Color? labelColor,
      double? labelFonSize,
      @FontWeightConverter() FontWeight? labelFontWeight});
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
    Object? labelColor = freezed,
    Object? labelFonSize = freezed,
    Object? labelFontWeight = freezed,
  }) {
    return _then(_$LabelThemeImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LabelThemeImpl implements _LabelTheme {
  _$LabelThemeImpl(@MaterialColorConverter() this.labelColor, this.labelFonSize,
      @FontWeightConverter() this.labelFontWeight);

  factory _$LabelThemeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LabelThemeImplFromJson(json);

/**
     * Common Label
     */
  @override
  @MaterialColorConverter()
  final Color? labelColor;
  @override
  final double? labelFonSize;
  @override
  @FontWeightConverter()
  final FontWeight? labelFontWeight;

  @override
  String toString() {
    return 'LabelTheme(labelColor: $labelColor, labelFonSize: $labelFonSize, labelFontWeight: $labelFontWeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LabelThemeImpl &&
            (identical(other.labelColor, labelColor) ||
                other.labelColor == labelColor) &&
            (identical(other.labelFonSize, labelFonSize) ||
                other.labelFonSize == labelFonSize) &&
            (identical(other.labelFontWeight, labelFontWeight) ||
                other.labelFontWeight == labelFontWeight));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, labelColor, labelFonSize, labelFontWeight);

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

abstract class _LabelTheme implements LabelTheme {
  factory _LabelTheme(
          @MaterialColorConverter() final Color? labelColor,
          final double? labelFonSize,
          @FontWeightConverter() final FontWeight? labelFontWeight) =
      _$LabelThemeImpl;

  factory _LabelTheme.fromJson(Map<String, dynamic> json) =
      _$LabelThemeImpl.fromJson;

/**
     * Common Label
     */
  @override
  @MaterialColorConverter()
  Color? get labelColor;
  @override
  double? get labelFonSize;
  @override
  @FontWeightConverter()
  FontWeight? get labelFontWeight;

  /// Create a copy of LabelTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LabelThemeImplCopyWith<_$LabelThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomThemeForWidget _$CustomThemeForWidgetFromJson(Map<String, dynamic> json) {
  return _CustomThemeForWidget.fromJson(json);
}

/// @nodoc
mixin _$CustomThemeForWidget {
/**
     * Background
     */
  @MaterialColorConverter()
  Color? get backgroundColor => throw _privateConstructorUsedError;
  /**
     * Common label
     */
  LabelTheme get labelTheme => throw _privateConstructorUsedError;

  /// Serializes this CustomThemeForWidget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomThemeForWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomThemeForWidgetCopyWith<CustomThemeForWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomThemeForWidgetCopyWith<$Res> {
  factory $CustomThemeForWidgetCopyWith(CustomThemeForWidget value,
          $Res Function(CustomThemeForWidget) then) =
      _$CustomThemeForWidgetCopyWithImpl<$Res, CustomThemeForWidget>;
  @useResult
  $Res call(
      {@MaterialColorConverter() Color? backgroundColor,
      LabelTheme labelTheme});

  $LabelThemeCopyWith<$Res> get labelTheme;
}

/// @nodoc
class _$CustomThemeForWidgetCopyWithImpl<$Res,
        $Val extends CustomThemeForWidget>
    implements $CustomThemeForWidgetCopyWith<$Res> {
  _$CustomThemeForWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomThemeForWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? labelTheme = null,
  }) {
    return _then(_value.copyWith(
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      labelTheme: null == labelTheme
          ? _value.labelTheme
          : labelTheme // ignore: cast_nullable_to_non_nullable
              as LabelTheme,
    ) as $Val);
  }

  /// Create a copy of CustomThemeForWidget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LabelThemeCopyWith<$Res> get labelTheme {
    return $LabelThemeCopyWith<$Res>(_value.labelTheme, (value) {
      return _then(_value.copyWith(labelTheme: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomThemeForWidgetImplCopyWith<$Res>
    implements $CustomThemeForWidgetCopyWith<$Res> {
  factory _$$CustomThemeForWidgetImplCopyWith(_$CustomThemeForWidgetImpl value,
          $Res Function(_$CustomThemeForWidgetImpl) then) =
      __$$CustomThemeForWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@MaterialColorConverter() Color? backgroundColor,
      LabelTheme labelTheme});

  @override
  $LabelThemeCopyWith<$Res> get labelTheme;
}

/// @nodoc
class __$$CustomThemeForWidgetImplCopyWithImpl<$Res>
    extends _$CustomThemeForWidgetCopyWithImpl<$Res, _$CustomThemeForWidgetImpl>
    implements _$$CustomThemeForWidgetImplCopyWith<$Res> {
  __$$CustomThemeForWidgetImplCopyWithImpl(_$CustomThemeForWidgetImpl _value,
      $Res Function(_$CustomThemeForWidgetImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomThemeForWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? labelTheme = null,
  }) {
    return _then(_$CustomThemeForWidgetImpl(
      freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      null == labelTheme
          ? _value.labelTheme
          : labelTheme // ignore: cast_nullable_to_non_nullable
              as LabelTheme,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomThemeForWidgetImpl implements _CustomThemeForWidget {
  _$CustomThemeForWidgetImpl(
      @MaterialColorConverter() this.backgroundColor, this.labelTheme);

  factory _$CustomThemeForWidgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomThemeForWidgetImplFromJson(json);

/**
     * Background
     */
  @override
  @MaterialColorConverter()
  final Color? backgroundColor;
/**
     * Common label
     */
  @override
  final LabelTheme labelTheme;

  @override
  String toString() {
    return 'CustomThemeForWidget(backgroundColor: $backgroundColor, labelTheme: $labelTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomThemeForWidgetImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.labelTheme, labelTheme) ||
                other.labelTheme == labelTheme));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, backgroundColor, labelTheme);

  /// Create a copy of CustomThemeForWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomThemeForWidgetImplCopyWith<_$CustomThemeForWidgetImpl>
      get copyWith =>
          __$$CustomThemeForWidgetImplCopyWithImpl<_$CustomThemeForWidgetImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomThemeForWidgetImplToJson(
      this,
    );
  }
}

abstract class _CustomThemeForWidget implements CustomThemeForWidget {
  factory _CustomThemeForWidget(
      @MaterialColorConverter() final Color? backgroundColor,
      final LabelTheme labelTheme) = _$CustomThemeForWidgetImpl;

  factory _CustomThemeForWidget.fromJson(Map<String, dynamic> json) =
      _$CustomThemeForWidgetImpl.fromJson;

/**
     * Background
     */
  @override
  @MaterialColorConverter()
  Color? get backgroundColor;
  /**
     * Common label
     */
  @override
  LabelTheme get labelTheme;

  /// Create a copy of CustomThemeForWidget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomThemeForWidgetImplCopyWith<_$CustomThemeForWidgetImpl>
      get copyWith => throw _privateConstructorUsedError;
}
