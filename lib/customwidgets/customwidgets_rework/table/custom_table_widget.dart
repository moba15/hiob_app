import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/table/settings/custom_table_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/table/view/custom_table_widget_view.dart';

part 'custom_table_widget.freezed.dart';
part 'custom_table_widget.g.dart';

@unfreezed
class CustomTableWidget with _$CustomTableWidget implements CustomWidget {
  @override
  final isAbleToPopupMenu = false;
  @override
  final hasCustomTheme = false;
  @override
  const CustomTableWidget._();

  @Implements<CustomWidget>()
  factory CustomTableWidget({
    @Default(CustomWidgetTypeDeprecated.tableNew)
    CustomWidgetTypeDeprecated type,
    required String id,
    required String name,
    required String? dataPoint,
    String? header,
    @Default(false) bool sortAsc,
    @Default(0) int initalSortColumn,
    @Default(false) bool initialSortEnabled,
    @Default(10) int elementsPerPage,
    required Map<String, String> columns,
    CustomPopupmenu? customPopupmenu,
    CustomThemeForWidget? customTheme,
  }) = _CustomTableWidget;

  @override
  CustomWidgetSettingWidget get settingWidget {
    return CustomTableWidgetSettingsView(customTableWidget: this);
  }

  @override
  List<String> get dependentDataPoints {
    return dataPoint == null ? [] : [dataPoint!];
  }

  @override
  Widget get widget {
    return CustomTableWidgetView(customTableWidget: this);
  }

  @override
  factory CustomTableWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomTableWidgetFromJson(json);

  @override
  CustomWidget clone() {
    return copyWith();
  }
}
