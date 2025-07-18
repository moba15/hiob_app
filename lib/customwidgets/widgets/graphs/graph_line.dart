import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_axis.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_widget.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/manager/manager.dart';

enum GraphLineType { normal, dotted, bar }

class GraphLine {
  String? name;
  GraphLineType? type;
  DataPoint? dataPoint;
  Color? color;
  bool? showDataDots;
  bool? background;
  int? backgroundOpacity;
  Map<int, dynamic>? data;
  GraphAxis? xAxis;
  GraphAxis? yAxis;
  String? xAxisId;
  String? yAxisId;
  int? minInterval;

  GraphLine({
    this.name,
    this.type,
    this.dataPoint,
    this.color,
    this.showDataDots,
    this.background,
    this.backgroundOpacity,
    this.data,
    this.xAxis,
    this.yAxis,
    this.xAxisId,
    this.yAxisId,
    this.minInterval,
  });

  void getData(int from, int to) {}

  void fetchData(int from, int to) {
    //TODO: Send Request to Server
  }

  void removeData(int from, int to) {}

  void removeDataExcept(int from, int to) {}

  void addData(Map<int, dynamic> dataToAdd) {
    //TODO: Check if is added
  }

  GraphLine clone() {
    return GraphLine(
      name: name,
      type: type,
      color: color,
      data: data,
      dataPoint: dataPoint,
      background: background,
      backgroundOpacity: backgroundOpacity,
      showDataDots: showDataDots,
      xAxis: xAxis,
      yAxis: yAxis,
      xAxisId: xAxisId,
      yAxisId: yAxisId,
      minInterval: minInterval,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "type": type.toString(),
      "color": color?.value,
      "data": data,
      "dataPoint": dataPoint?.id,
      "background": background,
      "backgroundOpacity": backgroundOpacity,
      "showDataDots": showDataDots,
      "xAxis": xAxis?.id,
      "yAxis": yAxis?.id,
      "minInterval": minInterval,
    };
  }

  factory GraphLine.fromJson(
    Map<String, dynamic> json,
    List<GraphAxis> xAxes,
    List<GraphAxis> yAxes,
  ) {
    DataPoint? dataPoint = Manager.instance.deviceManager
        .getIoBrokerDataPointByObjectID(json["dataPoint"] ?? "");
    if (!GraphLineType.values.any(
      (element) => element.toString() == json["type"],
    )) {
      json["type"] = GraphLineType.normal.toString();
    }
    String? yAxisId = json["yAxis"];
    String? xAxisId = json["xAxis"];

    GraphAxis? xAxis;
    if (xAxisId != null && xAxes.any((element) => element.id == xAxisId)) {
      xAxis = xAxes.firstWhere((element) => element.id == xAxisId);
    }

    GraphAxis? yAxis;
    if (yAxisId != null && yAxes.any((element) => element.id == yAxisId)) {
      yAxis = yAxes.firstWhere((element) => element.id == yAxisId);
    }
    return GraphLine(
      minInterval: json["minInterval"],
      name: json["name"],
      type: GraphLineType.values.firstWhere(
        (element) => element.toString() == json["type"],
      ),
      color: json["color"],
      data: json["data"],
      dataPoint: dataPoint,
      background: json["background"],
      backgroundOpacity: json["backgroundOpacity"],
      yAxisId: json["yAxis"],
      xAxis: xAxis,
      yAxis: yAxis,
      xAxisId: json["xAxis"],
      showDataDots: json["showDataDots"],
    );
  }

  Map<String, DateTime> getStartEnd(GraphWidget graphWidget) {
    if (graphWidget.xAxes == null || graphWidget.xAxes!.isEmpty) {
      return {};
    }

    GraphAxis xAxis =
        graphWidget.xAxes!.first; //TODO: Does not find anything!!!!!!
    if (graphWidget.xAxes!.any((element) => element.id == xAxisId)) {
      xAxis = graphWidget.xAxes!.firstWhere((element) => element.id == xAxisId);
    }
    this.xAxis = xAxis;

    return xAxis.getStartEnd();
  }

  void subHistory(GraphWidget graphWidget) {
    if (dataPoint != null) {
      Map startEndMap = getStartEnd(graphWidget);
      DateTime start = startEndMap["start"];
      DateTime end = startEndMap["end"];
      Manager.instance.historyManager.subscribeToHistorySmart(
        dataPoint!,
        start.millisecondsSinceEpoch,
        end.millisecondsSinceEpoch,
        minInterval ?? 0,
      );
    }
  }
}
