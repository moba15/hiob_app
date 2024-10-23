// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_switch_widget_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomSwitchWidgetTheme _$CustomSwitchWidgetThemeFromJson(
    Map<String, dynamic> json) {
  return _CustomSwitchWidgetTheme.fromJson(json);
}

/// @nodoc
mixin _$CustomSwitchWidgetTheme {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  LabelTheme get labelTheme => throw _privateConstructorUsedError;
  set labelTheme(LabelTheme value) => throw _privateConstructorUsedError;

  /// Serializes this CustomSwitchWidgetTheme to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomSwitchWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomSwitchWidgetThemeCopyWith<CustomSwitchWidgetTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomSwitchWidgetThemeCopyWith<$Res> {
  factory $CustomSwitchWidgetThemeCopyWith(CustomSwitchWidgetTheme value,
          $Res Function(CustomSwitchWidgetTheme) then) =
      _$CustomSwitchWidgetThemeCopyWithImpl<$Res, CustomSwitchWidgetTheme>;
  @useResult
  $Res call({String id, LabelTheme labelTheme});

  $LabelThemeCopyWith<$Res> get labelTheme;
}

/// @nodoc
class _$CustomSwitchWidgetThemeCopyWithImpl<$Res,
        $Val extends CustomSwitchWidgetTheme>
    implements $CustomSwitchWidgetThemeCopyWith<$Res> {
  _$CustomSwitchWidgetThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomSwitchWidgetTheme
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

  /// Create a copy of CustomSwitchWidgetTheme
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
abstract class _$$CustomSwitchWidgetThemeImplCopyWith<$Res>
    implements $CustomSwitchWidgetThemeCopyWith<$Res> {
  factory _$$CustomSwitchWidgetThemeImplCopyWith(
          _$CustomSwitchWidgetThemeImpl value,
          $Res Function(_$CustomSwitchWidgetThemeImpl) then) =
      __$$CustomSwitchWidgetThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, LabelTheme labelTheme});

  @override
  $LabelThemeCopyWith<$Res> get labelTheme;
}

/// @nodoc
class __$$CustomSwitchWidgetThemeImplCopyWithImpl<$Res>
    extends _$CustomSwitchWidgetThemeCopyWithImpl<$Res,
        _$CustomSwitchWidgetThemeImpl>
    implements _$$CustomSwitchWidgetThemeImplCopyWith<$Res> {
  __$$CustomSwitchWidgetThemeImplCopyWithImpl(
      _$CustomSwitchWidgetThemeImpl _value,
      $Res Function(_$CustomSwitchWidgetThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomSwitchWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labelTheme = null,
  }) {
    return _then(_$CustomSwitchWidgetThemeImpl(
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
class _$CustomSwitchWidgetThemeImpl extends _CustomSwitchWidgetTheme {
  _$CustomSwitchWidgetThemeImpl(this.id, this.labelTheme) : super._();

  factory _$CustomSwitchWidgetThemeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomSwitchWidgetThemeImplFromJson(json);

  @override
  String id;
  @override
  LabelTheme labelTheme;

  @override
  String toString() {
    return 'CustomSwitchWidgetTheme(id: $id, labelTheme: $labelTheme)';
  }

  /// Create a copy of CustomSwitchWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomSwitchWidgetThemeImplCopyWith<_$CustomSwitchWidgetThemeImpl>
      get copyWith => __$$CustomSwitchWidgetThemeImplCopyWithImpl<
          _$CustomSwitchWidgetThemeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomSwitchWidgetThemeImplToJson(
      this,
    );
  }
}

abstract class _CustomSwitchWidgetTheme extends CustomSwitchWidgetTheme
    implements CustomThemeForWidget {
  factory _CustomSwitchWidgetTheme(String id, LabelTheme labelTheme) =
      _$CustomSwitchWidgetThemeImpl;
  _CustomSwitchWidgetTheme._() : super._();

  factory _CustomSwitchWidgetTheme.fromJson(Map<String, dynamic> json) =
      _$CustomSwitchWidgetThemeImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  LabelTheme get labelTheme;
  set labelTheme(LabelTheme value);

  /// Create a copy of CustomSwitchWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomSwitchWidgetThemeImplCopyWith<_$CustomSwitchWidgetThemeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
