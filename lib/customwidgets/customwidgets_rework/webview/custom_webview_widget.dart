import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/settings/custom_webview_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/view/custom_webview_widget_view.dart';

part 'custom_webview_widget.freezed.dart';
part 'custom_webview_widget.g.dart';

@unfreezed
class CustomWebViewWidget with _$CustomWebViewWidget implements CustomWidget {
  @override
  final isAbleToPopupMenu = false;
  @override
  final hasCustomTheme = false;
  @override
  const CustomWebViewWidget._();

  @Implements<CustomWidget>()
  factory CustomWebViewWidget({
    @Default(CustomWidgetTypeDeprecated.webViewNew)
    CustomWidgetTypeDeprecated type,
    required String id,
    required String name,
    required String? dataPoint,
    String? url,
    @Default(500) int height,
    CustomPopupmenu? customPopupmenu,
    CustomThemeForWidget? customTheme,
  }) = _CustomWebViewWidget;

  @override
  CustomWidgetSettingWidget get settingWidget {
    return CustomWebViewWidgetSettingView(customWebViewWidget: this);
  }

  @override
  List<String> get dependentDataPoints {
    return dataPoint == null ? [] : [dataPoint!];
  }

  @override
  Widget get widget {
    return CustomWebViewWidgetView(customWebViewWidget: this);
  }

  @override
  factory CustomWebViewWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomWebViewWidgetFromJson(json);

  @override
  CustomWidget clone() {
    return copyWith();
  }
}
