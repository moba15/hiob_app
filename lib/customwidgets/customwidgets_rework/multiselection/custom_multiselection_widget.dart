import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/settings/custom_multiselection_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/theme/custom_multiselection_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/view/custom_multiselection_widget_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/custom_dropdown_button/cutsom_dropdown_button.dart';

part 'custom_multiselection_widget.freezed.dart';
part 'custom_multiselection_widget.g.dart';

class _CustomMultiselectionThemeConverter
    implements JsonConverter<CustomThemeForWidget?, Map<String, dynamic>?> {
  const _CustomMultiselectionThemeConverter();
  @override
  CustomThemeForWidget? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    } else {
      return CustomMultiselectionWidgetTheme.fromJson(json)
          as CustomThemeForWidget;
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
class CustomMultiselectionWidget
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
    @Default(CustomWidgetTypeDeprecated.multiselection)
    CustomWidgetTypeDeprecated type,
    required String id,
    required String name,
    required String? dataPoint,
    String? label,
    required Map<String, String> selections,
    @Default(DropdownMenuMode.dropdown) DropdownMenuMode dropdownMenuMode,
    @_CustomMultiselectionThemeConverter() CustomPopupmenu? customPopupmenu,
    @_CustomMultiselectionThemeConverter() CustomThemeForWidget? customTheme,
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
