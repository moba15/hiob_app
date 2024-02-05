import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_axis.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_line.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_widget.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/manager/history/bloc/history_data_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphView extends StatefulWidget {
  final GraphWidget graphWidget;
  const GraphView({Key? key, required this.graphWidget}) : super(key: key);

  @override
  State<GraphView> createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  int test = 0;
  List<LineSeries<_ChartData, DateTime>> mainSeries = [];
  HistoryDataBloc? historyDataBloc;
  @override
  Widget build(BuildContext context) {
    if (widget.graphWidget.xAxes == null ||
        widget.graphWidget.yAxes == null ||
        widget.graphWidget.xAxes!.isEmpty ||
        widget.graphWidget.yAxes!.isEmpty) {
      return const Text("Error 404");
    }
    historyDataBloc ??= HistoryDataBloc(
        dataPoint: widget.graphWidget.graphLines!.first.dataPoint!);
    return BlocBuilder(
      bloc: historyDataBloc,
      builder: (BuildContext context, state) {
        return SfCartesianChart(
          title: ChartTitle(text: widget.graphWidget.title ?? "No Title set"),
          primaryXAxis: _getPrimaryXAxis(),
          primaryYAxis: _getPrimaryYAxis(),
          series: getSeries(),
          tooltipBehavior: TooltipBehavior(enable: false),
          axes: _getAxes(),
          trackballBehavior: TrackballBehavior(
            enable: widget.graphWidget.trackBall ?? false,
            activationMode: ActivationMode.singleTap,
            tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
            lineType: TrackballLineType.vertical,
            shouldAlwaysShow: true,
          ),
        );
      },
    );
  }

  List<LineSeries<_ChartData, DateTime>> getSeries() {
    List<LineSeries<_ChartData, DateTime>> series = [];

    for (GraphLine graphLine in widget.graphWidget.graphLines ?? []) {
      if (graphLine.dataPoint == null) {
        continue;
      }

      Map startEndMap = graphLine.getStartEnd(widget.graphWidget);
      int start = startEndMap["start"].millisecondsSinceEpoch;
      int end = startEndMap["end"]
          .add(const Duration(seconds: 2))
          .millisecondsSinceEpoch;
      DataPoint dataPoint = graphLine.dataPoint!;
      List<int> timeKeys = dataPoint.historyData.loadedHistory.keys
          .where((element) => element >= start && element <= end)
          .toList();

      List<_ChartData> data = [];
      for (int time in timeKeys) {
        if (dataPoint.historyData.loadedHistory[time] != null) {
          data.add(_ChartData(DateTime.fromMillisecondsSinceEpoch(time),
              dataPoint.historyData.loadedHistory[time]?.toDouble() ?? 0.0));
        }
      }

      series.add(LineSeries<_ChartData, DateTime>(
        name: graphLine.name ?? "Line 0",
        xAxisName: graphLine.xAxisId,
        yAxisName: graphLine.yAxisId,
        dataSource: data,
        xValueMapper: (c, index) => c.x,
        yValueMapper: (c, index) => c.y,
        width: 3,
        markerSettings:
            MarkerSettings(isVisible: graphLine.showDataDots ?? false),
      ));
    }

    return series;
  }

  NumericAxis _getPrimaryYAxis() {
    GraphAxis primaryYAxis = widget.graphWidget.yAxes!.first;
    int? min = primaryYAxis.min;
    int? max = primaryYAxis.max;
    int? interval = primaryYAxis.dataInterval;

    return NumericAxis(
      name: primaryYAxis.id,
      minimum: min?.toDouble(),
      maximum: max?.toDouble(),
      interval: interval?.toDouble(),
    );
  }

  DateTimeAxis _getPrimaryXAxis() {
    GraphAxis primaryXAxis = widget.graphWidget.xAxes!.first;
    Map startEndMap = primaryXAxis.getStartEnd();

    //if(widget.graphWidget.graphLines != null && widget.graphWidget.graphLines!.isNotEmpty && test == 0) {
    //_subToPrimary(widget.graphWidget.graphLines!.first.dataPoint!, start, end);
    //}

    return DateTimeAxis(
        maximum: startEndMap["end"]
            .add(const Duration(seconds: 2, milliseconds: 500)),
        minimum: startEndMap["start"],
        name: primaryXAxis.description);
  }

  List<ChartAxis> _getAxes() {
    List<ChartAxis> axes = [];
    int i = 0;
    for (GraphAxis graphAxis in widget.graphWidget.yAxes ?? []) {
      if (i == 0) {
        i++;
        continue;
      }

      axes.add(NumericAxis(
        name: graphAxis.id,
        minimum: graphAxis.min?.toDouble(),
        maximum: graphAxis.max?.toDouble(),
        interval: graphAxis.dataInterval?.toDouble(),
        opposedPosition: true,
      ));
    }
    i = 0;
    for (GraphAxis graphAxis in widget.graphWidget.xAxes ?? []) {
      if (i == 0) {
        i++;
        continue;
      }

      axes.add(DateTimeAxis(
        name: graphAxis.id,
        minimum: graphAxis.getStartEnd()["start"],
        maximum: graphAxis.getStartEnd()["end"],
        opposedPosition: true,
      ));
    }
    return axes;
  }
}

class _ChartData {
  final DateTime x;
  final dynamic y;
  _ChartData(this.x, this.y);
}
