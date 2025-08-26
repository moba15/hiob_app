// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_value_widget_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomValueWidgetThemeImpl _$$CustomValueWidgetThemeImplFromJson(
  Map<String, dynamic> json,
) => _$CustomValueWidgetThemeImpl(
  json['id'] as String,
  LabelTheme.fromJson(json['labelTheme'] as Map<String, dynamic>),
  const MaterialColorConverter().fromJson(
    json['valueTextColor'] as Map<String, dynamic>?,
  ),
  (json['valueTextFonSize'] as num?)?.toDouble(),
  const FontWeightConverter().fromJson(
    (json['valueTextFontWeight'] as num?)?.toInt(),
  ),
);

Map<String, dynamic> _$$CustomValueWidgetThemeImplToJson(
  _$CustomValueWidgetThemeImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'labelTheme': instance.labelTheme,
  'valueTextColor': const MaterialColorConverter().toJson(
    instance.valueTextColor,
  ),
  'valueTextFonSize': instance.valueTextFonSize,
  'valueTextFontWeight': const FontWeightConverter().toJson(
    instance.valueTextFontWeight,
  ),
};
