import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/common_impl/widget_label_theme.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';
import 'package:smart_home/utils/converter/fontweight_color_converter.dart';
import 'package:smart_home/utils/converter/material_color_converter.dart';

part 'custom_value_widget_theme.freezed.dart';
part 'custom_value_widget_theme.g.dart';

@unfreezed
class CustomValueWidgetTheme with _$CustomValueWidgetTheme {
  CustomValueWidgetTheme._();
  @Implements<CustomThemeForWidget>()
  factory CustomValueWidgetTheme(
    String id,
    LabelTheme labelTheme,
    @MaterialColorConverter() Color? valueTextColor,
    double? valueTextFonSize,
    @FontWeightConverter() FontWeight? valueTextFontWeight,
  ) = _CustomValueWidgetTheme;

  Widget get settingWidget {
    throw UnimplementedError();
  }

  @override
  factory CustomValueWidgetTheme.fromJson(Map<String, dynamic> json) =>
      _$CustomValueWidgetThemeFromJson(json);
}
