// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_input_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomInputWidget _$CustomInputWidgetFromJson(Map<String, dynamic> json) =>
    _CustomInputWidget(
      type:
          $enumDecodeNullable(_$WidgetTypeEnumMap, json['type']) ??
          WidgetType.input,
      id: json['id'] as String,
      name: json['name'] as String,
      label: json['label'] as String?,
      dataPoint: json['dataPoint'] as String?,
      hintText: json['hintText'] as String?,
      suffix: json['suffix'] as String?,
      customPopupmenu: json['customPopupmenu'] == null
          ? null
          : CustomPopupmenu.fromJson(
              json['customPopupmenu'] as Map<String, dynamic>,
            ),
      customTheme: json['customTheme'] == null
          ? null
          : WidgetTheme.fromJson(json['customTheme'] as Map<String, dynamic>),
      customInputSendMethod: $enumDecodeNullable(
        _$CustomInputSendMethodEnumMap,
        json['customInputSendMethod'],
      ),
      customInputDisplayConentType: $enumDecodeNullable(
        _$CustomInputDisplayConentTypeEnumMap,
        json['customInputDisplayConentType'],
      ),
      fullSize: json['fullSize'] as bool? ?? false,
    );

Map<String, dynamic> _$CustomInputWidgetToJson(_CustomInputWidget instance) =>
    <String, dynamic>{
      'type': _$WidgetTypeEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'label': instance.label,
      'dataPoint': instance.dataPoint,
      'hintText': instance.hintText,
      'suffix': instance.suffix,
      'customPopupmenu': instance.customPopupmenu,
      'customTheme': instance.customTheme,
      'customInputSendMethod':
          _$CustomInputSendMethodEnumMap[instance.customInputSendMethod],
      'customInputDisplayConentType':
          _$CustomInputDisplayConentTypeEnumMap[instance
              .customInputDisplayConentType],
      'fullSize': instance.fullSize,
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

const _$CustomInputSendMethodEnumMap = {
  CustomInputSendMethod.onSubmitted: 'onSubmitted',
};

const _$CustomInputDisplayConentTypeEnumMap = {
  CustomInputDisplayConentType.noShow: 'noShow',
  CustomInputDisplayConentType.value: 'value',
  CustomInputDisplayConentType.hintText: 'hintText',
};
