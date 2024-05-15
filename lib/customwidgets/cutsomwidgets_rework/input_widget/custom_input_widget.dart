import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_widget.dart' as old;
import 'package:smart_home/customwidgets/cutsomwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/device/datapoint/converter/datapoint_converter.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
part 'custom_input_widget.freezed.dart';
part 'custom_input_widget.g.dart';

@unfreezed
class CustomInputWidget with _$CustomInputWidget {
  const CustomInputWidget._();
  @Implements<CustomWidget>()
  factory CustomInputWidget({
    required String id,
    required CustomWidgetType type,
    required String name,
    required String hintText,
    @DataPointIdConverter() required DataPoint? dataPoint,
    required String? suffix,
  }) = _CustomInputWidget;

  old.CustomWidgetSettingWidget get settingWidget {
    throw UnimplementedError();
  }

  Widget get widget {
    throw UnimplementedError();
  }

  factory CustomInputWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomInputWidgetFromJson(json);
}
