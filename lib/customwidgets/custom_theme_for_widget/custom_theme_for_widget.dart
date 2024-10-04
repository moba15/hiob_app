import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/utils/converter/fontweight_color_converter.dart';
import 'package:smart_home/utils/converter/material_color_converter.dart';
part 'custom_theme_for_widget.freezed.dart';
part 'custom_theme_for_widget.g.dart';

@freezed
class LabelTheme with _$LabelTheme {
  factory LabelTheme(
    /**
     * Common Label
     */
    @MaterialColorConverter() Color? labelColor,
    double? labelFonSize,
    @FontWeightConverter() FontWeight? labelFontWeight,
  ) = _LabelTheme;

  @override
  factory LabelTheme.fromJson(Map<String, dynamic> json) =>
      _$LabelThemeFromJson(json);
}

@freezed
class CustomThemeForWidget with _$CustomThemeForWidget {
  factory CustomThemeForWidget(
    /**
     * Background
     */
    @MaterialColorConverter() Color? backgroundColor,
    /**
     * Common label
     */
    LabelTheme labelTheme,
  ) = _CustomThemeForWidget;

  @override
  factory CustomThemeForWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomThemeForWidgetFromJson(json);
}
