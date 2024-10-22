// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_slider_widget_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomSliderWidgetTheme _$CustomSliderWidgetThemeFromJson(
    Map<String, dynamic> json) {
  return _CustomSliderWidgetTheme.fromJson(json);
}

/// @nodoc
mixin _$CustomSliderWidgetTheme {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  LabelTheme get labelTheme => throw _privateConstructorUsedError;
  set labelTheme(LabelTheme value) => throw _privateConstructorUsedError;

  /// Serializes this CustomSliderWidgetTheme to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomSliderWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomSliderWidgetThemeCopyWith<CustomSliderWidgetTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomSliderWidgetThemeCopyWith<$Res> {
  factory $CustomSliderWidgetThemeCopyWith(CustomSliderWidgetTheme value,
          $Res Function(CustomSliderWidgetTheme) then) =
      _$CustomSliderWidgetThemeCopyWithImpl<$Res, CustomSliderWidgetTheme>;
  @useResult
  $Res call({String id, LabelTheme labelTheme});

  $LabelThemeCopyWith<$Res> get labelTheme;
}

/// @nodoc
class _$CustomSliderWidgetThemeCopyWithImpl<$Res,
        $Val extends CustomSliderWidgetTheme>
    implements $CustomSliderWidgetThemeCopyWith<$Res> {
  _$CustomSliderWidgetThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomSliderWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labelTheme = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      labelTheme: null == labelTheme
          ? _value.labelTheme
          : labelTheme // ignore: cast_nullable_to_non_nullable
              as LabelTheme,
    ) as $Val);
  }

  /// Create a copy of CustomSliderWidgetTheme
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
abstract class _$$CustomSliderWidgetThemeImplCopyWith<$Res>
    implements $CustomSliderWidgetThemeCopyWith<$Res> {
  factory _$$CustomSliderWidgetThemeImplCopyWith(
          _$CustomSliderWidgetThemeImpl value,
          $Res Function(_$CustomSliderWidgetThemeImpl) then) =
      __$$CustomSliderWidgetThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, LabelTheme labelTheme});

  @override
  $LabelThemeCopyWith<$Res> get labelTheme;
}

/// @nodoc
class __$$CustomSliderWidgetThemeImplCopyWithImpl<$Res>
    extends _$CustomSliderWidgetThemeCopyWithImpl<$Res,
        _$CustomSliderWidgetThemeImpl>
    implements _$$CustomSliderWidgetThemeImplCopyWith<$Res> {
  __$$CustomSliderWidgetThemeImplCopyWithImpl(
      _$CustomSliderWidgetThemeImpl _value,
      $Res Function(_$CustomSliderWidgetThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomSliderWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labelTheme = null,
  }) {
    return _then(_$CustomSliderWidgetThemeImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == labelTheme
          ? _value.labelTheme
          : labelTheme // ignore: cast_nullable_to_non_nullable
              as LabelTheme,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomSliderWidgetThemeImpl extends _CustomSliderWidgetTheme {
  _$CustomSliderWidgetThemeImpl(this.id, this.labelTheme) : super._();

  factory _$CustomSliderWidgetThemeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomSliderWidgetThemeImplFromJson(json);

  @override
  String id;
  @override
  LabelTheme labelTheme;

  @override
  String toString() {
    return 'CustomSliderWidgetTheme(id: $id, labelTheme: $labelTheme)';
  }

  /// Create a copy of CustomSliderWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomSliderWidgetThemeImplCopyWith<_$CustomSliderWidgetThemeImpl>
      get copyWith => __$$CustomSliderWidgetThemeImplCopyWithImpl<
          _$CustomSliderWidgetThemeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomSliderWidgetThemeImplToJson(
      this,
    );
  }
}

abstract class _CustomSliderWidgetTheme extends CustomSliderWidgetTheme
    implements CustomThemeForWidget {
  factory _CustomSliderWidgetTheme(String id, LabelTheme labelTheme) =
      _$CustomSliderWidgetThemeImpl;
  _CustomSliderWidgetTheme._() : super._();

  factory _CustomSliderWidgetTheme.fromJson(Map<String, dynamic> json) =
      _$CustomSliderWidgetThemeImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  LabelTheme get labelTheme;
  set labelTheme(LabelTheme value);

  /// Create a copy of CustomSliderWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomSliderWidgetThemeImplCopyWith<_$CustomSliderWidgetThemeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
