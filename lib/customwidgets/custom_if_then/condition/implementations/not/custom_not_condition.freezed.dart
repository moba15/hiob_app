// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_not_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomNotCondtion _$CustomNotCondtionFromJson(Map<String, dynamic> json) {
  return _CustomNotCondtion.fromJson(json);
}

/// @nodoc
mixin _$CustomNotCondtion {
  ConditionType get type => throw _privateConstructorUsedError;
  set type(ConditionType value) => throw _privateConstructorUsedError;
  CustomCondition get condition => throw _privateConstructorUsedError;
  set condition(CustomCondition value) => throw _privateConstructorUsedError;

  /// Serializes this CustomNotCondtion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomNotCondtion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomNotCondtionCopyWith<CustomNotCondtion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomNotCondtionCopyWith<$Res> {
  factory $CustomNotCondtionCopyWith(
          CustomNotCondtion value, $Res Function(CustomNotCondtion) then) =
      _$CustomNotCondtionCopyWithImpl<$Res, CustomNotCondtion>;
  @useResult
  $Res call({ConditionType type, CustomCondition condition});
}

/// @nodoc
class _$CustomNotCondtionCopyWithImpl<$Res, $Val extends CustomNotCondtion>
    implements $CustomNotCondtionCopyWith<$Res> {
  _$CustomNotCondtionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomNotCondtion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? condition = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConditionType,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as CustomCondition,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomNotCondtionImplCopyWith<$Res>
    implements $CustomNotCondtionCopyWith<$Res> {
  factory _$$CustomNotCondtionImplCopyWith(_$CustomNotCondtionImpl value,
          $Res Function(_$CustomNotCondtionImpl) then) =
      __$$CustomNotCondtionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConditionType type, CustomCondition condition});
}

/// @nodoc
class __$$CustomNotCondtionImplCopyWithImpl<$Res>
    extends _$CustomNotCondtionCopyWithImpl<$Res, _$CustomNotCondtionImpl>
    implements _$$CustomNotCondtionImplCopyWith<$Res> {
  __$$CustomNotCondtionImplCopyWithImpl(_$CustomNotCondtionImpl _value,
      $Res Function(_$CustomNotCondtionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomNotCondtion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? condition = null,
  }) {
    return _then(_$CustomNotCondtionImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConditionType,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as CustomCondition,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomNotCondtionImpl extends _CustomNotCondtion {
  _$CustomNotCondtionImpl({required this.type, required this.condition})
      : super._();

  factory _$CustomNotCondtionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomNotCondtionImplFromJson(json);

  @override
  ConditionType type;
  @override
  CustomCondition condition;

  @override
  String toString() {
    return 'CustomNotCondtion(type: $type, condition: $condition)';
  }

  /// Create a copy of CustomNotCondtion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomNotCondtionImplCopyWith<_$CustomNotCondtionImpl> get copyWith =>
      __$$CustomNotCondtionImplCopyWithImpl<_$CustomNotCondtionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomNotCondtionImplToJson(
      this,
    );
  }
}

abstract class _CustomNotCondtion extends CustomNotCondtion
    implements CustomCondition {
  factory _CustomNotCondtion(
      {required ConditionType type,
      required CustomCondition condition}) = _$CustomNotCondtionImpl;
  _CustomNotCondtion._() : super._();

  factory _CustomNotCondtion.fromJson(Map<String, dynamic> json) =
      _$CustomNotCondtionImpl.fromJson;

  @override
  ConditionType get type;
  set type(ConditionType value);
  @override
  CustomCondition get condition;
  set condition(CustomCondition value);

  /// Create a copy of CustomNotCondtion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomNotCondtionImplCopyWith<_$CustomNotCondtionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
