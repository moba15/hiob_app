// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_value_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomValueWidget _$CustomValueWidgetFromJson(Map<String, dynamic> json) =>
    _CustomValueWidget(
      type:
          $enumDecodeNullable(_$WidgetTypeEnumMap, json['type']) ??
          WidgetType.valueNew,
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

Map<String, dynamic> _$CustomValueWidgetToJson(_CustomValueWidget instance) =>
    <String, dynamic>{
      'type': _$WidgetTypeEnumMap[instance.type]!,
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
