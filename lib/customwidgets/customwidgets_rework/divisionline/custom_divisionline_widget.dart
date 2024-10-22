import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/divisionline/settings/custom_divisionline_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/divisionline/view/custom_divisionline_widget_view.dart';
import 'package:smart_home/device/state/state.dart';

part 'custom_divisionline_widget.freezed.dart';
part 'custom_divisionline_widget.g.dart';

@unfreezed
class CustomDivisionlineWidget
    with _$CustomDivisionlineWidget
    implements CustomWidget {
  @override
  final isAbleToPopupMenu = true;
  @override
  final hasCustomTheme = false;
  @override
  const CustomDivisionlineWidget._();

  @Implements<CustomWidget>()
  factory CustomDivisionlineWidget({
    @Default(CustomWidgetTypeDeprecated.divisionLine)
    CustomWidgetTypeDeprecated type,
    required String id,
    required String name,
    @Default(1) thickness,
    CustomPopupmenu? customPopupmenu,
    CustomThemeForWidget? customTheme,
  }) = _CustomDivisionlineWidget;

  @override
  CustomWidgetSettingWidget get settingWidget {
    return CustomDivisionlineWidgetSettingsView(customDivisionlineWidget: this);
  }

  @override
  List<DataPoint> get dependentDataPoints {
    return [];
  }

  @override
  Widget get widget {
    return CustomDivisionlineWidgetView(customDivisionlineWidget: this);
  }

  @override
  factory CustomDivisionlineWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomDivisionlineWidgetFromJson(json);
}
