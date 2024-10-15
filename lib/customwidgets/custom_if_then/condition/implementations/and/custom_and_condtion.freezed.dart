// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_and_condtion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomAndCondtion _$CustomAndCondtionFromJson(Map<String, dynamic> json) {
  return _CustomAndCondtion.fromJson(json);
}

/// @nodoc
mixin _$CustomAndCondtion {
  ConditionType get type => throw _privateConstructorUsedError;
  set type(ConditionType value) => throw _privateConstructorUsedError;
  List<CustomCondition> get conditions => throw _privateConstructorUsedError;
  set conditions(List<CustomCondition> value) =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomAndCondtion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomAndCondtion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomAndCondtionCopyWith<CustomAndCondtion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomAndCondtionCopyWith<$Res> {
  factory $CustomAndCondtionCopyWith(
          CustomAndCondtion value, $Res Function(CustomAndCondtion) then) =
      _$CustomAndCondtionCopyWithImpl<$Res, CustomAndCondtion>;
  @useResult
  $Res call({ConditionType type, List<CustomCondition> conditions});
}

/// @nodoc
class _$CustomAndCondtionCopyWithImpl<$Res, $Val extends CustomAndCondtion>
    implements $CustomAndCondtionCopyWith<$Res> {
  _$CustomAndCondtionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomAndCondtion
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
abstract class _$$CustomAndCondtionImplCopyWith<$Res>
    implements $CustomAndCondtionCopyWith<$Res> {
  factory _$$CustomAndCondtionImplCopyWith(_$CustomAndCondtionImpl value,
          $Res Function(_$CustomAndCondtionImpl) then) =
      __$$CustomAndCondtionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConditionType type, List<CustomCondition> conditions});
}

/// @nodoc
class __$$CustomAndCondtionImplCopyWithImpl<$Res>
    extends _$CustomAndCondtionCopyWithImpl<$Res, _$CustomAndCondtionImpl>
    implements _$$CustomAndCondtionImplCopyWith<$Res> {
  __$$CustomAndCondtionImplCopyWithImpl(_$CustomAndCondtionImpl _value,
      $Res Function(_$CustomAndCondtionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomAndCondtion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? conditions = null,
  }) {
    return _then(_$CustomAndCondtionImpl(
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
class _$CustomAndCondtionImpl extends _CustomAndCondtion {
  _$CustomAndCondtionImpl({required this.type, required this.conditions})
      : super._();

  factory _$CustomAndCondtionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomAndCondtionImplFromJson(json);

  @override
  ConditionType type;
  @override
  List<CustomCondition> conditions;

  @override
  String toString() {
    return 'CustomAndCondtion(type: $type, conditions: $conditions)';
  }

  /// Create a copy of CustomAndCondtion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomAndCondtionImplCopyWith<_$CustomAndCondtionImpl> get copyWith =>
      __$$CustomAndCondtionImplCopyWithImpl<_$CustomAndCondtionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomAndCondtionImplToJson(
      this,
    );
  }
}

abstract class _CustomAndCondtion extends CustomAndCondtion
    implements CustomCondition {
  factory _CustomAndCondtion(
      {required ConditionType type,
      required List<CustomCondition> conditions}) = _$CustomAndCondtionImpl;
  _CustomAndCondtion._() : super._();

  factory _CustomAndCondtion.fromJson(Map<String, dynamic> json) =
      _$CustomAndCondtionImpl.fromJson;

  @override
  ConditionType get type;
  set type(ConditionType value);
  @override
  List<CustomCondition> get conditions;
  set conditions(List<CustomCondition> value);

  /// Create a copy of CustomAndCondtion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomAndCondtionImplCopyWith<_$CustomAndCondtionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
