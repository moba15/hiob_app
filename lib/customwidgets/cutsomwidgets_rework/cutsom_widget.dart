import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/device/state/state.dart';

abstract class CustomWidget extends CustomWidgetWrapper {
  @override
  final CustomWidgetTypeDeprecated type;
  @override
  String id;
  @override
  final String name;

  final bool isAbleToPopupMenu;

  CustomPopupmenu? customPopupmenu;

  CustomWidget(
      {required this.type,
      required this.id,
      required this.name,
      required this.isAbleToPopupMenu,
      required this.customPopupmenu});

  CustomWidgetSettingWidget get settingWidget;
  Widget get widget;

  List<DataPoint> get dependentDataPoints;

  Map<String, dynamic> toJson();
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
