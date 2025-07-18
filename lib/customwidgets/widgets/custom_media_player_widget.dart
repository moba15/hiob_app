import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/custom_media_player_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/custom_medial_player_settings.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/networkplayer/custom_networkplayer_widget.dart'
    as new_widget;

class CustomMediaPlayerWidget extends CustomWidgetDeprecated {
  String? url;
  int width = 16;
  int height = 9;
  CustomMediaPlayerWidget({
    required String? name,
    required this.url,
    this.width = 16,
    this.height = 9,
  }) : super(
         name: name,
         type: CustomWidgetTypeDeprecated.mediaPlayer,
         settings: {},
       );

  factory CustomMediaPlayerWidget.fromJSON(Map<String, dynamic> json) {
    return CustomMediaPlayerWidget(
      name: json["name"],
      url: json["url"],
      width: json["width"] ?? 16,
      height: json["height"] ?? 9,
    );
  }

  @override
  CustomWidgetDeprecated clone() {
    return CustomMediaPlayerWidget(
      name: name,
      url: url,
      width: width,
      height: height,
    );
  }

  @override
  CustomWidgetSettingWidget get settingWidget =>
      CustomMediaPlayerSettings(customMediaPlayerWidget: this);

  @override
  Map<String, dynamic> toJson() {
    return {
      "url": url,
      "type": type.toString(),
      "height": height,
      "width": width,
    };
  }

  @override
  Widget get widget =>
      CustomMediaPlayerWidgetView(customMediaPlayerWidget: this);

  @override
  CustomWidget migrate({required String id, required String name}) {
    return new_widget.CustomNetworkPlayerWidget(
      id: id,
      name: name,
      height: height,
      url: url,
      width: width,
    );
  }
}
