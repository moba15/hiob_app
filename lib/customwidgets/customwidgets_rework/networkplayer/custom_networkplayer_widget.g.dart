// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_networkplayer_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomNetworkPlayerWidgetImpl _$$CustomNetworkPlayerWidgetImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomNetworkPlayerWidgetImpl(
      type: $enumDecodeNullable(
              _$CustomWidgetTypeDeprecatedEnumMap, json['type']) ??
          CustomWidgetTypeDeprecated.webViewNew,
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['url'] as String?,
      height: (json['height'] as num?)?.toInt() ?? 16,
      width: (json['width'] as num?)?.toInt() ?? 9,
      customPopupmenu: json['customPopupmenu'] == null
          ? null
          : CustomPopupmenu.fromJson(
              json['customPopupmenu'] as Map<String, dynamic>),
      customTheme: json['customTheme'] == null
          ? null
          : CustomThemeForWidget.fromJson(
              json['customTheme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomNetworkPlayerWidgetImplToJson(
        _$CustomNetworkPlayerWidgetImpl instance) =>
    <String, dynamic>{
      'type': _$CustomWidgetTypeDeprecatedEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'height': instance.height,
      'width': instance.width,
      'customPopupmenu': instance.customPopupmenu,
      'customTheme': instance.customTheme,
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
