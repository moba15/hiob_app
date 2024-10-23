import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/networkplayer/settings/custom_networkplayer_widget_settings_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/networkplayer/view/custom_networkplayer_widget_view.dart';
import 'package:smart_home/device/state/state.dart';

part 'custom_networkplayer_widget.freezed.dart';
part 'custom_networkplayer_widget.g.dart';

@unfreezed
class CustomNetworkPlayerWidget
    with _$CustomNetworkPlayerWidget
    implements CustomWidget {
  @override
  final isAbleToPopupMenu = false;
  @override
  final hasCustomTheme = false;
  @override
  const CustomNetworkPlayerWidget._();

  @Implements<CustomWidget>()
  factory CustomNetworkPlayerWidget({
    @Default(CustomWidgetTypeDeprecated.webViewNew)
    CustomWidgetTypeDeprecated type,
    required String id,
    required String name,
    String? url,
    @Default(16) int height,
    @Default(9) int width,
    CustomPopupmenu? customPopupmenu,
    CustomThemeForWidget? customTheme,
  }) = _CustomNetworkPlayerWidget;

  @override
  CustomWidgetSettingWidget get settingWidget {
    return CustomNetworkPlayerWidgetSettingView(customNetworkPlayer: this);
  }

  @override
  List<DataPoint> get dependentDataPoints {
    return [];
  }

  @override
  Widget get widget {
    return CustomNetworkPlayerWidgetView(customNetworkPlayer: this);
  }

  @override
  factory CustomNetworkPlayerWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomNetworkPlayerWidgetFromJson(json);
}
