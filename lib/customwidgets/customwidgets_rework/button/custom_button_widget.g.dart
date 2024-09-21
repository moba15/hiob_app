// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_button_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomButtonWidgetImpl _$$CustomButtonWidgetImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomButtonWidgetImpl(
      type: $enumDecodeNullable(
              _$CustomWidgetTypeDeprecatedEnumMap, json['type']) ??
          CustomWidgetTypeDeprecated.button,
      id: json['id'] as String,
      name: json['name'] as String,
      customPopupmenu: json['customPopupmenu'] == null
          ? null
          : CustomPopupmenu.fromJson(
              json['customPopupmenu'] as Map<String, dynamic>),
      label: json['label'] as String?,
      dataPoint: _$JsonConverterFromJson<String, DataPoint?>(
          json['dataPoint'], const DataPointIdConverter().fromJson),
      buttonLabel: json['buttonLabel'] as String?,
    );

Map<String, dynamic> _$$CustomButtonWidgetImplToJson(
        _$CustomButtonWidgetImpl instance) =>
    <String, dynamic>{
      'type': _$CustomWidgetTypeDeprecatedEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'customPopupmenu': instance.customPopupmenu,
      'label': instance.label,
      'dataPoint': const DataPointIdConverter().toJson(instance.dataPoint),
      'buttonLabel': instance.buttonLabel,
    };

const _$CustomWidgetTypeDeprecatedEnumMap = {
  CustomWidgetTypeDeprecated.simpleSwitch: 'simpleSwitch',
  CustomWidgetTypeDeprecated.simpleValue: 'simpleValue',
  CustomWidgetTypeDeprecated.advanced: 'advanced',
  CustomWidgetTypeDeprecated.light: 'light',
  CustomWidgetTypeDeprecated.group: 'group',
  CustomWidgetTypeDeprecated.line: 'line',
  CustomWidgetTypeDeprecated.webView: 'webView',
  CustomWidgetTypeDeprecated.alertDialog: 'alertDialog',
  CustomWidgetTypeDeprecated.table: 'table',
  CustomWidgetTypeDeprecated.graph: 'graph',
  CustomWidgetTypeDeprecated.colorPallete: 'colorPallete',
  CustomWidgetTypeDeprecated.mediaPlayer: 'mediaPlayer',
  CustomWidgetTypeDeprecated.input: 'input',
  CustomWidgetTypeDeprecated.button: 'button',
  CustomWidgetTypeDeprecated.webViewNew: 'webViewNew',
  CustomWidgetTypeDeprecated.tableNew: 'tableNew',
  CustomWidgetTypeDeprecated.valueNew: 'valueNew',
  CustomWidgetTypeDeprecated.multiselection: 'multiselection',
  CustomWidgetTypeDeprecated.slider: 'slider',
  CustomWidgetTypeDeprecated.networkPlayer: 'networkPlayer',
  CustomWidgetTypeDeprecated.colorPicker: 'colorPicker',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
