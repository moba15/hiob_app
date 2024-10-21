// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_boolean_condtion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomBooleanCondtion _$CustomBooleanCondtionFromJson(
    Map<String, dynamic> json) {
  return _CustomBooleanCondtion.fromJson(json);
}

/// @nodoc
mixin _$CustomBooleanCondtion {
  ConditionType get type => throw _privateConstructorUsedError;
  set type(ConditionType value) => throw _privateConstructorUsedError;
  @DataPointIdConverter()
  DataPoint? get datapoint => throw _privateConstructorUsedError;
  @DataPointIdConverter()
  set datapoint(DataPoint? value) => throw _privateConstructorUsedError;

  /// Serializes this CustomBooleanCondtion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomBooleanCondtion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomBooleanCondtionCopyWith<CustomBooleanCondtion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomBooleanCondtionCopyWith<$Res> {
  factory $CustomBooleanCondtionCopyWith(CustomBooleanCondtion value,
          $Res Function(CustomBooleanCondtion) then) =
      _$CustomBooleanCondtionCopyWithImpl<$Res, CustomBooleanCondtion>;
  @useResult
  $Res call({ConditionType type, @DataPointIdConverter() DataPoint? datapoint});
}

/// @nodoc
class _$CustomBooleanCondtionCopyWithImpl<$Res,
        $Val extends CustomBooleanCondtion>
    implements $CustomBooleanCondtionCopyWith<$Res> {
  _$CustomBooleanCondtionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomBooleanCondtion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? datapoint = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConditionType,
      datapoint: freezed == datapoint
          ? _value.datapoint
          : datapoint // ignore: cast_nullable_to_non_nullable
              as DataPoint?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomBooleanCondtionImplCopyWith<$Res>
    implements $CustomBooleanCondtionCopyWith<$Res> {
  factory _$$CustomBooleanCondtionImplCopyWith(
          _$CustomBooleanCondtionImpl value,
          $Res Function(_$CustomBooleanCondtionImpl) then) =
      __$$CustomBooleanCondtionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConditionType type, @DataPointIdConverter() DataPoint? datapoint});
}

/// @nodoc
class __$$CustomBooleanCondtionImplCopyWithImpl<$Res>
    extends _$CustomBooleanCondtionCopyWithImpl<$Res,
        _$CustomBooleanCondtionImpl>
    implements _$$CustomBooleanCondtionImplCopyWith<$Res> {
  __$$CustomBooleanCondtionImplCopyWithImpl(_$CustomBooleanCondtionImpl _value,
      $Res Function(_$CustomBooleanCondtionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomBooleanCondtion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? datapoint = freezed,
  }) {
    return _then(_$CustomBooleanCondtionImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConditionType,
      datapoint: freezed == datapoint
          ? _value.datapoint
          : datapoint // ignore: cast_nullable_to_non_nullable
              as DataPoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomBooleanCondtionImpl extends _CustomBooleanCondtion {
  _$CustomBooleanCondtionImpl(
      {required this.type, @DataPointIdConverter() required this.datapoint})
      : super._();

  factory _$CustomBooleanCondtionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomBooleanCondtionImplFromJson(json);

  @override
  ConditionType type;
  @override
  @DataPointIdConverter()
  DataPoint? datapoint;

  @override
  String toString() {
    return 'CustomBooleanCondtion(type: $type, datapoint: $datapoint)';
  }

  /// Create a copy of CustomBooleanCondtion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomBooleanCondtionImplCopyWith<_$CustomBooleanCondtionImpl>
      get copyWith => __$$CustomBooleanCondtionImplCopyWithImpl<
          _$CustomBooleanCondtionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomBooleanCondtionImplToJson(
      this,
    );
  }
}

abstract class _CustomBooleanCondtion extends CustomBooleanCondtion
    implements CustomCondition {
  factory _CustomBooleanCondtion(
          {required ConditionType type,
          @DataPointIdConverter() required DataPoint? datapoint}) =
      _$CustomBooleanCondtionImpl;
  _CustomBooleanCondtion._() : super._();

  factory _CustomBooleanCondtion.fromJson(Map<String, dynamic> json) =
      _$CustomBooleanCondtionImpl.fromJson;

  @override
  ConditionType get type;
  set type(ConditionType value);
  @override
  @DataPointIdConverter()
  DataPoint? get datapoint;
  @DataPointIdConverter()
  set datapoint(DataPoint? value);

  /// Create a copy of CustomBooleanCondtion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomBooleanCondtionImplCopyWith<_$CustomBooleanCondtionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
