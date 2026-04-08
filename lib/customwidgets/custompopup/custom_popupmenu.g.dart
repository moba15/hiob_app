// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_popupmenu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomPopupmenu _$CustomPopupmenuFromJson(Map<String, dynamic> json) =>
    _CustomPopupmenu(
      customWidgets: (json['customWidgets'] as List<dynamic>)
          .map(
            (e) => const CustomWidgetConverter().fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );

Map<String, dynamic> _$CustomPopupmenuToJson(_CustomPopupmenu instance) =>
    <String, dynamic>{
      'customWidgets': instance.customWidgets
          .map(const CustomWidgetConverter().toJson)
          .toList(),
    };
