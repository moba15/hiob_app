import 'package:flutter/material.dart';

enum AxisType { X, Y }

enum AxisDataType { numbers, time }

enum TimeAxisEnd { now, month, day, minute, hour, week, year }

enum UnitOfTime { second, minute, hour, day, month, year }

class GraphAxis {
  String? id;

  String? description;
  AxisDataType? dataType;
  Color? color;

  int? dataInterval;
  int? max;
  int? min;

  TimeAxisEnd timeAxisEnd = TimeAxisEnd.now;

  int scope = 1;
  UnitOfTime scopeUnit = UnitOfTime.hour;

  GraphAxis(
      {this.id,
      this.description,
      this.dataType,
      this.color,
      this.dataInterval,
      this.max,
      this.min,
      this.timeAxisEnd = TimeAxisEnd.now,
      this.scope = 1,
      this.scopeUnit = UnitOfTime.hour});

  GraphAxis clone() => GraphAxis(
      description: description,
      dataType: dataType,
      dataInterval: dataInterval,
      max: max,
      min: min,
      color: color,
      id: id,
      timeAxisEnd: timeAxisEnd,
      scope: scope,
      scopeUnit: scopeUnit);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "description": description,
      "dataType": dataType.toString(),
      "color": color?.value,
      "dataInterval": dataInterval,
      "max": max,
      "min": min,
      "timeAxisEnd": timeAxisEnd.toString(),
      "scope": scope,
      "scopeUnit": scopeUnit.toString(),
    };
  }

  factory GraphAxis.fromJson(Map<String, dynamic> json) {
    return GraphAxis(
        id: json["id"],
        description: json["description"],
        dataType: AxisDataType.values
            .firstWhere((element) => element.toString() == json["dataType"]),
        color: json["color"],
        dataInterval: json["dataInterval"],
        max: json["max"],
        min: json["min"],
        timeAxisEnd: TimeAxisEnd.values
            .firstWhere((element) => element.toString() == json["timeAxisEnd"]),
        scopeUnit: UnitOfTime.values
            .firstWhere((element) => element.toString() == json["scopeUnit"]),
        scope: json["scope"]);
  }

  Map<String, DateTime> getStartEnd() {
    DateTime start;
    DateTime end;

    switch (timeAxisEnd) {
      case TimeAxisEnd.now:
        end = DateTime.now();

        break;
      default:
        throw Exception("Not Implemented yet");
    }

    switch (scopeUnit) {
      case UnitOfTime.minute:
        start = end.subtract(Duration(minutes: scope));
        break;
      case UnitOfTime.second:
        start = end.subtract(Duration(seconds: scope));
        break;
      case UnitOfTime.hour:
        start = end.subtract(Duration(hours: scope));
        break;
      case UnitOfTime.day:
        start = end.subtract(Duration(days: scope));
        break;

      case UnitOfTime.month:
        start = end.subtract(Duration(days: scope * 30));
        break;
      case UnitOfTime.year:
        start = end.subtract(Duration(days: 365 * scope));
    }

    return {"start": start, "end": end};
  }
}
