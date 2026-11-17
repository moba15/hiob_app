// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WidgetTheme _$WidgetThemeFromJson(Map<String, dynamic> json) => _WidgetTheme(
  id: json['id'] as String,
  labelTheme: json['labelTheme'] == null
      ? null
      : LabelTheme.fromJson(json['labelTheme'] as Map<String, dynamic>),
  valueTheme: json['valueTheme'] == null
      ? null
      : LabelTheme.fromJson(json['valueTheme'] as Map<String, dynamic>),
  dividerTheme: const DividerThemeDataConverter().fromJson(
    json['dividerTheme'] as Map<String, dynamic>?,
  ),
  extras: json['extras'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$WidgetThemeToJson(_WidgetTheme instance) =>
    <String, dynamic>{
      'id': instance.id,
      'labelTheme': instance.labelTheme,
      'valueTheme': instance.valueTheme,
      'dividerTheme': const DividerThemeDataConverter().toJson(
        instance.dividerTheme,
      ),
      'extras': instance.extras,
    };
