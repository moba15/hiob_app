// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_value_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomValueWidgetImpl _$$CustomValueWidgetImplFromJson(
  Map<String, dynamic> json,
) => _$CustomValueWidgetImpl(
  type:
      $enumDecodeNullable(_$CustomWidgetTypeDeprecatedEnumMap, json['type']) ??
      CustomWidgetTypeDeprecated.valueNew,
  id: json['id'] as String,
  name: json['name'] as String,
  dataPoint: json['dataPoint'] as String?,
  label: json['label'] as String?,
  valueMapper:
      (json['valueMapper'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {},
  round: (json['round'] as num?)?.toInt() ?? 2,
  suffix: json['suffix'] as String?,
  prefix: json['prefix'] as String?,
  customPopupmenu: json['customPopupmenu'] == null
      ? null
      : CustomPopupmenu.fromJson(
          json['customPopupmenu'] as Map<String, dynamic>,
        ),
  customTheme: const _CustomValueThemeConverter().fromJson(
    json['customTheme'] as Map<String, dynamic>?,
  ),
);

Map<String, dynamic> _$$CustomValueWidgetImplToJson(
  _$CustomValueWidgetImpl instance,
) => <String, dynamic>{
  'type': _$CustomWidgetTypeDeprecatedEnumMap[instance.type]!,
  'id': instance.id,
  'name': instance.name,
  'dataPoint': instance.dataPoint,
  'label': instance.label,
  'valueMapper': instance.valueMapper,
  'round': instance.round,
  'suffix': instance.suffix,
  'prefix': instance.prefix,
  'customPopupmenu': instance.customPopupmenu,
  'customTheme': const _CustomValueThemeConverter().toJson(
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
