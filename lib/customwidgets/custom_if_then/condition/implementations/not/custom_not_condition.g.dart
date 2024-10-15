// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_not_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomNotCondtionImpl _$$CustomNotCondtionImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomNotCondtionImpl(
      type: $enumDecode(_$ConditionTypeEnumMap, json['type']),
      condition:
          CustomCondition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomNotCondtionImplToJson(
        _$CustomNotCondtionImpl instance) =>
    <String, dynamic>{
      'type': _$ConditionTypeEnumMap[instance.type]!,
      'condition': instance.condition,
    };

const _$ConditionTypeEnumMap = {
  ConditionType.and: 'and',
  ConditionType.or: 'or',
  ConditionType.not: 'not',
  ConditionType.stateValue: 'stateValue',
};
