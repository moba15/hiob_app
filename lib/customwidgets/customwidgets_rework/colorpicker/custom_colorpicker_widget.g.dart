// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_colorpicker_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomColorPickerWidget _$CustomColorPickerWidgetFromJson(
  Map<String, dynamic> json,
) => _CustomColorPickerWidget(
  type:
      $enumDecodeNullable(_$WidgetTypeEnumMap, json['type']) ??
      WidgetType.colorPicker,
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
  customTheme: json['customTheme'] == null
      ? null
      : WidgetTheme.fromJson(json['customTheme'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CustomColorPickerWidgetToJson(
  _CustomColorPickerWidget instance,
) => <String, dynamic>{
  'type': _$WidgetTypeEnumMap[instance.type]!,
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

const _$ColorPickerTypeEnumMap = {
  ColorPickerType.both: 'both',
  ColorPickerType.primary: 'primary',
  ColorPickerType.accent: 'accent',
  ColorPickerType.bw: 'bw',
  ColorPickerType.custom: 'custom',
  ColorPickerType.customSecondary: 'customSecondary',
  ColorPickerType.wheel: 'wheel',
};
