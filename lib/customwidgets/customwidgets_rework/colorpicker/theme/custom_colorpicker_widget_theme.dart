import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/common_impl/label/widget_label_theme.dart';

import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';
import 'package:smart_home/utils/converter/fontweight_color_converter.dart';
import 'package:smart_home/utils/converter/material_color_converter.dart';

part 'custom_colorpicker_widget_theme.freezed.dart';
part 'custom_colorpicker_widget_theme.g.dart';

@unfreezed
class CustomColorpickerWidgetTheme with _$CustomColorpickerWidgetTheme {
  CustomColorpickerWidgetTheme._();
  @Implements<CustomThemeForWidget>()
  factory CustomColorpickerWidgetTheme(
    String id,
    LabelTheme labelTheme,
  ) = _CustomColorpickerWidgetTheme;

  Widget get settingWidget {
    return labelTheme.settingWidget;
  }

  @override
  factory CustomColorpickerWidgetTheme.fromJson(Map<String, dynamic> json) =>
      _$CustomColorpickerWidgetThemeFromJson(json);
}
