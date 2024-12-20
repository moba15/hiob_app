import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/settings/custom_slider_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/theme/custom_slider_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/view/custom_slider_widget_view.dart';

import 'package:smart_home/device/datapoint/converter/datapoint_converter.dart';
import 'package:smart_home/device/state/state.dart';

part 'custom_slider_widget.freezed.dart';
part 'custom_slider_widget.g.dart';

enum CustomSliderWidgetUpdateStrategy { onFinish, onChange }

class _CustomSliderThemeConverter
    implements JsonConverter<CustomThemeForWidget?, Map<String, dynamic>?> {
  const _CustomSliderThemeConverter();
  @override
  CustomThemeForWidget? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    } else {
      return CustomSliderWidgetTheme.fromJson(json) as CustomThemeForWidget;
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
class CustomSliderWidget with _$CustomSliderWidget implements CustomWidget {
  @override
  final isAbleToPopupMenu = false;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final hasCustomTheme = true;
  @override
  const CustomSliderWidget._();
  //TODO Label anzeige
  @Implements<CustomWidget>()
  factory CustomSliderWidget({
    @Default(CustomWidgetTypeDeprecated.slider) CustomWidgetTypeDeprecated type,
    required String id,
    required String name,
    String? label,
    @DataPointIdConverter() required DataPoint? dataPoint,
    @Default(100) int max,
    @Default(0) int min,
    @Default(10) int step,
    @Default(CustomSliderWidgetUpdateStrategy.onFinish)
    CustomSliderWidgetUpdateStrategy? customSliderWidgetUpdateStrategy,
    CustomPopupmenu? customPopupmenu,
    @_CustomSliderThemeConverter() CustomThemeForWidget? customTheme,
  }) = _CustomSliderWidget;

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

  @override
  CustomWidget clone() {
    return copyWith();
  }
}
