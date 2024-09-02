// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_input_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomInputWidgetImpl _$$CustomInputWidgetImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomInputWidgetImpl(
      type: $enumDecodeNullable(
              _$CustomWidgetTypeDeprecatedEnumMap, json['type']) ??
          CustomWidgetTypeDeprecated.input,
      id: json['id'] as String,
      name: json['name'] as String,
      label: json['label'] as String?,
      dataPoint: _$JsonConverterFromJson<String, DataPoint?>(
          json['dataPoint'], const DataPointIdConverter().fromJson),
      hintText: json['hintText'] as String?,
      suffix: json['suffix'] as String?,
      customPopupmenu: json['customPopupmenu'] == null
          ? null
          : CustomPopupmenu.fromJson(
              json['customPopupmenu'] as Map<String, dynamic>),
      customInputSendMethod: $enumDecodeNullable(
          _$CustomInputSendMethodEnumMap, json['customInputSendMethod']),
      customInputDisplayConentType: $enumDecodeNullable(
          _$CustomInputDisplayConentTypeEnumMap,
          json['customInputDisplayConentType']),
    );

Map<String, dynamic> _$$CustomInputWidgetImplToJson(
        _$CustomInputWidgetImpl instance) =>
    <String, dynamic>{
      'type': _$CustomWidgetTypeDeprecatedEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'label': instance.label,
      'dataPoint': const DataPointIdConverter().toJson(instance.dataPoint),
      'hintText': instance.hintText,
      'suffix': instance.suffix,
      'customPopupmenu': instance.customPopupmenu,
      'customInputSendMethod':
          _$CustomInputSendMethodEnumMap[instance.customInputSendMethod],
      'customInputDisplayConentType': _$CustomInputDisplayConentTypeEnumMap[
          instance.customInputDisplayConentType],
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
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$CustomInputSendMethodEnumMap = {
  CustomInputSendMethod.onChanged: 'onChanged',
  CustomInputSendMethod.onSubmitted: 'onSubmitted',
};

const _$CustomInputDisplayConentTypeEnumMap = {
  CustomInputDisplayConentType.noShow: 'noShow',
  CustomInputDisplayConentType.value: 'value',
  CustomInputDisplayConentType.hintText: 'hintText',
  CustomInputDisplayConentType.labelText: 'labelText',
};
