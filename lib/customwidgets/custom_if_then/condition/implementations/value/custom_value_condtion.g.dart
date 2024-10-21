// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_value_condtion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomValueCondtionImpl _$$CustomValueCondtionImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomValueCondtionImpl(
      type: $enumDecode(_$ConditionTypeEnumMap, json['type']),
      datapoint: _$JsonConverterFromJson<String, DataPoint?>(
          json['datapoint'], const DataPointIdConverter().fromJson),
      value: json['value'],
      valueConditionType:
          $enumDecode(_$ValueConditionTypeEnumMap, json['valueConditionType']),
    );

Map<String, dynamic> _$$CustomValueCondtionImplToJson(
        _$CustomValueCondtionImpl instance) =>
    <String, dynamic>{
      'type': _$ConditionTypeEnumMap[instance.type]!,
      'datapoint': const DataPointIdConverter().toJson(instance.datapoint),
      'value': instance.value,
      'valueConditionType':
          _$ValueConditionTypeEnumMap[instance.valueConditionType]!,
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

const _$ValueConditionTypeEnumMap = {
  ValueConditionType.equal: 'equal',
  ValueConditionType.equalIgnoreCase: 'equalIgnoreCase',
  ValueConditionType.startWith: 'startWith',
  ValueConditionType.endsWith: 'endsWith',
  ValueConditionType.contains: 'contains',
};
