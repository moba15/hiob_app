import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/common_impl/label/settings/custom_label_theme_settings.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';

import 'package:smart_home/utils/converter/fontweight_color_converter.dart';
import 'package:smart_home/utils/converter/material_color_converter.dart';

part 'widget_label_theme.freezed.dart';
part 'widget_label_theme.g.dart';

@unfreezed
class LabelTheme with _$LabelTheme {
  LabelTheme._();
  @Implements<CustomThemeForWidget>()
  factory LabelTheme(
    String id,
    @MaterialColorConverter() Color? labelColor,
    double? labelFonSize,
    @FontWeightConverter() FontWeight? labelFontWeight,
    FontStyle? labelFontStyle,
  ) = _LabelTheme;

  Widget get settingWidget {
    return CustomLabelThemeSettings(labelTheme: this);
  }

  @override
  factory LabelTheme.fromJson(Map<String, dynamic> json) =>
      _$LabelThemeFromJson(json);

  TextStyle get textStyle => TextStyle(
      fontSize: labelFonSize, color: labelColor, fontWeight: labelFontWeight);
}
