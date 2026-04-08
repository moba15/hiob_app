// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_label_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LabelTheme _$LabelThemeFromJson(Map<String, dynamic> json) => _LabelTheme(
  json['id'] as String,
  const MaterialColorConverter().fromJson(
    json['labelColor'] as Map<String, dynamic>?,
  ),
  (json['labelFonSize'] as num?)?.toDouble(),
  const FontWeightConverter().fromJson(
    (json['labelFontWeight'] as num?)?.toInt(),
  ),
  $enumDecodeNullable(_$FontStyleEnumMap, json['labelFontStyle']),
);

Map<String, dynamic> _$LabelThemeToJson(_LabelTheme instance) =>
    <String, dynamic>{
      'id': instance.id,
      'labelColor': const MaterialColorConverter().toJson(instance.labelColor),
      'labelFonSize': instance.labelFonSize,
      'labelFontWeight': const FontWeightConverter().toJson(
        instance.labelFontWeight,
      ),
      'labelFontStyle': _$FontStyleEnumMap[instance.labelFontStyle],
    };

const _$FontStyleEnumMap = {
  FontStyle.normal: 'normal',
  FontStyle.italic: 'italic',
};
