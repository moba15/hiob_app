// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_popupmenu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomPopupmenuImpl _$$CustomPopupmenuImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomPopupmenuImpl(
      customWidgets: (json['customWidgets'] as List<dynamic>)
          .map((e) =>
              const CustomWidgetConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomPopupmenuImplToJson(
        _$CustomPopupmenuImpl instance) =>
    <String, dynamic>{
      'customWidgets': instance.customWidgets
          .map(const CustomWidgetConverter().toJson)
          .toList(),
    };
