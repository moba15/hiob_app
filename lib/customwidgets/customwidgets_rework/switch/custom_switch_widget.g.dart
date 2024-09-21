// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_switch_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomSwitchWidgetImpl _$$CustomSwitchWidgetImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomSwitchWidgetImpl(
      type: $enumDecodeNullable(
              _$CustomWidgetTypeDeprecatedEnumMap, json['type']) ??
          CustomWidgetTypeDeprecated.switchWidget,
      id: json['id'] as String,
      name: json['name'] as String,
      dataPoint: _$JsonConverterFromJson<String, DataPoint?>(
          json['dataPoint'], const DataPointIdConverter().fromJson),
      label: json['label'] as String?,
      valueMapper: (json['valueMapper'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      customPopupmenu: json['customPopupmenu'] == null
          ? null
          : CustomPopupmenu.fromJson(
              json['customPopupmenu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomSwitchWidgetImplToJson(
        _$CustomSwitchWidgetImpl instance) =>
    <String, dynamic>{
      'type': _$CustomWidgetTypeDeprecatedEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'dataPoint': const DataPointIdConverter().toJson(instance.dataPoint),
      'label': instance.label,
      'valueMapper': instance.valueMapper,
      'customPopupmenu': instance.customPopupmenu,
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
  CustomWidgetTypeDeprecated.switchWidget: 'switchWidget',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
