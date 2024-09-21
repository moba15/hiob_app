// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_colorpicker_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomColorPickerWidgetImpl _$$CustomColorPickerWidgetImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomColorPickerWidgetImpl(
      type: $enumDecodeNullable(
              _$CustomWidgetTypeDeprecatedEnumMap, json['type']) ??
          CustomWidgetTypeDeprecated.colorPicker,
      id: json['id'] as String,
      name: json['name'] as String,
      dataPoint: _$JsonConverterFromJson<String, DataPoint?>(
          json['dataPoint'], const DataPointIdConverter().fromJson),
      label: json['label'] as String?,
      prefix: json['prefix'] as String? ?? "0x",
      alpha: json['alpha'] ?? false,
      shadesSelection: json['shadesSelection'] ?? true,
      pickersEnabled: (json['pickersEnabled'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry($enumDecode(_$ColorPickerTypeEnumMap, k), e as bool),
          ) ??
          const {},
      customPopupmenu: json['customPopupmenu'] == null
          ? null
          : CustomPopupmenu.fromJson(
              json['customPopupmenu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomColorPickerWidgetImplToJson(
        _$CustomColorPickerWidgetImpl instance) =>
    <String, dynamic>{
      'type': _$CustomWidgetTypeDeprecatedEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'dataPoint': const DataPointIdConverter().toJson(instance.dataPoint),
      'label': instance.label,
      'prefix': instance.prefix,
      'alpha': instance.alpha,
      'shadesSelection': instance.shadesSelection,
      'pickersEnabled': instance.pickersEnabled
          .map((k, e) => MapEntry(_$ColorPickerTypeEnumMap[k]!, e)),
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
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$ColorPickerTypeEnumMap = {
  ColorPickerType.both: 'both',
  ColorPickerType.primary: 'primary',
  ColorPickerType.accent: 'accent',
  ColorPickerType.bw: 'bw',
  ColorPickerType.custom: 'custom',
  ColorPickerType.customSecondary: 'customSecondary',
  ColorPickerType.wheel: 'wheel',
};
