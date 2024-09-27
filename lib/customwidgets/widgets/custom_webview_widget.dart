import 'package:flutter/cupertino.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/custom_webview_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/custom_webview_settings.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/custom_webview_widget.dart'
    as new_widget;

import '../../manager/manager.dart';
import '../custom_widget.dart';

class CustomWebViewWidget extends CustomWidgetDeprecated {
  String? url;
  int height;
  bool javaScript;
  DataPoint? dataPoint;

  CustomWebViewWidget(
      {required String? name,
      required this.url,
      required this.dataPoint,
      this.height = 300,
      this.javaScript = false})
      : super(
            name: name, type: CustomWidgetTypeDeprecated.webView, settings: {});

  @override
  CustomWidgetSettingWidget get settingWidget =>
      CustomWebViewWidgetSettingWidget(customWebViewWidget: this);

  @override
  Map<String, dynamic> toJson() => {
        "type": CustomWidgetTypeDeprecated.webView.toString(),
        "name": name,
        "url": url,
        "height": height,
        "javaScript": javaScript,
        "dataPoint": dataPoint?.id,
      };

  factory CustomWebViewWidget.fromJson(Map<String, dynamic> json) {
    DataPoint? dataPoint;
    if (json["dataPoint"] != null) {
      dataPoint = Manager.instance.deviceManager
          .getIoBrokerDataPointByObjectID(json["dataPoint"] ?? "");
    } else {
      dataPoint = null;
    }
    return CustomWebViewWidget(
        name: json["name"],
        url: json["url"] ?? "",
        height: json["height"] ?? 300,
        javaScript: json["javaScript"] ?? false,
        dataPoint: dataPoint);
  }

  @override
  Widget get widget => CustomWebViewView(customWebViewWidget: this);

  @override
  CustomWidgetDeprecated clone() {
    return CustomWebViewWidget(
        name: name,
        url: url,
        height: height,
        javaScript: javaScript,
        dataPoint: dataPoint);
  }

  @override
  CustomWidget migrate({required String id, required String name}) {
    return new_widget.CustomWebViewWidget(
        id: id, name: name, dataPoint: dataPoint, url: url, height: height);
  }
}
