import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/settings/custom_value_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/view/custom_value_widget_view.dart';
import 'package:smart_home/device/datapoint/converter/datapoint_converter.dart';
import 'package:smart_home/device/state/state.dart';

part 'custom_value_widget.freezed.dart';
part 'custom_value_widget.g.dart';

@unfreezed
class CustomValueWidget with _$CustomValueWidget implements CustomWidget {
  @override
  final isAbleToPopupMenu = true;
  @override
  const CustomValueWidget._();

  @Implements<CustomWidget>()
  factory CustomValueWidget(
      {@Default(CustomWidgetTypeDeprecated.valueNew)
      CustomWidgetTypeDeprecated type,
      required String id,
      required String name,
      @DataPointIdConverter() required DataPoint? dataPoint,
      String? label,
      @Default({}) Map<String, String> valueMapper,
      CustomPopupmenu? customPopupmenu}) = _CustomValueWidget;

  @override
  CustomWidgetSettingWidget get settingWidget {
    return CustomValueWidgetSettingsView(customValueWidget: this);
  }

  @override
  List<DataPoint> get dependentDataPoints {
    return dataPoint == null ? [] : [dataPoint!];
  }

  @override
  Widget get widget {
    return CustomValueWidgetView(customValueWidget: this);
  }

  @override
  factory CustomValueWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomValueWidgetFromJson(json);
}
