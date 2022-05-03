import 'package:flutter/cupertino.dart';
import 'package:smart_home/customwidgets/widgets/view/custom_webview_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/custom_webview_settings.dart';

import '../custom_widget.dart';

class CustomWebViewWidget extends CustomWidget {
  String? url;
  int height;
  bool javaScript;
  CustomWebViewWidget({required String? name, required this.url, this.height = 300, this.javaScript = false}) : super(name: name, type: CustomWidgetType.webView, settings: {});

  @override
  // TODO: implement settingWidget
  CustomWidgetSettingWidget get settingWidget => CustomWebViewWidgetSettingWidget(customWebViewWidget: this);

  @override
  Map<String, dynamic> toJson() => {
    "type": CustomWidgetType.webView.toString(),
    "name": name,
    "url": url,
    "height": height,
    "javaScript": javaScript
  };

  factory CustomWebViewWidget.fromJSON(Map<String, dynamic> json) => CustomWebViewWidget(name: json["name"], url: json["url"] ?? "", height: json["height"] ?? 300, javaScript: json["javaScript"] ?? false);

  @override
  // TODO: implement widget
  Widget get widget => CustomWebViewView(customWebViewWidget: this);

}