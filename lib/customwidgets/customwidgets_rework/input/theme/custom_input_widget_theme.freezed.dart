// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_input_widget_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomInputWidgetTheme _$CustomInputWidgetThemeFromJson(
    Map<String, dynamic> json) {
  return _CustomInputWidgetTheme.fromJson(json);
}

/// @nodoc
mixin _$CustomInputWidgetTheme {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  LabelTheme get labelTheme => throw _privateConstructorUsedError;
  set labelTheme(LabelTheme value) => throw _privateConstructorUsedError;

  /// Serializes this CustomInputWidgetTheme to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomInputWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomInputWidgetThemeCopyWith<CustomInputWidgetTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomInputWidgetThemeCopyWith<$Res> {
  factory $CustomInputWidgetThemeCopyWith(CustomInputWidgetTheme value,
          $Res Function(CustomInputWidgetTheme) then) =
      _$CustomInputWidgetThemeCopyWithImpl<$Res, CustomInputWidgetTheme>;
  @useResult
  $Res call({String id, LabelTheme labelTheme});

  $LabelThemeCopyWith<$Res> get labelTheme;
}

/// @nodoc
class _$CustomInputWidgetThemeCopyWithImpl<$Res,
        $Val extends CustomInputWidgetTheme>
    implements $CustomInputWidgetThemeCopyWith<$Res> {
  _$CustomInputWidgetThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomInputWidgetTheme
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

  /// Create a copy of CustomInputWidgetTheme
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
abstract class _$$CustomInputWidgetThemeImplCopyWith<$Res>
    implements $CustomInputWidgetThemeCopyWith<$Res> {
  factory _$$CustomInputWidgetThemeImplCopyWith(
          _$CustomInputWidgetThemeImpl value,
          $Res Function(_$CustomInputWidgetThemeImpl) then) =
      __$$CustomInputWidgetThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, LabelTheme labelTheme});

  @override
  $LabelThemeCopyWith<$Res> get labelTheme;
}

/// @nodoc
class __$$CustomInputWidgetThemeImplCopyWithImpl<$Res>
    extends _$CustomInputWidgetThemeCopyWithImpl<$Res,
        _$CustomInputWidgetThemeImpl>
    implements _$$CustomInputWidgetThemeImplCopyWith<$Res> {
  __$$CustomInputWidgetThemeImplCopyWithImpl(
      _$CustomInputWidgetThemeImpl _value,
      $Res Function(_$CustomInputWidgetThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomInputWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labelTheme = null,
  }) {
    return _then(_$CustomInputWidgetThemeImpl(
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
class _$CustomInputWidgetThemeImpl extends _CustomInputWidgetTheme {
  _$CustomInputWidgetThemeImpl(this.id, this.labelTheme) : super._();

  factory _$CustomInputWidgetThemeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomInputWidgetThemeImplFromJson(json);

  @override
  String id;
  @override
  LabelTheme labelTheme;

  @override
  String toString() {
    return 'CustomInputWidgetTheme(id: $id, labelTheme: $labelTheme)';
  }

  /// Create a copy of CustomInputWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomInputWidgetThemeImplCopyWith<_$CustomInputWidgetThemeImpl>
      get copyWith => __$$CustomInputWidgetThemeImplCopyWithImpl<
          _$CustomInputWidgetThemeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomInputWidgetThemeImplToJson(
      this,
    );
  }
}

abstract class _CustomInputWidgetTheme extends CustomInputWidgetTheme
    implements CustomThemeForWidget {
  factory _CustomInputWidgetTheme(String id, LabelTheme labelTheme) =
      _$CustomInputWidgetThemeImpl;
  _CustomInputWidgetTheme._() : super._();

  factory _CustomInputWidgetTheme.fromJson(Map<String, dynamic> json) =
      _$CustomInputWidgetThemeImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  LabelTheme get labelTheme;
  set labelTheme(LabelTheme value);

  /// Create a copy of CustomInputWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomInputWidgetThemeImplCopyWith<_$CustomInputWidgetThemeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
