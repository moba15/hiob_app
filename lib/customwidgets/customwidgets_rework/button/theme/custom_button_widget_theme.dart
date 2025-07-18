import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/common_impl/label/widget_label_theme.dart';

import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';

part 'custom_button_widget_theme.freezed.dart';
part 'custom_button_widget_theme.g.dart';

@unfreezed
class CustomButtonWidgetTheme with _$CustomButtonWidgetTheme {
  CustomButtonWidgetTheme._();
  @Implements<CustomThemeForWidget>()
  factory CustomButtonWidgetTheme(String id, LabelTheme labelTheme) =
      _CustomButtonWidgetTheme;

  Widget get settingWidget {
    return labelTheme.settingWidget;
  }

  @override
  factory CustomButtonWidgetTheme.fromJson(Map<String, dynamic> json) =>
      _$CustomButtonWidgetThemeFromJson(json);
}
