// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_multiselection_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomMultiselectionWidget _$CustomMultiselectionWidgetFromJson(
  Map<String, dynamic> json,
) => _CustomMultiselectionWidget(
  type:
      $enumDecodeNullable(_$CustomWidgetTypeDeprecatedEnumMap, json['type']) ??
      CustomWidgetTypeDeprecated.multiselection,
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
  customTheme: const _CustomMultiselectionThemeConverter().fromJson(
    json['customTheme'] as Map<String, dynamic>?,
  ),
);

Map<String, dynamic> _$CustomMultiselectionWidgetToJson(
  _CustomMultiselectionWidget instance,
) => <String, dynamic>{
  'type': _$CustomWidgetTypeDeprecatedEnumMap[instance.type]!,
  'id': instance.id,
  'name': instance.name,
  'dataPoint': instance.dataPoint,
  'label': instance.label,
  'selections': instance.selections,
  'dropdownMenuMode': _$DropdownMenuModeEnumMap[instance.dropdownMenuMode]!,
  'customPopupmenu': instance.customPopupmenu,
  'customTheme': const _CustomMultiselectionThemeConverter().toJson(
    instance.customTheme,
  ),
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
  CustomWidgetTypeDeprecated.divisionLine: 'divisionLine',
};

const _$DropdownMenuModeEnumMap = {
  DropdownMenuMode.bottomSheet: 'bottomSheet',
  DropdownMenuMode.dropdown: 'dropdown',
};
