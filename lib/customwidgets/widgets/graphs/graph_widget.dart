import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_line.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_update.dart';



class GraphWidget extends CustomWidget {
  List<Axis>? xAxes;
  List<Axis>? yAxes;
  List<GraphLine>? graphLines;
  GraphUpdateType? updateType;
  GraphWidget({required String? name, required CustomWidgetType? type}) : super(name: name, type: CustomWidgetType.group, settings: {});

  @override
  CustomWidget clone() {
    throw UnimplementedError();
  }

  @override
  CustomWidgetSettingWidget get settingWidget => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  Widget get widget => throw UnimplementedError();

}