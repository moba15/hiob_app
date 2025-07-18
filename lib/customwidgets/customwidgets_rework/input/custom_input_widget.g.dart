// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_input_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomInputWidgetImpl _$$CustomInputWidgetImplFromJson(
  Map<String, dynamic> json,
) => _$CustomInputWidgetImpl(
  type:
      $enumDecodeNullable(_$CustomWidgetTypeDeprecatedEnumMap, json['type']) ??
      CustomWidgetTypeDeprecated.input,
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
  customTheme: const _CustomInputThemeConverter().fromJson(
    json['customTheme'] as Map<String, dynamic>?,
  ),
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

Map<String, dynamic> _$$CustomInputWidgetImplToJson(
  _$CustomInputWidgetImpl instance,
) => <String, dynamic>{
  'type': _$CustomWidgetTypeDeprecatedEnumMap[instance.type]!,
  'id': instance.id,
  'name': instance.name,
  'label': instance.label,
  'dataPoint': instance.dataPoint,
  'hintText': instance.hintText,
  'suffix': instance.suffix,
  'customPopupmenu': instance.customPopupmenu,
  'customTheme': const _CustomInputThemeConverter().toJson(
    instance.customTheme,
  ),
  'customInputSendMethod':
      _$CustomInputSendMethodEnumMap[instance.customInputSendMethod],
  'customInputDisplayConentType':
      _$CustomInputDisplayConentTypeEnumMap[instance
          .customInputDisplayConentType],
  'fullSize': instance.fullSize,
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

const _$CustomInputSendMethodEnumMap = {
  CustomInputSendMethod.onSubmitted: 'onSubmitted',
};

const _$CustomInputDisplayConentTypeEnumMap = {
  CustomInputDisplayConentType.noShow: 'noShow',
  CustomInputDisplayConentType.value: 'value',
  CustomInputDisplayConentType.hintText: 'hintText',
};
