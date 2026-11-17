// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_networkplayer_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomNetworkPlayerWidget _$CustomNetworkPlayerWidgetFromJson(
  Map<String, dynamic> json,
) => _CustomNetworkPlayerWidget(
  id: json['id'] as String,
  name: json['name'] as String,
  url: json['url'] as String?,
  height: (json['height'] as num?)?.toInt() ?? 9,
  width: (json['width'] as num?)?.toInt() ?? 16,
  customPopupmenu: json['customPopupmenu'] == null
      ? null
      : CustomPopupmenu.fromJson(
          json['customPopupmenu'] as Map<String, dynamic>,
        ),
  customTheme: json['customTheme'] == null
      ? null
      : WidgetTheme.fromJson(json['customTheme'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CustomNetworkPlayerWidgetToJson(
  _CustomNetworkPlayerWidget instance,
) => <String, dynamic>{
  'type': _$WidgetTypeEnumMap[instance.type]!,
  'id': instance.id,
  'name': instance.name,
  'url': instance.url,
  'height': instance.height,
  'width': instance.width,
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
