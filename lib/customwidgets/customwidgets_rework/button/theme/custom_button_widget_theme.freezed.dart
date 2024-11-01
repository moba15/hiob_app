// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_button_widget_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomButtonWidgetTheme _$CustomButtonWidgetThemeFromJson(
    Map<String, dynamic> json) {
  return _CustomButtonWidgetTheme.fromJson(json);
}

/// @nodoc
mixin _$CustomButtonWidgetTheme {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  LabelTheme get labelTheme => throw _privateConstructorUsedError;
  set labelTheme(LabelTheme value) => throw _privateConstructorUsedError;

  /// Serializes this CustomButtonWidgetTheme to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomButtonWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomButtonWidgetThemeCopyWith<CustomButtonWidgetTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomButtonWidgetThemeCopyWith<$Res> {
  factory $CustomButtonWidgetThemeCopyWith(CustomButtonWidgetTheme value,
          $Res Function(CustomButtonWidgetTheme) then) =
      _$CustomButtonWidgetThemeCopyWithImpl<$Res, CustomButtonWidgetTheme>;
  @useResult
  $Res call({String id, LabelTheme labelTheme});

  $LabelThemeCopyWith<$Res> get labelTheme;
}

/// @nodoc
class _$CustomButtonWidgetThemeCopyWithImpl<$Res,
        $Val extends CustomButtonWidgetTheme>
    implements $CustomButtonWidgetThemeCopyWith<$Res> {
  _$CustomButtonWidgetThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomButtonWidgetTheme
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

  /// Create a copy of CustomButtonWidgetTheme
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
abstract class _$$CustomButtonWidgetThemeImplCopyWith<$Res>
    implements $CustomButtonWidgetThemeCopyWith<$Res> {
  factory _$$CustomButtonWidgetThemeImplCopyWith(
          _$CustomButtonWidgetThemeImpl value,
          $Res Function(_$CustomButtonWidgetThemeImpl) then) =
      __$$CustomButtonWidgetThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, LabelTheme labelTheme});

  @override
  $LabelThemeCopyWith<$Res> get labelTheme;
}

/// @nodoc
class __$$CustomButtonWidgetThemeImplCopyWithImpl<$Res>
    extends _$CustomButtonWidgetThemeCopyWithImpl<$Res,
        _$CustomButtonWidgetThemeImpl>
    implements _$$CustomButtonWidgetThemeImplCopyWith<$Res> {
  __$$CustomButtonWidgetThemeImplCopyWithImpl(
      _$CustomButtonWidgetThemeImpl _value,
      $Res Function(_$CustomButtonWidgetThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomButtonWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labelTheme = null,
  }) {
    return _then(_$CustomButtonWidgetThemeImpl(
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
class _$CustomButtonWidgetThemeImpl extends _CustomButtonWidgetTheme {
  _$CustomButtonWidgetThemeImpl(this.id, this.labelTheme) : super._();

  factory _$CustomButtonWidgetThemeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomButtonWidgetThemeImplFromJson(json);

  @override
  String id;
  @override
  LabelTheme labelTheme;

  @override
  String toString() {
    return 'CustomButtonWidgetTheme(id: $id, labelTheme: $labelTheme)';
  }

  /// Create a copy of CustomButtonWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomButtonWidgetThemeImplCopyWith<_$CustomButtonWidgetThemeImpl>
      get copyWith => __$$CustomButtonWidgetThemeImplCopyWithImpl<
          _$CustomButtonWidgetThemeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomButtonWidgetThemeImplToJson(
      this,
    );
  }
}

abstract class _CustomButtonWidgetTheme extends CustomButtonWidgetTheme
    implements CustomThemeForWidget {
  factory _CustomButtonWidgetTheme(String id, LabelTheme labelTheme) =
      _$CustomButtonWidgetThemeImpl;
  _CustomButtonWidgetTheme._() : super._();

  factory _CustomButtonWidgetTheme.fromJson(Map<String, dynamic> json) =
      _$CustomButtonWidgetThemeImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  LabelTheme get labelTheme;
  set labelTheme(LabelTheme value);

  /// Create a copy of CustomButtonWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomButtonWidgetThemeImplCopyWith<_$CustomButtonWidgetThemeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
