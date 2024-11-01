// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_colorpicker_widget_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomColorpickerWidgetTheme _$CustomColorpickerWidgetThemeFromJson(
    Map<String, dynamic> json) {
  return _CustomColorpickerWidgetTheme.fromJson(json);
}

/// @nodoc
mixin _$CustomColorpickerWidgetTheme {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  LabelTheme get labelTheme => throw _privateConstructorUsedError;
  set labelTheme(LabelTheme value) => throw _privateConstructorUsedError;

  /// Serializes this CustomColorpickerWidgetTheme to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomColorpickerWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomColorpickerWidgetThemeCopyWith<CustomColorpickerWidgetTheme>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomColorpickerWidgetThemeCopyWith<$Res> {
  factory $CustomColorpickerWidgetThemeCopyWith(
          CustomColorpickerWidgetTheme value,
          $Res Function(CustomColorpickerWidgetTheme) then) =
      _$CustomColorpickerWidgetThemeCopyWithImpl<$Res,
          CustomColorpickerWidgetTheme>;
  @useResult
  $Res call({String id, LabelTheme labelTheme});

  $LabelThemeCopyWith<$Res> get labelTheme;
}

/// @nodoc
class _$CustomColorpickerWidgetThemeCopyWithImpl<$Res,
        $Val extends CustomColorpickerWidgetTheme>
    implements $CustomColorpickerWidgetThemeCopyWith<$Res> {
  _$CustomColorpickerWidgetThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomColorpickerWidgetTheme
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

  /// Create a copy of CustomColorpickerWidgetTheme
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
abstract class _$$CustomColorpickerWidgetThemeImplCopyWith<$Res>
    implements $CustomColorpickerWidgetThemeCopyWith<$Res> {
  factory _$$CustomColorpickerWidgetThemeImplCopyWith(
          _$CustomColorpickerWidgetThemeImpl value,
          $Res Function(_$CustomColorpickerWidgetThemeImpl) then) =
      __$$CustomColorpickerWidgetThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, LabelTheme labelTheme});

  @override
  $LabelThemeCopyWith<$Res> get labelTheme;
}

/// @nodoc
class __$$CustomColorpickerWidgetThemeImplCopyWithImpl<$Res>
    extends _$CustomColorpickerWidgetThemeCopyWithImpl<$Res,
        _$CustomColorpickerWidgetThemeImpl>
    implements _$$CustomColorpickerWidgetThemeImplCopyWith<$Res> {
  __$$CustomColorpickerWidgetThemeImplCopyWithImpl(
      _$CustomColorpickerWidgetThemeImpl _value,
      $Res Function(_$CustomColorpickerWidgetThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomColorpickerWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labelTheme = null,
  }) {
    return _then(_$CustomColorpickerWidgetThemeImpl(
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
class _$CustomColorpickerWidgetThemeImpl extends _CustomColorpickerWidgetTheme {
  _$CustomColorpickerWidgetThemeImpl(this.id, this.labelTheme) : super._();

  factory _$CustomColorpickerWidgetThemeImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CustomColorpickerWidgetThemeImplFromJson(json);

  @override
  String id;
  @override
  LabelTheme labelTheme;

  @override
  String toString() {
    return 'CustomColorpickerWidgetTheme(id: $id, labelTheme: $labelTheme)';
  }

  /// Create a copy of CustomColorpickerWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomColorpickerWidgetThemeImplCopyWith<
          _$CustomColorpickerWidgetThemeImpl>
      get copyWith => __$$CustomColorpickerWidgetThemeImplCopyWithImpl<
          _$CustomColorpickerWidgetThemeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomColorpickerWidgetThemeImplToJson(
      this,
    );
  }
}

abstract class _CustomColorpickerWidgetTheme
    extends CustomColorpickerWidgetTheme implements CustomThemeForWidget {
  factory _CustomColorpickerWidgetTheme(String id, LabelTheme labelTheme) =
      _$CustomColorpickerWidgetThemeImpl;
  _CustomColorpickerWidgetTheme._() : super._();

  factory _CustomColorpickerWidgetTheme.fromJson(Map<String, dynamic> json) =
      _$CustomColorpickerWidgetThemeImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  LabelTheme get labelTheme;
  set labelTheme(LabelTheme value);

  /// Create a copy of CustomColorpickerWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomColorpickerWidgetThemeImplCopyWith<
          _$CustomColorpickerWidgetThemeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
