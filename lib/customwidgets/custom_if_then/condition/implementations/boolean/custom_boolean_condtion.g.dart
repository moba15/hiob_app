// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_boolean_condtion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomBooleanCondtionImpl _$$CustomBooleanCondtionImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomBooleanCondtionImpl(
      type: $enumDecode(_$ConditionTypeEnumMap, json['type']),
      datapoint: _$JsonConverterFromJson<String, DataPoint?>(
          json['datapoint'], const DataPointIdConverter().fromJson),
    );

Map<String, dynamic> _$$CustomBooleanCondtionImplToJson(
        _$CustomBooleanCondtionImpl instance) =>
    <String, dynamic>{
      'type': _$ConditionTypeEnumMap[instance.type]!,
      'datapoint': const DataPointIdConverter().toJson(instance.datapoint),
    };

const _$ConditionTypeEnumMap = {
  ConditionType.and: 'and',
  ConditionType.or: 'or',
  ConditionType.not: 'not',
  ConditionType.stateValue: 'stateValue',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
