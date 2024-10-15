// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomCondition _$CustomConditionFromJson(Map<String, dynamic> json) {
  return _CustomCondition.fromJson(json);
}

/// @nodoc
mixin _$CustomCondition {
  /// Serializes this CustomCondition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomConditionCopyWith<$Res> {
  factory $CustomConditionCopyWith(
          CustomCondition value, $Res Function(CustomCondition) then) =
      _$CustomConditionCopyWithImpl<$Res, CustomCondition>;
}

/// @nodoc
class _$CustomConditionCopyWithImpl<$Res, $Val extends CustomCondition>
    implements $CustomConditionCopyWith<$Res> {
  _$CustomConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomCondition
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CustomConditionImplCopyWith<$Res> {
  factory _$$CustomConditionImplCopyWith(_$CustomConditionImpl value,
          $Res Function(_$CustomConditionImpl) then) =
      __$$CustomConditionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CustomConditionImplCopyWithImpl<$Res>
    extends _$CustomConditionCopyWithImpl<$Res, _$CustomConditionImpl>
    implements _$$CustomConditionImplCopyWith<$Res> {
  __$$CustomConditionImplCopyWithImpl(
      _$CustomConditionImpl _value, $Res Function(_$CustomConditionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomCondition
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$CustomConditionImpl implements _CustomCondition {
  _$CustomConditionImpl();

  factory _$CustomConditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomConditionImplFromJson(json);

  @override
  String toString() {
    return 'CustomCondition()';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomConditionImplToJson(
      this,
    );
  }
}

abstract class _CustomCondition implements CustomCondition {
  factory _CustomCondition() = _$CustomConditionImpl;

  factory _CustomCondition.fromJson(Map<String, dynamic> json) =
      _$CustomConditionImpl.fromJson;
}
