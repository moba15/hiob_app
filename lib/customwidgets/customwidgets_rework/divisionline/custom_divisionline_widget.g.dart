// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_divisionline_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomDivisionlineWidget _$CustomDivisionlineWidgetFromJson(
  Map<String, dynamic> json,
) => _CustomDivisionlineWidget(
  type:
      $enumDecodeNullable(_$WidgetTypeEnumMap, json['type']) ??
      WidgetType.divisionLine,
  id: json['id'] as String,
  name: json['name'] as String,
  thickness: json['thickness'] ?? 1,
  customPopupmenu: json['customPopupmenu'] == null
      ? null
      : CustomPopupmenu.fromJson(
          json['customPopupmenu'] as Map<String, dynamic>,
        ),
  customTheme: json['customTheme'] == null
      ? null
      : WidgetTheme.fromJson(json['customTheme'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CustomDivisionlineWidgetToJson(
  _CustomDivisionlineWidget instance,
) => <String, dynamic>{
  'type': _$WidgetTypeEnumMap[instance.type]!,
  'id': instance.id,
  'name': instance.name,
  'thickness': instance.thickness,
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
