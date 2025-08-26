// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_switch_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomSwitchWidget _$CustomSwitchWidgetFromJson(Map<String, dynamic> json) =>
    _CustomSwitchWidget(
      type:
          $enumDecodeNullable(
            _$CustomWidgetTypeDeprecatedEnumMap,
            json['type'],
          ) ??
          CustomWidgetTypeDeprecated.switchWidget,
      id: json['id'] as String,
      name: json['name'] as String,
      dataPoint: json['dataPoint'] as String?,
      label: json['label'] as String?,
      sendIfOn: json['sendIfOn'] as String? ?? "true",
      sendIfOff: json['sendIfOff'] as String? ?? "false",
      customPopupmenu: json['customPopupmenu'] == null
          ? null
          : CustomPopupmenu.fromJson(
              json['customPopupmenu'] as Map<String, dynamic>,
            ),
      customTheme: const _CustomSwitchThemeConverter().fromJson(
        json['customTheme'] as Map<String, dynamic>?,
      ),
    );

Map<String, dynamic> _$CustomSwitchWidgetToJson(_CustomSwitchWidget instance) =>
    <String, dynamic>{
      'type': _$CustomWidgetTypeDeprecatedEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'dataPoint': instance.dataPoint,
      'label': instance.label,
      'sendIfOn': instance.sendIfOn,
      'sendIfOff': instance.sendIfOff,
      'customPopupmenu': instance.customPopupmenu,
      'customTheme': const _CustomSwitchThemeConverter().toJson(
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
