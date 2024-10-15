// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_and_condtion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomAndCondtionImpl _$$CustomAndCondtionImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomAndCondtionImpl(
      type: $enumDecode(_$ConditionTypeEnumMap, json['type']),
      conditions: (json['conditions'] as List<dynamic>)
          .map((e) => CustomCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomAndCondtionImplToJson(
        _$CustomAndCondtionImpl instance) =>
    <String, dynamic>{
      'type': _$ConditionTypeEnumMap[instance.type]!,
      'conditions': instance.conditions,
    };

const _$ConditionTypeEnumMap = {
  ConditionType.and: 'and',
  ConditionType.or: 'or',
  ConditionType.not: 'not',
  ConditionType.stateValue: 'stateValue',
};
