import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/widget_theme.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/settings/custom_button_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/view/custom_button_widget_view.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget.dart';

part 'custom_button_widget.freezed.dart';
part 'custom_button_widget.g.dart';

@unfreezed
abstract class CustomButtonWidget
    with _$CustomButtonWidget
    implements CustomWidget {
  @override
  final isAbleToPopupMenu = true;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final hasCustomTheme = true;

  const CustomButtonWidget._();

  @Implements<CustomWidget>()
  factory CustomButtonWidget({
    @Default(WidgetType.button) WidgetType type,
    required String id,
    required String name,
    CustomPopupmenu? customPopupmenu,
    WidgetTheme? customTheme,
    String? label,
    required String? dataPoint,
    String? buttonLabel,
  }) = _CustomButtonWidget;

  @override
  List<String> get dependentDataPoints {
    return dataPoint == null ? [] : [dataPoint!];
  }

  @override
  CustomWidgetSettingWidget get settingWidget =>
      CustomButtonWidgetSettingsView(customButtonWidget: this);

  @override
  WidgetType get type => throw UnimplementedError();

  @override
  Widget get widget => CustomButtonWidgetView(customButtonWidget: this);

  String get labelOrName {
    return (label == null || label!.trim().isEmpty) ? name : label!;
  }

  factory CustomButtonWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomButtonWidgetFromJson(json);
  @override
  CustomWidget clone() {
    return copyWith();
  }
}
