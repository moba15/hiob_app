// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_multiselection_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomMultiselectionWidget _$CustomMultiselectionWidgetFromJson(
  Map<String, dynamic> json,
) => _CustomMultiselectionWidget(
  type:
      $enumDecodeNullable(_$WidgetTypeEnumMap, json['type']) ??
      WidgetType.multiselection,
  id: json['id'] as String,
  name: json['name'] as String,
  dataPoint: json['dataPoint'] as String?,
  label: json['label'] as String?,
  selections: Map<String, String>.from(json['selections'] as Map),
  dropdownMenuMode:
      $enumDecodeNullable(
        _$DropdownMenuModeEnumMap,
        json['dropdownMenuMode'],
      ) ??
      DropdownMenuMode.dropdown,
  customPopupmenu: json['customPopupmenu'] == null
      ? null
      : CustomPopupmenu.fromJson(
          json['customPopupmenu'] as Map<String, dynamic>,
        ),
  customTheme: json['customTheme'] == null
      ? null
      : WidgetTheme.fromJson(json['customTheme'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CustomMultiselectionWidgetToJson(
  _CustomMultiselectionWidget instance,
) => <String, dynamic>{
  'type': _$WidgetTypeEnumMap[instance.type]!,
  'id': instance.id,
  'name': instance.name,
  'dataPoint': instance.dataPoint,
  'label': instance.label,
  'selections': instance.selections,
  'dropdownMenuMode': _$DropdownMenuModeEnumMap[instance.dropdownMenuMode]!,
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

const _$DropdownMenuModeEnumMap = {
  DropdownMenuMode.dropdown: 'dropdown',
  DropdownMenuMode.dialog: 'dialog',
  DropdownMenuMode.bottomSheet: 'bottomSheet',
};
