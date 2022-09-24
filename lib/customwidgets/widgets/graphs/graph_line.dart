import 'package:flutter/material.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

enum GraphLineType {
  normal,dotted, bar
}
class GraphLine {

  GraphLineType? type;
  DataPoint? dataPoint;
  Color? color;
  bool? showDataDots;
  bool? background;
  int? backgroundOpacity;
  Map<int, dynamic>? data;


  void getData(int from, int to) {

  }

  void fetchData(int from, int to) {
    //TODO: Send Request to Server
  }

  void removeData(int from, int to) {

  }

  void removeDataExcept(int from, int to) {

  }

  void addData(Map<int, dynamic> dataToAdd) {
    //TODO: Check if is added
  }


}