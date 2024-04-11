import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/custom_media_player_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/custom_medial_player_settings.dart';

class CustomMediaPlayerWidget extends CustomWidget {
  String? url;
  int width = 16;
  int height = 9;
  CustomMediaPlayerWidget(
      {required String? name,
      required this.url,
      this.width = 16,
      this.height = 9})
      : super(name: name, type: CustomWidgetType.mediaPlayer, settings: {});

  factory CustomMediaPlayerWidget.fromJSON(Map<String, dynamic> json) {
    return CustomMediaPlayerWidget(
        name: json["name"],
        url: json["url"],
        width: json["width"] ?? 16,
        height: json["height"] ?? 9);
  }

  @override
  CustomWidget clone() {
    return CustomMediaPlayerWidget(
        name: name, url: url, width: width, height: height);
  }

  @override
  CustomWidgetSettingWidget get settingWidget => CustomMediaPlayerSettings(
        customMediaPlayerWidget: this,
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      "url": url,
      "type": type.toString(),
      "height": height,
      "width": width
    };
  }

  @override
  Widget get widget => CustomMediaPlayerWidgetView(
        customMediaPlayerWidget: this,
      );
}
