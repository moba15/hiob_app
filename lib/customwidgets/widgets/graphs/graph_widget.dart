import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_axis.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_line.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_update.dart';
import 'package:smart_home/customwidgets/widgets/graphs/view/graph_view.dart';
import 'package:smart_home/customwidgets/widgets/graphs/view/settings/graph_widget_settings.dart';

class GraphWidget extends CustomWidgetDeprecated {
  String? title;
  List<GraphAxis>? yAxes;
  List<GraphAxis>? xAxes;
  List<GraphLine>? graphLines;
  GraphUpdateType? updateType;
  bool? trackBall;
  GraphWidget(
      {required String? name,
      this.title,
      this.yAxes,
      this.xAxes,
      this.graphLines,
      this.updateType,
      this.trackBall})
      : super(
            name: name, type: CustomWidgetTypeDeprecated.graph, settings: {}) {
    if (graphLines != null &&
        graphLines!.isNotEmpty &&
        yAxes != null &&
        yAxes!.isNotEmpty &&
        xAxes != null &&
        xAxes!.isNotEmpty) {
      for (GraphLine graphLine in graphLines!) {
        graphLine.subHistory(this);
      }
    }
  }

  @override
  CustomWidgetDeprecated clone() {
    return GraphWidget(
        name: name,
        title: title,
        yAxes: yAxes,
        xAxes: xAxes,
        graphLines: graphLines,
        updateType: updateType,
        trackBall: trackBall);
  }

  @override
  CustomWidgetSettingWidget get settingWidget =>
      GraphWidgetSettings(graphWidget: this);

  @override
  Map<String, dynamic> toJson() {
    return {
      "type": type.toString(),
      "name": name,
      "title": title,
      "yAxes": yAxes,
      "xAxes": xAxes,
      "graphLines": graphLines,
      "updateType": updateType,
      "trackBall": trackBall,
    };
  }

  @override
  Widget get widget => GraphView(graphWidget: this);

  factory GraphWidget.fromJson(Map<String, dynamic> json) {
    List<GraphAxis> xAxes = List.of(json["xAxes"])
        .map((v) => GraphAxis.fromJson(Map.of(v)))
        .toList();
    List<GraphAxis> yAxes = List.of(json["yAxes"])
        .map((v) => GraphAxis.fromJson(Map.of(v)))
        .toList();
    return GraphWidget(
        name: json["name"],
        title: json["title"],
        yAxes: yAxes,
        xAxes: xAxes,
        graphLines: List.of(json["graphLines"] ?? [])
            .map((e) => GraphLine.fromJson(Map.of(e), xAxes, yAxes))
            .toList(),
        trackBall: json["trackBall"]);
  }

  void fetchAllData() {}

  void removeYAxis(GraphAxis a) {
    if (yAxes == null) {
      return;
    }
    yAxes!.remove(a);

    for (GraphLine line in graphLines ?? []) {
      if (line.yAxis != null && line.yAxis == a) {
        line.yAxis = null;
      }
    }
  }

  void removeXAxis(GraphAxis a) {
    if (xAxes == null) {
      return;
    }
    xAxes!.remove(a);

    for (GraphLine line in graphLines ?? []) {
      if (line.xAxis != null && line.xAxis == a) {
        line.xAxis = null;
      }
    }
  }

  @override
  CustomWidget migrate({required String id}) {
    // TODO: implement migrate
    throw UnimplementedError();
  }
}
