import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/common_impl/label/widget_label_theme.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_theme/custom_value_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/settings/custom_value_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/view/custom_value_widget_view.dart';
import 'package:smart_home/device/datapoint/converter/datapoint_converter.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/manager/manager.dart';

part 'custom_value_widget.freezed.dart';
part 'custom_value_widget.g.dart';

class _CustomValueThemeConverter
    implements JsonConverter<CustomThemeForWidget?, Map<String, dynamic>?> {
  const _CustomValueThemeConverter();
  @override
  CustomThemeForWidget? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    } else {
      return CustomValueWidgetTheme.fromJson(json) as CustomThemeForWidget;
    }
  }

  @override
  Map<String, dynamic>? toJson(CustomThemeForWidget? object) {
    if (object == null) {
      return null;
    }
    return object.toJson();
  }
}

@unfreezed
class CustomValueWidget with _$CustomValueWidget implements CustomWidget {
  @override
  final isAbleToPopupMenu = true;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final hasCustomTheme = true;
  @override
  const CustomValueWidget._();

  @Implements<CustomWidget>()
  factory CustomValueWidget({
    @Default(CustomWidgetTypeDeprecated.valueNew)
    CustomWidgetTypeDeprecated type,
    required String id,
    required String name,
    @DataPointIdConverter() required DataPoint? dataPoint,
    String? label,
    @Default({}) Map<String, String> valueMapper,
    @Default(2) int round,
    String? suffix,
    String? prefix,
    CustomPopupmenu? customPopupmenu,
    @_CustomValueThemeConverter() CustomThemeForWidget? customTheme,
  }) = _CustomValueWidget;

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
