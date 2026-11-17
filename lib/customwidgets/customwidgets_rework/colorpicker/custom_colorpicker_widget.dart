import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/widget_theme.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/colorpicker/settings/custom_colorpicker_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/colorpicker/view/custom_colorpicker_widget_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget.dart';

part 'custom_colorpicker_widget.freezed.dart';
part 'custom_colorpicker_widget.g.dart';

@unfreezed
abstract class CustomColorPickerWidget
    with _$CustomColorPickerWidget
    implements CustomWidget {
  @override
  final isAbleToPopupMenu = false;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final hasCustomTheme = true;
  @override
  const CustomColorPickerWidget._();

  @Implements<CustomWidget>()
  factory CustomColorPickerWidget({
    @Default(WidgetType.colorPicker) WidgetType type,
    required String id,
    required String name,
    required String? dataPoint,
    String? label,
    @Default("0x") String prefix,
    @Default(false) alpha,
    @Default(true) shadesSelection,
    @Default({}) Map<ColorPickerType, bool> pickersEnabled,
    CustomPopupmenu? customPopupmenu,
    WidgetTheme? customTheme,
  }) = _CustomColorPickerWidget;

  @override
  CustomWidgetSettingWidget get settingWidget {
    return CustomColorPickerWidgetSettingsView(customColorPickerWidget: this);
  }

  @override
  List<String> get dependentDataPoints {
    return dataPoint == null ? [] : [dataPoint!];
  }

  @override
  Widget get widget {
    return CustomColorPickerWidgetView(customColorPickerWidget: this);
  }

  @override
  factory CustomColorPickerWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomColorPickerWidgetFromJson(json);

  @override
  CustomWidget clone() {
    return copyWith();
  }
}
