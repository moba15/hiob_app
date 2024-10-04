// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_theme_for_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LabelThemeImpl _$$LabelThemeImplFromJson(Map<String, dynamic> json) =>
    _$LabelThemeImpl(
      const MaterialColorConverter()
          .fromJson(json['labelColor'] as Map<String, dynamic>?),
      (json['labelFonSize'] as num?)?.toDouble(),
      const FontWeightConverter()
          .fromJson((json['labelFontWeight'] as num?)?.toInt()),
    );

Map<String, dynamic> _$$LabelThemeImplToJson(_$LabelThemeImpl instance) =>
    <String, dynamic>{
      'labelColor': const MaterialColorConverter().toJson(instance.labelColor),
      'labelFonSize': instance.labelFonSize,
      'labelFontWeight':
          const FontWeightConverter().toJson(instance.labelFontWeight),
    };

_$CustomThemeForWidgetImpl _$$CustomThemeForWidgetImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomThemeForWidgetImpl(
      const MaterialColorConverter()
          .fromJson(json['backgroundColor'] as Map<String, dynamic>?),
      LabelTheme.fromJson(json['labelTheme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomThemeForWidgetImplToJson(
        _$CustomThemeForWidgetImpl instance) =>
    <String, dynamic>{
      'backgroundColor':
          const MaterialColorConverter().toJson(instance.backgroundColor),
      'labelTheme': instance.labelTheme,
    };
