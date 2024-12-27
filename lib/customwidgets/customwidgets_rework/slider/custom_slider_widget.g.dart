// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_slider_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomSliderWidgetImpl _$$CustomSliderWidgetImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomSliderWidgetImpl(
      type: $enumDecodeNullable(
              _$CustomWidgetTypeDeprecatedEnumMap, json['type']) ??
          CustomWidgetTypeDeprecated.slider,
      id: json['id'] as String,
      name: json['name'] as String,
      label: json['label'] as String?,
      dataPoint: _$JsonConverterFromJson<String, DataPoint?>(
          json['dataPoint'], const DataPointIdConverter().fromJson),
      max: (json['max'] as num?)?.toInt() ?? 100,
      min: (json['min'] as num?)?.toInt() ?? 0,
      step: (json['step'] as num?)?.toInt() ?? 10,
      customSliderWidgetUpdateStrategy: $enumDecodeNullable(
              _$CustomSliderWidgetUpdateStrategyEnumMap,
              json['customSliderWidgetUpdateStrategy']) ??
          CustomSliderWidgetUpdateStrategy.onFinish,
      customPopupmenu: json['customPopupmenu'] == null
          ? null
          : CustomPopupmenu.fromJson(
              json['customPopupmenu'] as Map<String, dynamic>),
      customTheme: const _CustomSliderThemeConverter()
          .fromJson(json['customTheme'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$CustomSliderWidgetImplToJson(
        _$CustomSliderWidgetImpl instance) =>
    <String, dynamic>{
      'type': _$CustomWidgetTypeDeprecatedEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'label': instance.label,
      'dataPoint': const DataPointIdConverter().toJson(instance.dataPoint),
      'max': instance.max,
      'min': instance.min,
      'step': instance.step,
      'customSliderWidgetUpdateStrategy':
          _$CustomSliderWidgetUpdateStrategyEnumMap[
              instance.customSliderWidgetUpdateStrategy],
      'customPopupmenu': instance.customPopupmenu,
      'customTheme':
          const _CustomSliderThemeConverter().toJson(instance.customTheme),
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

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$CustomSliderWidgetUpdateStrategyEnumMap = {
  CustomSliderWidgetUpdateStrategy.onFinish: 'onFinish',
  CustomSliderWidgetUpdateStrategy.onChange: 'onChange',
};
