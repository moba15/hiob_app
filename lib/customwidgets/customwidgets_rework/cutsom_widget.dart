import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget_rework_wrapper.dart';

abstract class CustomWidget extends CustomWidgetWrapper {
  @override
  final CustomWidgetTypeDeprecated type;
  @override
  String id;
  @override
  final String name;

  final bool isAbleToPopupMenu;

  final bool hasCustomTheme;

  CustomPopupmenu? customPopupmenu;
  CustomThemeForWidget? customTheme;

  CustomWidget({
    required this.type,
    required this.id,
    required this.name,
    required this.isAbleToPopupMenu,
    required this.hasCustomTheme,
    required this.customPopupmenu,
    required this.customTheme,
  });

  @override
  CustomWidgetSettingWidget get settingWidget;
  @override
  Widget get widget;

  List<String> get dependentDataPoints;

  Map<String, dynamic> toJson();

  CustomWidget clone();
}

extension CustomWidgetExetension on CustomWidget {
  bool tryOpenPopupmenu(BuildContext context) {
    if (isAbleToPopupMenu && customPopupmenu != null) {
      return customPopupmenu!.tryOpen(context);
    } else {
      return false;
    }
  }
}
