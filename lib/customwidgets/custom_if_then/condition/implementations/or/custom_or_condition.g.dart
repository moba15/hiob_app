// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_or_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomOrCondtionImpl _$$CustomOrCondtionImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomOrCondtionImpl(
      type: $enumDecode(_$ConditionTypeEnumMap, json['type']),
      conditions: (json['conditions'] as List<dynamic>)
          .map((e) => CustomCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomOrCondtionImplToJson(
        _$CustomOrCondtionImpl instance) =>
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
