// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_multiselection_widget_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomMultiselectionWidgetTheme _$CustomMultiselectionWidgetThemeFromJson(
    Map<String, dynamic> json) {
  return _CustomMultiselectionWidgetTheme.fromJson(json);
}

/// @nodoc
mixin _$CustomMultiselectionWidgetTheme {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  LabelTheme get labelTheme => throw _privateConstructorUsedError;
  set labelTheme(LabelTheme value) => throw _privateConstructorUsedError;

  /// Serializes this CustomMultiselectionWidgetTheme to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomMultiselectionWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomMultiselectionWidgetThemeCopyWith<CustomMultiselectionWidgetTheme>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomMultiselectionWidgetThemeCopyWith<$Res> {
  factory $CustomMultiselectionWidgetThemeCopyWith(
          CustomMultiselectionWidgetTheme value,
          $Res Function(CustomMultiselectionWidgetTheme) then) =
      _$CustomMultiselectionWidgetThemeCopyWithImpl<$Res,
          CustomMultiselectionWidgetTheme>;
  @useResult
  $Res call({String id, LabelTheme labelTheme});

  $LabelThemeCopyWith<$Res> get labelTheme;
}

/// @nodoc
class _$CustomMultiselectionWidgetThemeCopyWithImpl<$Res,
        $Val extends CustomMultiselectionWidgetTheme>
    implements $CustomMultiselectionWidgetThemeCopyWith<$Res> {
  _$CustomMultiselectionWidgetThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomMultiselectionWidgetTheme
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

  /// Create a copy of CustomMultiselectionWidgetTheme
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
abstract class _$$CustomMultiselectionWidgetThemeImplCopyWith<$Res>
    implements $CustomMultiselectionWidgetThemeCopyWith<$Res> {
  factory _$$CustomMultiselectionWidgetThemeImplCopyWith(
          _$CustomMultiselectionWidgetThemeImpl value,
          $Res Function(_$CustomMultiselectionWidgetThemeImpl) then) =
      __$$CustomMultiselectionWidgetThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, LabelTheme labelTheme});

  @override
  $LabelThemeCopyWith<$Res> get labelTheme;
}

/// @nodoc
class __$$CustomMultiselectionWidgetThemeImplCopyWithImpl<$Res>
    extends _$CustomMultiselectionWidgetThemeCopyWithImpl<$Res,
        _$CustomMultiselectionWidgetThemeImpl>
    implements _$$CustomMultiselectionWidgetThemeImplCopyWith<$Res> {
  __$$CustomMultiselectionWidgetThemeImplCopyWithImpl(
      _$CustomMultiselectionWidgetThemeImpl _value,
      $Res Function(_$CustomMultiselectionWidgetThemeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomMultiselectionWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? labelTheme = null,
  }) {
    return _then(_$CustomMultiselectionWidgetThemeImpl(
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
class _$CustomMultiselectionWidgetThemeImpl
    extends _CustomMultiselectionWidgetTheme {
  _$CustomMultiselectionWidgetThemeImpl(this.id, this.labelTheme) : super._();

  factory _$CustomMultiselectionWidgetThemeImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CustomMultiselectionWidgetThemeImplFromJson(json);

  @override
  String id;
  @override
  LabelTheme labelTheme;

  @override
  String toString() {
    return 'CustomMultiselectionWidgetTheme(id: $id, labelTheme: $labelTheme)';
  }

  /// Create a copy of CustomMultiselectionWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomMultiselectionWidgetThemeImplCopyWith<
          _$CustomMultiselectionWidgetThemeImpl>
      get copyWith => __$$CustomMultiselectionWidgetThemeImplCopyWithImpl<
          _$CustomMultiselectionWidgetThemeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomMultiselectionWidgetThemeImplToJson(
      this,
    );
  }
}

abstract class _CustomMultiselectionWidgetTheme
    extends CustomMultiselectionWidgetTheme implements CustomThemeForWidget {
  factory _CustomMultiselectionWidgetTheme(String id, LabelTheme labelTheme) =
      _$CustomMultiselectionWidgetThemeImpl;
  _CustomMultiselectionWidgetTheme._() : super._();

  factory _CustomMultiselectionWidgetTheme.fromJson(Map<String, dynamic> json) =
      _$CustomMultiselectionWidgetThemeImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  LabelTheme get labelTheme;
  set labelTheme(LabelTheme value);

  /// Create a copy of CustomMultiselectionWidgetTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomMultiselectionWidgetThemeImplCopyWith<
          _$CustomMultiselectionWidgetThemeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
