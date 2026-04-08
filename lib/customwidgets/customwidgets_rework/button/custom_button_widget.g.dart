// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_button_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomButtonWidget _$CustomButtonWidgetFromJson(Map<String, dynamic> json) =>
    _CustomButtonWidget(
      type:
          $enumDecodeNullable(
            _$CustomWidgetTypeDeprecatedEnumMap,
            json['type'],
          ) ??
          CustomWidgetTypeDeprecated.button,
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
      'type': _$CustomWidgetTypeDeprecatedEnumMap[instance.type]!,
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

const _$CustomWidgetTypeDeprecatedEnumMap = {
  CustomWidgetTypeDeprecated.group: 'group',
  CustomWidgetTypeDeprecated.alertDialog: 'alertDialog',
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
  CustomWidgetTypeDeprecated.line: 'line',
};
