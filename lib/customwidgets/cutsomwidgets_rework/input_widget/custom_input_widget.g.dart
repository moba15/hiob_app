// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_input_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomInputWidgetImpl _$$CustomInputWidgetImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomInputWidgetImpl(
      id: json['id'] as String,
      type: $enumDecode(_$CustomWidgetTypeEnumMap, json['type']),
      name: json['name'] as String,
      hintText: json['hintText'] as String,
      dataPoint: _$JsonConverterFromJson<String, DataPoint?>(
          json['dataPoint'], const DataPointIdConverter().fromJson),
      suffix: json['suffix'] as String?,
    );

Map<String, dynamic> _$$CustomInputWidgetImplToJson(
        _$CustomInputWidgetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$CustomWidgetTypeEnumMap[instance.type]!,
      'name': instance.name,
      'hintText': instance.hintText,
      'dataPoint': const DataPointIdConverter().toJson(instance.dataPoint),
      'suffix': instance.suffix,
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
