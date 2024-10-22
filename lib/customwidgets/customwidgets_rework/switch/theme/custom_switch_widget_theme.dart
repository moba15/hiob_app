import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/common_impl/label/widget_label_theme.dart';

import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';

part 'custom_switch_widget_theme.freezed.dart';
part 'custom_switch_widget_theme.g.dart';

@unfreezed
class CustomSwitchWidgetTheme with _$CustomSwitchWidgetTheme {
  CustomSwitchWidgetTheme._();
  @Implements<CustomThemeForWidget>()
  factory CustomSwitchWidgetTheme(
    String id,
    LabelTheme labelTheme,
  ) = _CustomSwitchWidgetTheme;

  Widget get settingWidget {
    return labelTheme.settingWidget;
  }

  @override
  factory CustomSwitchWidgetTheme.fromJson(Map<String, dynamic> json) =>
      _$CustomSwitchWidgetThemeFromJson(json);
}
