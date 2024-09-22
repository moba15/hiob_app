import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/settings/custom_multiselection_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/view/custom_multiselection_widget_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/custom_dropdown_button/cutsom_dropdown_button.dart';

import 'package:smart_home/device/datapoint/converter/datapoint_converter.dart';
import 'package:smart_home/device/state/state.dart';

part 'custom_multiselection_widget.freezed.dart';
part 'custom_multiselection_widget.g.dart';

@unfreezed
class CustomMultiselectionWidget
    with _$CustomMultiselectionWidget
    implements CustomWidget {
  @override
  final isAbleToPopupMenu = true;
  @override
  const CustomMultiselectionWidget._();

  @Implements<CustomWidget>()
  factory CustomMultiselectionWidget({
    @Default(CustomWidgetTypeDeprecated.multiselection)
    CustomWidgetTypeDeprecated type,
    required String id,
    required String name,
    @DataPointIdConverter() required DataPoint? dataPoint,
    String? label,
    required Map<String, String> selections,
    @Default(DropdownMenuMode.dropdown) DropdownMenuMode dropdownMenuMode,
    CustomPopupmenu? customPopupmenu,
  }) = _CustomMultiselectionWidget;

  @override
  CustomWidgetSettingWidget get settingWidget {
    return CustomMultiselectionWidgetSettingsView(
        customMultiselectionWidget: this);
  }

  @override
  List<DataPoint> get dependentDataPoints {
    return dataPoint == null ? [] : [dataPoint!];
  }

  @override
  Widget get widget {
    return CustomMultiselectionWidgetView(customMultiselectionWidget: this);
  }

  @override
  factory CustomMultiselectionWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomMultiselectionWidgetFromJson(json);
}