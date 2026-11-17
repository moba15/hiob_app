import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/widget_theme.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/settings/custom_multiselection_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/view/custom_multiselection_widget_view.dart';

part 'custom_multiselection_widget.freezed.dart';
part 'custom_multiselection_widget.g.dart';

enum DropdownMenuMode { dropdown, dialog, bottomSheet }

@unfreezed
abstract class CustomMultiselectionWidget
    with _$CustomMultiselectionWidget
    implements CustomWidget {
  @override
  final isAbleToPopupMenu = true;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final hasCustomTheme = true;
  @override
  const CustomMultiselectionWidget._();

  @Implements<CustomWidget>()
  factory CustomMultiselectionWidget({
    @Default(WidgetType.multiselection) WidgetType type,
    required String id,
    required String name,
    required String? dataPoint,
    String? label,
    required Map<String, String> selections,
    @Default(DropdownMenuMode.dropdown) DropdownMenuMode dropdownMenuMode,
    CustomPopupmenu? customPopupmenu,
    WidgetTheme? customTheme,
  }) = _CustomMultiselectionWidget;

  @override
  CustomWidgetSettingWidget get settingWidget {
    return CustomMultiselectionWidgetSettingsView(
      customMultiselectionWidget: this,
    );
  }

  @override
  List<String> get dependentDataPoints {
    return dataPoint == null ? [] : [dataPoint!];
  }

  @override
  Widget get widget {
    return CustomMultiselectionWidgetView(customMultiselectionWidget: this);
  }

  @override
  factory CustomMultiselectionWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomMultiselectionWidgetFromJson(json);

  @override
  CustomWidget clone() {
    return copyWith();
  }
}
