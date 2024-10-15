// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_if_then.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomActionImpl _$$CustomActionImplFromJson(Map<String, dynamic> json) =>
    _$CustomActionImpl(
      customCondition: json['customCondition'] == null
          ? null
          : CustomCondition.fromJson(
              json['customCondition'] as Map<String, dynamic>),
      customActions: (json['customActions'] as List<dynamic>?)
          ?.map((e) => CustomAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomActionImplToJson(_$CustomActionImpl instance) =>
    <String, dynamic>{
      'customCondition': instance.customCondition,
      'customActions': instance.customActions,
    };
