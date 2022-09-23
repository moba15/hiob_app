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


}