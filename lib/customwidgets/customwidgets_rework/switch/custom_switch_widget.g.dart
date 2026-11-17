// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_switch_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomSwitchWidget _$CustomSwitchWidgetFromJson(Map<String, dynamic> json) =>
    _CustomSwitchWidget(
      type:
          $enumDecodeNullable(_$WidgetTypeEnumMap, json['type']) ??
          WidgetType.switchWidget,
      id: json['id'] as String,
      name: json['name'] as String,
      dataPoint: json['dataPoint'] as String?,
      label: json['label'] as String?,
      sendIfOn: json['sendIfOn'] as String? ?? "true",
      sendIfOff: json['sendIfOff'] as String? ?? "false",
      customPopupmenu: json['customPopupmenu'] == null
          ? null
          : CustomPopupmenu.fromJson(
              json['customPopupmenu'] as Map<String, dynamic>,
            ),
      customTheme: json['customTheme'] == null
          ? null
          : WidgetTheme.fromJson(json['customTheme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomSwitchWidgetToJson(_CustomSwitchWidget instance) =>
    <String, dynamic>{
      'type': _$WidgetTypeEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'dataPoint': instance.dataPoint,
      'label': instance.label,
      'sendIfOn': instance.sendIfOn,
      'sendIfOff': instance.sendIfOff,
      'customPopupmenu': instance.customPopupmenu,
      'customTheme': instance.customTheme,
    };

const _$WidgetTypeEnumMap = {
  WidgetType.group: 'group',
  WidgetType.input: 'input',
  WidgetType.button: 'button',
  WidgetType.webViewNew: 'webViewNew',
  WidgetType.tableNew: 'tableNew',
  WidgetType.valueNew: 'valueNew',
  WidgetType.multiselection: 'multiselection',
  WidgetType.slider: 'slider',
  WidgetType.networkPlayer: 'networkPlayer',
  WidgetType.colorPicker: 'colorPicker',
  WidgetType.switchWidget: 'switchWidget',
  WidgetType.divisionLine: 'divisionLine',
};
