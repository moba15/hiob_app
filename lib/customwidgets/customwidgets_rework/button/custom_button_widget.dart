import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/settings/custom_button_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/theme/custom_button_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/view/custom_button_widget_view.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';

part 'custom_button_widget.freezed.dart';
part 'custom_button_widget.g.dart';

class _CustomButtonThemeConverter
    implements JsonConverter<CustomThemeForWidget?, Map<String, dynamic>?> {
  const _CustomButtonThemeConverter();
  @override
  CustomThemeForWidget? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    } else {
      return CustomButtonWidgetTheme.fromJson(json) as CustomThemeForWidget;
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
class CustomButtonWidget with _$CustomButtonWidget implements CustomWidget {
  @override
  final isAbleToPopupMenu = true;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final hasCustomTheme = true;

  const CustomButtonWidget._();

  @Implements<CustomWidget>()
  factory CustomButtonWidget({
    @Default(CustomWidgetTypeDeprecated.button) CustomWidgetTypeDeprecated type,
    required String id,
    required String name,
    CustomPopupmenu? customPopupmenu,
    @_CustomButtonThemeConverter() CustomThemeForWidget? customTheme,
    String? label,
    required String? dataPoint,
    String? buttonLabel,
  }) = _CustomButtonWidget;

  @override
  List<String> get dependentDataPoints {
    return dataPoint == null ? [] : [dataPoint!];
  }

  @override
  CustomWidgetSettingWidget get settingWidget =>
      CustomButtonWidgetSettingsView(customButtonWidget: this);

  @override
  CustomWidgetTypeDeprecated get type => throw UnimplementedError();

  @override
  Widget get widget => CustomButtonWidgetView(customButtonWidget: this);

  String get labelOrName {
    return (label == null || label!.trim().isEmpty) ? name : label!;
  }

  factory CustomButtonWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomButtonWidgetFromJson(json);
  @override
  CustomWidget clone() {
    return copyWith();
  }
}
