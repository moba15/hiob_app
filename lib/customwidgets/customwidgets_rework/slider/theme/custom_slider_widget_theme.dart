import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/common_impl/label/widget_label_theme.dart';

import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';

part 'custom_slider_widget_theme.freezed.dart';
part 'custom_slider_widget_theme.g.dart';

@unfreezed
class CustomSliderWidgetTheme with _$CustomSliderWidgetTheme {
  CustomSliderWidgetTheme._();
  @Implements<CustomThemeForWidget>()
  factory CustomSliderWidgetTheme(String id, LabelTheme labelTheme) =
      _CustomSliderWidgetTheme;

  Widget get settingWidget {
    return labelTheme.settingWidget;
  }

  @override
  factory CustomSliderWidgetTheme.fromJson(Map<String, dynamic> json) =>
      _$CustomSliderWidgetThemeFromJson(json);
}
