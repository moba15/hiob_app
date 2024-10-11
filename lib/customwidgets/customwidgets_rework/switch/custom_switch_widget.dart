import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/settings/custom_switch_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/theme/custom_switch_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/view/custom_switch_widget_view.dart';
import 'package:smart_home/device/datapoint/converter/datapoint_converter.dart';
import 'package:smart_home/device/state/state.dart';

part 'custom_switch_widget.freezed.dart';
part 'custom_switch_widget.g.dart';

class _CustomSwitchThemeConverter
    implements JsonConverter<CustomThemeForWidget?, Map<String, dynamic>?> {
  const _CustomSwitchThemeConverter();
  @override
  CustomThemeForWidget? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    } else {
      return CustomSwitchWidgetTheme.fromJson(json) as CustomThemeForWidget;
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
class CustomSwitchWidget with _$CustomSwitchWidget implements CustomWidget {
  @override
  final isAbleToPopupMenu = true;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final hasCustomTheme = true;
  @override
  const CustomSwitchWidget._();

  @Implements<CustomWidget>()
  factory CustomSwitchWidget({
    @Default(CustomWidgetTypeDeprecated.switchWidget)
    CustomWidgetTypeDeprecated type,
    required String id,
    required String name,
    @DataPointIdConverter() required DataPoint? dataPoint,
    String? label,
    @Default("true") String sendIfOn,
    @Default("false") String sendIfOff,
    CustomPopupmenu? customPopupmenu,
    @_CustomSwitchThemeConverter() CustomThemeForWidget? customTheme,
  }) = _CustomSwitchWidget;

  @override
  CustomWidgetSettingWidget get settingWidget {
    return CustomSwitchWidgetSettingsView(customSwitchWidget: this);
  }

  @override
  List<DataPoint> get dependentDataPoints {
    return dataPoint == null ? [] : [dataPoint!];
  }

  @override
  Widget get widget {
    return CustomSwitchWidgetView(customSwitchWidget: this);
  }

  @override
  factory CustomSwitchWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomSwitchWidgetFromJson(json);
}
