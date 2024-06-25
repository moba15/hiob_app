import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/input_widget/settings/custom_input_widget_settings_view.dart';
import 'package:smart_home/device/datapoint/converter/datapoint_converter.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
part 'custom_input_widget.freezed.dart';
part 'custom_input_widget.g.dart';

enum CustomInputSendMethod { onChanged, onSubmitted }

enum CustomInputDisplayConentType { noShow, value, hintText }

@unfreezed
class CustomInputWidget with _$CustomInputWidget implements CustomWidget {
  const CustomInputWidget._();
  @Implements<CustomWidget>()
  factory CustomInputWidget({
    @Default(CustomWidgetTypeDeprecated.input) CustomWidgetTypeDeprecated type,
    required String id,
    required String name,
    @DataPointIdConverter() required DataPoint? dataPoint,
    String? hintText,
    String? suffix,
    CustomInputSendMethod? customInputSendMethod,
    CustomInputDisplayConentType? customInputDisplayConentType,
  }) = _CustomInputWidget;

  CustomWidgetSettingWidget get settingWidget {
    return CustomInputWidgetSettingsView(customInputWidget: this);
  }

  Widget get widget {
    return Placeholder();
  }

  factory CustomInputWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomInputWidgetFromJson(json);
}
