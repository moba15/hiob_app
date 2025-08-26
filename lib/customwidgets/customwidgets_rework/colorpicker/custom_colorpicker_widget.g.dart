// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_colorpicker_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomColorPickerWidget _$CustomColorPickerWidgetFromJson(
  Map<String, dynamic> json,
) => _CustomColorPickerWidget(
  type:
      $enumDecodeNullable(_$CustomWidgetTypeDeprecatedEnumMap, json['type']) ??
      CustomWidgetTypeDeprecated.colorPicker,
  id: json['id'] as String,
  name: json['name'] as String,
  dataPoint: json['dataPoint'] as String?,
  label: json['label'] as String?,
  prefix: json['prefix'] as String? ?? "0x",
  alpha: json['alpha'] ?? false,
  shadesSelection: json['shadesSelection'] ?? true,
  pickersEnabled:
      (json['pickersEnabled'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry($enumDecode(_$ColorPickerTypeEnumMap, k), e as bool),
      ) ??
      const {},
  customPopupmenu: json['customPopupmenu'] == null
      ? null
      : CustomPopupmenu.fromJson(
          json['customPopupmenu'] as Map<String, dynamic>,
        ),
  customTheme: const _CustomColorpickerThemeConverter().fromJson(
    json['customTheme'] as Map<String, dynamic>?,
  ),
);

Map<String, dynamic> _$CustomColorPickerWidgetToJson(
  _CustomColorPickerWidget instance,
) => <String, dynamic>{
  'type': _$CustomWidgetTypeDeprecatedEnumMap[instance.type]!,
  'id': instance.id,
  'name': instance.name,
  'dataPoint': instance.dataPoint,
  'label': instance.label,
  'prefix': instance.prefix,
  'alpha': instance.alpha,
  'shadesSelection': instance.shadesSelection,
  'pickersEnabled': instance.pickersEnabled.map(
    (k, e) => MapEntry(_$ColorPickerTypeEnumMap[k]!, e),
  ),
  'customPopupmenu': instance.customPopupmenu,
  'customTheme': const _CustomColorpickerThemeConverter().toJson(
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

const _$ColorPickerTypeEnumMap = {
  ColorPickerType.both: 'both',
  ColorPickerType.primary: 'primary',
  ColorPickerType.accent: 'accent',
  ColorPickerType.bw: 'bw',
  ColorPickerType.custom: 'custom',
  ColorPickerType.customSecondary: 'customSecondary',
  ColorPickerType.wheel: 'wheel',
};
