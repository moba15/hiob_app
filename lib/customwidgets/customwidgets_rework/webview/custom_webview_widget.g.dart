// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_webview_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomWebViewWidgetImpl _$$CustomWebViewWidgetImplFromJson(
  Map<String, dynamic> json,
) => _$CustomWebViewWidgetImpl(
  type:
      $enumDecodeNullable(_$CustomWidgetTypeDeprecatedEnumMap, json['type']) ??
      CustomWidgetTypeDeprecated.webViewNew,
  id: json['id'] as String,
  name: json['name'] as String,
<<<<<<< HEAD
  dataPoint: json['dataPoint'] as String?,
=======
  image: json['image'] as bool? ?? false,
  enabledZoom: json['enabledZoom'] as bool? ?? false,
  enableInlineScroll: json['enableInlineScroll'] as bool? ?? false,
  dataPoint: _$JsonConverterFromJson<String, DataPoint?>(
    json['dataPoint'],
    const DataPointIdConverter().fromJson,
  ),
>>>>>>> development
  url: json['url'] as String?,
  height: (json['height'] as num?)?.toInt() ?? 500,
  customPopupmenu: json['customPopupmenu'] == null
      ? null
      : CustomPopupmenu.fromJson(
          json['customPopupmenu'] as Map<String, dynamic>,
        ),
  customTheme: json['customTheme'] == null
      ? null
      : CustomThemeForWidget.fromJson(
          json['customTheme'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$CustomWebViewWidgetImplToJson(
  _$CustomWebViewWidgetImpl instance,
) => <String, dynamic>{
  'type': _$CustomWidgetTypeDeprecatedEnumMap[instance.type]!,
  'id': instance.id,
  'name': instance.name,
<<<<<<< HEAD
  'dataPoint': instance.dataPoint,
=======
  'image': instance.image,
  'enabledZoom': instance.enabledZoom,
  'enableInlineScroll': instance.enableInlineScroll,
  'dataPoint': const DataPointIdConverter().toJson(instance.dataPoint),
>>>>>>> development
  'url': instance.url,
  'height': instance.height,
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
