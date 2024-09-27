import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/settings/custom_slider_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/view/custom_slider_widget_view.dart';

import 'package:smart_home/device/datapoint/converter/datapoint_converter.dart';
import 'package:smart_home/device/state/state.dart';

part 'custom_slider_widget.freezed.dart';
part 'custom_slider_widget.g.dart';

@unfreezed
class CustomSliderWidget with _$CustomSliderWidget implements CustomWidget {
  @override
  final isAbleToPopupMenu = false;
  @override
  const CustomSliderWidget._();

  @Implements<CustomWidget>()
  factory CustomSliderWidget(
      {@Default(CustomWidgetTypeDeprecated.slider)
      CustomWidgetTypeDeprecated type,
      required String id,
      required String name,
      @DataPointIdConverter() required DataPoint? dataPoint,
      @Default(100) int max,
      @Default(0) int min,
      @Default(10) int step,
      CustomPopupmenu? customPopupmenu}) = _CustomSliderWidget;

  @override
  CustomWidgetSettingWidget get settingWidget {
    return CustomSliderWidgetSettingsView(customSliderWidget: this);
  }

  @override
  List<DataPoint> get dependentDataPoints {
    return dataPoint == null ? [] : [dataPoint!];
  }

  @override
  Widget get widget {
    return CustomSliderWidgetView(customSliderWidget: this);
  }

  @override
  factory CustomSliderWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomSliderWidgetFromJson(json);
}
