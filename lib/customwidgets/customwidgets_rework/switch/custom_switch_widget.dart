import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/widget_theme.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/settings/custom_switch_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/view/custom_switch_widget_view.dart';

part 'custom_switch_widget.freezed.dart';
part 'custom_switch_widget.g.dart';

@unfreezed
abstract class CustomSwitchWidget
    with _$CustomSwitchWidget
    implements CustomWidget {
  @override
  final isAbleToPopupMenu = true;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final hasCustomTheme = true;
  @override
  const CustomSwitchWidget._();

  @Implements<CustomWidget>()
  factory CustomSwitchWidget({
    @Default(WidgetType.switchWidget) WidgetType type,
    required String id,
    required String name,
    required String? dataPoint,
    String? label,
    @Default("true") String sendIfOn,
    @Default("false") String sendIfOff,
    CustomPopupmenu? customPopupmenu,
    WidgetTheme? customTheme,
  }) = _CustomSwitchWidget;

  @override
  CustomWidgetSettingWidget get settingWidget {
    return CustomSwitchWidgetSettingsView(customSwitchWidget: this);
  }

  @override
  List<String> get dependentDataPoints {
    return dataPoint == null ? [] : [dataPoint!];
  }

  @override
  Widget get widget {
    return CustomSwitchWidgetView(customSwitchWidget: this);
  }

  @override
  factory CustomSwitchWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomSwitchWidgetFromJson(json);

  @override
  CustomWidget clone() {
    return copyWith();
  }
}
