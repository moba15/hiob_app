import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
    FontStyle labelFontStyle,
  ) = _LabelTheme;

  Widget get settingWidget {
    throw UnimplementedError();
  }

  @override
  factory LabelTheme.fromJson(Map<String, dynamic> json) =>
      _$LabelThemeFromJson(json);
}
