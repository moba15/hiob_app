// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_webview_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomWebViewWidget _$CustomWebViewWidgetFromJson(Map<String, dynamic> json) =>
    _CustomWebViewWidget(
      type:
          $enumDecodeNullable(_$WidgetTypeEnumMap, json['type']) ??
          WidgetType.webViewNew,
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as bool? ?? false,
      enabledZoom: json['enabledZoom'] as bool? ?? false,
      enableInlineScroll: json['enableInlineScroll'] as bool? ?? false,
      dataPoint: json['dataPoint'] as String?,
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

Map<String, dynamic> _$CustomWebViewWidgetToJson(
  _CustomWebViewWidget instance,
) => <String, dynamic>{
  'type': _$WidgetTypeEnumMap[instance.type]!,
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'enabledZoom': instance.enabledZoom,
  'enableInlineScroll': instance.enableInlineScroll,
  'dataPoint': instance.dataPoint,
  'url': instance.url,
  'height': instance.height,
  'customPopupmenu': instance.customPopupmenu,
  'customTheme': instance.customTheme,
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
