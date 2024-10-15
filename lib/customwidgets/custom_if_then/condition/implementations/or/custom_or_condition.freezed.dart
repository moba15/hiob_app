// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_or_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomOrCondtion _$CustomOrCondtionFromJson(Map<String, dynamic> json) {
  return _CustomOrCondtion.fromJson(json);
}

/// @nodoc
mixin _$CustomOrCondtion {
  ConditionType get type => throw _privateConstructorUsedError;
  set type(ConditionType value) => throw _privateConstructorUsedError;
  List<CustomCondition> get conditions => throw _privateConstructorUsedError;
  set conditions(List<CustomCondition> value) =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomOrCondtion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomOrCondtion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomOrCondtionCopyWith<CustomOrCondtion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomOrCondtionCopyWith<$Res> {
  factory $CustomOrCondtionCopyWith(
          CustomOrCondtion value, $Res Function(CustomOrCondtion) then) =
      _$CustomOrCondtionCopyWithImpl<$Res, CustomOrCondtion>;
  @useResult
  $Res call({ConditionType type, List<CustomCondition> conditions});
}

/// @nodoc
class _$CustomOrCondtionCopyWithImpl<$Res, $Val extends CustomOrCondtion>
    implements $CustomOrCondtionCopyWith<$Res> {
  _$CustomOrCondtionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomOrCondtion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? conditions = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConditionType,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<CustomCondition>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomOrCondtionImplCopyWith<$Res>
    implements $CustomOrCondtionCopyWith<$Res> {
  factory _$$CustomOrCondtionImplCopyWith(_$CustomOrCondtionImpl value,
          $Res Function(_$CustomOrCondtionImpl) then) =
      __$$CustomOrCondtionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConditionType type, List<CustomCondition> conditions});
}

/// @nodoc
class __$$CustomOrCondtionImplCopyWithImpl<$Res>
    extends _$CustomOrCondtionCopyWithImpl<$Res, _$CustomOrCondtionImpl>
    implements _$$CustomOrCondtionImplCopyWith<$Res> {
  __$$CustomOrCondtionImplCopyWithImpl(_$CustomOrCondtionImpl _value,
      $Res Function(_$CustomOrCondtionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomOrCondtion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? conditions = null,
  }) {
    return _then(_$CustomOrCondtionImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConditionType,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<CustomCondition>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomOrCondtionImpl extends _CustomOrCondtion {
  _$CustomOrCondtionImpl({required this.type, required this.conditions})
      : super._();

  factory _$CustomOrCondtionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomOrCondtionImplFromJson(json);

  @override
  ConditionType type;
  @override
  List<CustomCondition> conditions;

  @override
  String toString() {
    return 'CustomOrCondtion(type: $type, conditions: $conditions)';
  }

  /// Create a copy of CustomOrCondtion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomOrCondtionImplCopyWith<_$CustomOrCondtionImpl> get copyWith =>
      __$$CustomOrCondtionImplCopyWithImpl<_$CustomOrCondtionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomOrCondtionImplToJson(
      this,
    );
  }
}

abstract class _CustomOrCondtion extends CustomOrCondtion
    implements CustomCondition {
  factory _CustomOrCondtion(
      {required ConditionType type,
      required List<CustomCondition> conditions}) = _$CustomOrCondtionImpl;
  _CustomOrCondtion._() : super._();

  factory _CustomOrCondtion.fromJson(Map<String, dynamic> json) =
      _$CustomOrCondtionImpl.fromJson;

  @override
  ConditionType get type;
  set type(ConditionType value);
  @override
  List<CustomCondition> get conditions;
  set conditions(List<CustomCondition> value);

  /// Create a copy of CustomOrCondtion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomOrCondtionImplCopyWith<_$CustomOrCondtionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
