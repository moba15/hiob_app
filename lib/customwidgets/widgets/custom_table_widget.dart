import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/custom_table_widget_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/custom_table_settings.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/manager/manager.dart';

class CustomTableWidget extends CustomWidget {
  DataPoint? dataPoint;
  String header;
  bool sortAsc;
  int initialSortColumn;
  bool initialSortEnabled;
  int elementsPerPage;
  Map<String, String> columns;

  CustomTableWidget(
      {required String? name,
      required this.header,
      required this.sortAsc,
      required this.initialSortColumn,
      required this.initialSortEnabled,
      required this.elementsPerPage,
      required this.columns,
      this.dataPoint})
      : super(name: name, type: CustomWidgetType.table, settings: {});

  @override
  CustomWidget clone() => CustomTableWidget(
      name: name,
      header: header,
      sortAsc: sortAsc,
      initialSortColumn: initialSortColumn,
      initialSortEnabled: initialSortEnabled,
      elementsPerPage: elementsPerPage,
      dataPoint: dataPoint,
      columns: columns);

  @override
  CustomWidgetSettingWidget get settingWidget =>
      CustomTableSettings(customTableWidget: this);

  @override
  Map<String, dynamic> toJson() => {
        "type": type.toString(),
        "name": name,
        "header": header,
        "sortAsc": sortAsc,
        "initialSortColumn": initialSortColumn,
        "initialSortEnabled": initialSortEnabled,
        "elementsPerPage": elementsPerPage,
        "dataPoint": dataPoint?.id,
        "columns": columns
      };

  factory CustomTableWidget.fromJson(Map<String, dynamic> json) {
    return CustomTableWidget(
        name: json["name"],
        header: json["header"],
        sortAsc: json["sortAsc"],
        initialSortColumn: json["initialSortColumn"],
        initialSortEnabled: json["initialSortEnabled"],
        elementsPerPage: json["elementsPerPage"],
        dataPoint: Manager.instance.deviceManager
            .getIoBrokerDataPointByObjectID(json["dataPoint"] ?? ""),
        columns: Map<String, String>.from(json["columns"]));
  }

  @override
  Widget get widget => CustomTableWidgetView(customTableWidget: this);
}
