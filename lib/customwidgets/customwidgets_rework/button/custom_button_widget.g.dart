// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_button_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomButtonWidget _$CustomButtonWidgetFromJson(Map<String, dynamic> json) =>
    _CustomButtonWidget(
      type:
          $enumDecodeNullable(_$WidgetTypeEnumMap, json['type']) ??
          WidgetType.button,
      id: json['id'] as String,
      name: json['name'] as String,
      customPopupmenu: json['customPopupmenu'] == null
          ? null
          : CustomPopupmenu.fromJson(
              json['customPopupmenu'] as Map<String, dynamic>,
            ),
      customTheme: const _CustomButtonThemeConverter().fromJson(
        json['customTheme'] as Map<String, dynamic>?,
      ),
      label: json['label'] as String?,
      dataPoint: json['dataPoint'] as String?,
      buttonLabel: json['buttonLabel'] as String?,
    );

Map<String, dynamic> _$CustomButtonWidgetToJson(_CustomButtonWidget instance) =>
    <String, dynamic>{
      'type': _$WidgetTypeEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'customPopupmenu': instance.customPopupmenu,
      'customTheme': const _CustomButtonThemeConverter().toJson(
        instance.customTheme,
      ),
      'label': instance.label,
      'dataPoint': instance.dataPoint,
      'buttonLabel': instance.buttonLabel,
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
