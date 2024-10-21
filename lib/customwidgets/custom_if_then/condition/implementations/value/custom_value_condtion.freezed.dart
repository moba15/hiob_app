// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_value_condtion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomValueCondtion _$CustomValueCondtionFromJson(Map<String, dynamic> json) {
  return _CustomValueCondtion.fromJson(json);
}

/// @nodoc
mixin _$CustomValueCondtion {
  ConditionType get type => throw _privateConstructorUsedError;
  set type(ConditionType value) => throw _privateConstructorUsedError;
  @DataPointIdConverter()
  DataPoint? get datapoint => throw _privateConstructorUsedError;
  @DataPointIdConverter()
  set datapoint(DataPoint? value) => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  set value(dynamic value) => throw _privateConstructorUsedError;
  ValueConditionType get valueConditionType =>
      throw _privateConstructorUsedError;
  set valueConditionType(ValueConditionType value) =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomValueCondtion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomValueCondtion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomValueCondtionCopyWith<CustomValueCondtion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomValueCondtionCopyWith<$Res> {
  factory $CustomValueCondtionCopyWith(
          CustomValueCondtion value, $Res Function(CustomValueCondtion) then) =
      _$CustomValueCondtionCopyWithImpl<$Res, CustomValueCondtion>;
  @useResult
  $Res call(
      {ConditionType type,
      @DataPointIdConverter() DataPoint? datapoint,
      dynamic value,
      ValueConditionType valueConditionType});
}

/// @nodoc
class _$CustomValueCondtionCopyWithImpl<$Res, $Val extends CustomValueCondtion>
    implements $CustomValueCondtionCopyWith<$Res> {
  _$CustomValueCondtionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomValueCondtion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? datapoint = freezed,
    Object? value = freezed,
    Object? valueConditionType = null,
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
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      valueConditionType: null == valueConditionType
          ? _value.valueConditionType
          : valueConditionType // ignore: cast_nullable_to_non_nullable
              as ValueConditionType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomValueCondtionImplCopyWith<$Res>
    implements $CustomValueCondtionCopyWith<$Res> {
  factory _$$CustomValueCondtionImplCopyWith(_$CustomValueCondtionImpl value,
          $Res Function(_$CustomValueCondtionImpl) then) =
      __$$CustomValueCondtionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ConditionType type,
      @DataPointIdConverter() DataPoint? datapoint,
      dynamic value,
      ValueConditionType valueConditionType});
}

/// @nodoc
class __$$CustomValueCondtionImplCopyWithImpl<$Res>
    extends _$CustomValueCondtionCopyWithImpl<$Res, _$CustomValueCondtionImpl>
    implements _$$CustomValueCondtionImplCopyWith<$Res> {
  __$$CustomValueCondtionImplCopyWithImpl(_$CustomValueCondtionImpl _value,
      $Res Function(_$CustomValueCondtionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomValueCondtion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? datapoint = freezed,
    Object? value = freezed,
    Object? valueConditionType = null,
  }) {
    return _then(_$CustomValueCondtionImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConditionType,
      datapoint: freezed == datapoint
          ? _value.datapoint
          : datapoint // ignore: cast_nullable_to_non_nullable
              as DataPoint?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      valueConditionType: null == valueConditionType
          ? _value.valueConditionType
          : valueConditionType // ignore: cast_nullable_to_non_nullable
              as ValueConditionType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomValueCondtionImpl extends _CustomValueCondtion {
  _$CustomValueCondtionImpl(
      {required this.type,
      @DataPointIdConverter() required this.datapoint,
      this.value,
      required this.valueConditionType})
      : super._();

  factory _$CustomValueCondtionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomValueCondtionImplFromJson(json);

  @override
  ConditionType type;
  @override
  @DataPointIdConverter()
  DataPoint? datapoint;
  @override
  dynamic value;
  @override
  ValueConditionType valueConditionType;

  @override
  String toString() {
    return 'CustomValueCondtion(type: $type, datapoint: $datapoint, value: $value, valueConditionType: $valueConditionType)';
  }

  /// Create a copy of CustomValueCondtion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomValueCondtionImplCopyWith<_$CustomValueCondtionImpl> get copyWith =>
      __$$CustomValueCondtionImplCopyWithImpl<_$CustomValueCondtionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomValueCondtionImplToJson(
      this,
    );
  }
}

abstract class _CustomValueCondtion extends CustomValueCondtion
    implements CustomCondition {
  factory _CustomValueCondtion(
          {required ConditionType type,
          @DataPointIdConverter() required DataPoint? datapoint,
          dynamic value,
          required ValueConditionType valueConditionType}) =
      _$CustomValueCondtionImpl;
  _CustomValueCondtion._() : super._();

  factory _CustomValueCondtion.fromJson(Map<String, dynamic> json) =
      _$CustomValueCondtionImpl.fromJson;

  @override
  ConditionType get type;
  set type(ConditionType value);
  @override
  @DataPointIdConverter()
  DataPoint? get datapoint;
  @DataPointIdConverter()
  set datapoint(DataPoint? value);
  @override
  dynamic get value;
  set value(dynamic value);
  @override
  ValueConditionType get valueConditionType;
  set valueConditionType(ValueConditionType value);

  /// Create a copy of CustomValueCondtion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomValueCondtionImplCopyWith<_$CustomValueCondtionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
