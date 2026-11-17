import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/common_impl/label/widget_label_theme.dart';
import 'package:smart_home/utils/converter/divider_theme_data_converter.dart';
part 'widget_theme.freezed.dart';
part 'widget_theme.g.dart';

@unfreezed
abstract class WidgetTheme with _$WidgetTheme {
  WidgetTheme._();
  factory WidgetTheme({
    required String id,
    LabelTheme? labelTheme,
    LabelTheme? valueTheme,
    @DividerThemeDataConverter() DividerThemeData? dividerTheme,
    Map<String, dynamic>? extras,
  }) = _WidgetTheme;

  factory WidgetTheme.fromJson(Map<String, dynamic> json) =>
      _$WidgetThemeFromJson(json);

  Widget get settingWidget {
    return labelTheme?.settingWidget ?? const SizedBox.shrink();
  }
}
