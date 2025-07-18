// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_label_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LabelThemeImpl _$$LabelThemeImplFromJson(Map<String, dynamic> json) =>
    _$LabelThemeImpl(
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

Map<String, dynamic> _$$LabelThemeImplToJson(_$LabelThemeImpl instance) =>
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
