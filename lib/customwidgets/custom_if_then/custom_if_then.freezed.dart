// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_if_then.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomIfThen _$CustomIfThenFromJson(Map<String, dynamic> json) {
  return _CustomAction.fromJson(json);
}

/// @nodoc
mixin _$CustomIfThen {
  CustomCondition? get customCondition => throw _privateConstructorUsedError;
  set customCondition(CustomCondition? value) =>
      throw _privateConstructorUsedError;
  List<CustomAction>? get customActions => throw _privateConstructorUsedError;
  set customActions(List<CustomAction>? value) =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomIfThen to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomIfThen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomIfThenCopyWith<CustomIfThen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomIfThenCopyWith<$Res> {
  factory $CustomIfThenCopyWith(
          CustomIfThen value, $Res Function(CustomIfThen) then) =
      _$CustomIfThenCopyWithImpl<$Res, CustomIfThen>;
  @useResult
  $Res call(
      {CustomCondition? customCondition, List<CustomAction>? customActions});
}

/// @nodoc
class _$CustomIfThenCopyWithImpl<$Res, $Val extends CustomIfThen>
    implements $CustomIfThenCopyWith<$Res> {
  _$CustomIfThenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomIfThen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customCondition = freezed,
    Object? customActions = freezed,
  }) {
    return _then(_value.copyWith(
      customCondition: freezed == customCondition
          ? _value.customCondition
          : customCondition // ignore: cast_nullable_to_non_nullable
              as CustomCondition?,
      customActions: freezed == customActions
          ? _value.customActions
          : customActions // ignore: cast_nullable_to_non_nullable
              as List<CustomAction>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomActionImplCopyWith<$Res>
    implements $CustomIfThenCopyWith<$Res> {
  factory _$$CustomActionImplCopyWith(
          _$CustomActionImpl value, $Res Function(_$CustomActionImpl) then) =
      __$$CustomActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomCondition? customCondition, List<CustomAction>? customActions});
}

/// @nodoc
class __$$CustomActionImplCopyWithImpl<$Res>
    extends _$CustomIfThenCopyWithImpl<$Res, _$CustomActionImpl>
    implements _$$CustomActionImplCopyWith<$Res> {
  __$$CustomActionImplCopyWithImpl(
      _$CustomActionImpl _value, $Res Function(_$CustomActionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomIfThen
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customCondition = freezed,
    Object? customActions = freezed,
  }) {
    return _then(_$CustomActionImpl(
      customCondition: freezed == customCondition
          ? _value.customCondition
          : customCondition // ignore: cast_nullable_to_non_nullable
              as CustomCondition?,
      customActions: freezed == customActions
          ? _value.customActions
          : customActions // ignore: cast_nullable_to_non_nullable
              as List<CustomAction>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomActionImpl implements _CustomAction {
  _$CustomActionImpl({this.customCondition, this.customActions});

  factory _$CustomActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomActionImplFromJson(json);

  @override
  CustomCondition? customCondition;
  @override
  List<CustomAction>? customActions;

  @override
  String toString() {
    return 'CustomIfThen(customCondition: $customCondition, customActions: $customActions)';
  }

  /// Create a copy of CustomIfThen
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomActionImplCopyWith<_$CustomActionImpl> get copyWith =>
      __$$CustomActionImplCopyWithImpl<_$CustomActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomActionImplToJson(
      this,
    );
  }
}

abstract class _CustomAction implements CustomIfThen {
  factory _CustomAction(
      {CustomCondition? customCondition,
      List<CustomAction>? customActions}) = _$CustomActionImpl;

  factory _CustomAction.fromJson(Map<String, dynamic> json) =
      _$CustomActionImpl.fromJson;

  @override
  CustomCondition? get customCondition;
  set customCondition(CustomCondition? value);
  @override
  List<CustomAction>? get customActions;
  set customActions(List<CustomAction>? value);

  /// Create a copy of CustomIfThen
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomActionImplCopyWith<_$CustomActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
