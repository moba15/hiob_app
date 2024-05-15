// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cutsom_value_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomValueWidgetImpl _$$CustomValueWidgetImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomValueWidgetImpl(
      id: json['id'] as String,
      type: $enumDecode(_$CustomWidgetTypeEnumMap, json['type']),
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      dataPoint: _$JsonConverterFromJson<String, DataPoint?>(
          json['dataPoint'], const DataPointIdConverter().fromJson),
    );

Map<String, dynamic> _$$CustomValueWidgetImplToJson(
        _$CustomValueWidgetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$CustomWidgetTypeEnumMap[instance.type]!,
      'name': instance.name,
      'displayName': instance.displayName,
      'dataPoint': const DataPointIdConverter().toJson(instance.dataPoint),
    };

const _$CustomWidgetTypeEnumMap = {
  CustomWidgetType.simpleSwitch: 'simpleSwitch',
  CustomWidgetType.simpleValue: 'simpleValue',
  CustomWidgetType.advanced: 'advanced',
  CustomWidgetType.light: 'light',
  CustomWidgetType.group: 'group',
  CustomWidgetType.line: 'line',
  CustomWidgetType.webView: 'webView',
  CustomWidgetType.alertDialog: 'alertDialog',
  CustomWidgetType.table: 'table',
  CustomWidgetType.graph: 'graph',
  CustomWidgetType.colorPallete: 'colorPallete',
  CustomWidgetType.mediaPlayer: 'mediaPlayer',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
