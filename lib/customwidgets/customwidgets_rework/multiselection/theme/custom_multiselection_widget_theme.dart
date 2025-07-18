import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/common_impl/label/widget_label_theme.dart';

import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';

part 'custom_multiselection_widget_theme.freezed.dart';
part 'custom_multiselection_widget_theme.g.dart';

@unfreezed
class CustomMultiselectionWidgetTheme with _$CustomMultiselectionWidgetTheme {
  CustomMultiselectionWidgetTheme._();
  @Implements<CustomThemeForWidget>()
  factory CustomMultiselectionWidgetTheme(String id, LabelTheme labelTheme) =
      _CustomMultiselectionWidgetTheme;

  Widget get settingWidget {
    return labelTheme.settingWidget;
  }

  @override
  factory CustomMultiselectionWidgetTheme.fromJson(Map<String, dynamic> json) =>
      _$CustomMultiselectionWidgetThemeFromJson(json);
}
