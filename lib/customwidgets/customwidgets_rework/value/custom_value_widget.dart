import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/widget_theme.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/settings/custom_value_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/view/custom_value_widget_view.dart';

part 'custom_value_widget.freezed.dart';
part 'custom_value_widget.g.dart';

@unfreezed
abstract class CustomValueWidget
    with _$CustomValueWidget
    implements CustomWidget {
  @override
  final isAbleToPopupMenu = true;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final hasCustomTheme = true;
  @override
  const CustomValueWidget._();

  @Implements<CustomWidget>()
  factory CustomValueWidget({
    @Default(WidgetType.valueNew) WidgetType type,
    required String id,
    required String name,
    required String? dataPoint,
    String? label,
    @Default({}) Map<String, String> valueMapper,
    @Default(2) int round,
    String? suffix,
    String? prefix,
    CustomPopupmenu? customPopupmenu,
    WidgetTheme? customTheme,
  }) = _CustomValueWidget;

  @override
  CustomWidgetSettingWidget get settingWidget {
    return CustomValueWidgetSettingsView(customValueWidget: this);
  }

  @override
  List<String> get dependentDataPoints {
    return dataPoint == null ? [] : [dataPoint!];
  }

  @override
  Widget get widget {
    return CustomValueWidgetView(customValueWidget: this);
  }

  @override
  factory CustomValueWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomValueWidgetFromJson(json);

  @override
  CustomWidget clone() {
    return copyWith();
  }
}
