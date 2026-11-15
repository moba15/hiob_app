// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_slider_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomSliderWidget _$CustomSliderWidgetFromJson(Map<String, dynamic> json) =>
    _CustomSliderWidget(
      type:
          $enumDecodeNullable(_$WidgetTypeEnumMap, json['type']) ??
          WidgetType.slider,
      id: json['id'] as String,
      name: json['name'] as String,
      label: json['label'] as String?,
      dataPoint: json['dataPoint'] as String?,
      max: (json['max'] as num?)?.toInt() ?? 100,
      min: (json['min'] as num?)?.toInt() ?? 0,
      step: (json['step'] as num?)?.toInt() ?? 10,
      customSliderWidgetUpdateStrategy:
          $enumDecodeNullable(
            _$CustomSliderWidgetUpdateStrategyEnumMap,
            json['customSliderWidgetUpdateStrategy'],
          ) ??
          CustomSliderWidgetUpdateStrategy.onFinish,
      customPopupmenu: json['customPopupmenu'] == null
          ? null
          : CustomPopupmenu.fromJson(
              json['customPopupmenu'] as Map<String, dynamic>,
            ),
      customTheme: const _CustomSliderThemeConverter().fromJson(
        json['customTheme'] as Map<String, dynamic>?,
      ),
    );

Map<String, dynamic> _$CustomSliderWidgetToJson(_CustomSliderWidget instance) =>
    <String, dynamic>{
      'type': _$WidgetTypeEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'label': instance.label,
      'dataPoint': instance.dataPoint,
      'max': instance.max,
      'min': instance.min,
      'step': instance.step,
      'customSliderWidgetUpdateStrategy':
          _$CustomSliderWidgetUpdateStrategyEnumMap[instance
              .customSliderWidgetUpdateStrategy],
      'customPopupmenu': instance.customPopupmenu,
      'customTheme': const _CustomSliderThemeConverter().toJson(
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

const _$CustomSliderWidgetUpdateStrategyEnumMap = {
  CustomSliderWidgetUpdateStrategy.onFinish: 'onFinish',
  CustomSliderWidgetUpdateStrategy.onChange: 'onChange',
};
