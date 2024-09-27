import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/input/settings/custom_input_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/input/view/custom_input_widget_view.dart';
import 'package:smart_home/device/datapoint/converter/datapoint_converter.dart';
import 'package:smart_home/device/state/state.dart';

part 'custom_input_widget.freezed.dart';
part 'custom_input_widget.g.dart';

enum CustomInputSendMethod { onSubmitted }

extension CustomInputSendMethodExtension on CustomInputSendMethod {
  String get name {
    switch (this) {
      case CustomInputSendMethod.onSubmitted:
        return "On enter";
      default:
        return "Not found";
    }
  }
}

enum CustomInputDisplayConentType { noShow, value, hintText }

extension CustomInputDisplayConentTypeExtension
    on CustomInputDisplayConentType {
  String get name {
    switch (this) {
      case CustomInputDisplayConentType.hintText:
        return "Hint";
      case CustomInputDisplayConentType.noShow:
        return "Do not show";
      case CustomInputDisplayConentType.value:
        return "Value";
      default:
        return "Error";
    }
  }
}

@unfreezed
class CustomInputWidget with _$CustomInputWidget implements CustomWidget {
  @JsonKey(includeToJson: false, includeFromJson: false)
  @override
  final isAbleToPopupMenu = true;
  @override
  const CustomInputWidget._();

  @Implements<CustomWidget>()
  factory CustomInputWidget(
      {@Default(CustomWidgetTypeDeprecated.input)
      CustomWidgetTypeDeprecated type,
      required String id,
      required String name,
      String? label,
      @DataPointIdConverter() required DataPoint? dataPoint,
      String? hintText,
      String? suffix,
      CustomPopupmenu? customPopupmenu,
      CustomInputSendMethod? customInputSendMethod,
      CustomInputDisplayConentType? customInputDisplayConentType,
      @Default(false) bool fullSize}) = _CustomInputWidget;

  @override
  CustomWidgetSettingWidget get settingWidget {
    return CustomInputWidgetSettingsView(customInputWidget: this);
  }

  @override
  List<DataPoint> get dependentDataPoints {
    return dataPoint == null ? [] : [dataPoint!];
  }

  @override
  Widget get widget {
    return CustomInputWidgetView(customInputWidget: this);
  }

  @override
  factory CustomInputWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomInputWidgetFromJson(json);
}
