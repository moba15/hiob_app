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
    throw UnsupportedError("Not supported anymore");
  }

  void subHistory(GraphWidget graphWidget) {
    throw UnsupportedError("Not supported anymore");
  }
}
