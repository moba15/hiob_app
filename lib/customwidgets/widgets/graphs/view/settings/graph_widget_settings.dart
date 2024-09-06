// ignore_for_file: must_be_immutable
//TODO: Only temp

import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_axis.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_line.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_widget.dart';
import 'package:smart_home/customwidgets/widgets/graphs/view/settings/axis_settings.dart';
import 'package:smart_home/customwidgets/widgets/graphs/view/settings/line_settings.dart';
import 'package:smart_home/manager/manager.dart';

class GraphWidgetSettings extends CustomWidgetSettingStatefulWidget {
  final GraphWidget graphWidget;
  const GraphWidgetSettings({Key? key, required this.graphWidget})
      : super(key: key);

  @override
  State<GraphWidgetSettings> createState() => _GraphWidgetSettingsState();

  @override
  CustomWidgetDeprecated get customWidgetDeprecated => graphWidget;

  @override
  CustomWidget get customWidget => throw UnimplementedError();

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      throw UnimplementedError();

  @override
  bool validate() {
    return true;
  }

  @override
  bool get deprecated => true;
}

class _GraphWidgetSettingsState extends State<GraphWidgetSettings> {
  final GlobalKey g = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Showcase(
              key: g,
              title: "Title",
              description: "Title of the Graph",
              child: TextField(
                onChanged: (v) => {
                  widget.graphWidget.title = v,
                  if (v.isEmpty) widget.graphWidget.title = null
                },
                controller:
                    TextEditingController(text: widget.graphWidget.title),
                decoration:
                    const InputDecoration(labelText: "Title (Optional)"),
              ),
            ),
            Container(
              height: 20,
            ),
            _buildXAxisTile(),
            Container(
              height: 20,
            ),
            _buildYAxisTile(),
            _LineExpansionTile(graphWidget: widget.graphWidget),
            SwitchListTile(
              value: widget.graphWidget.trackBall ?? false,
              onChanged: (v) {
                setState(() {
                  widget.graphWidget.trackBall = v;
                });
              },
              title: const Text("Tracking ball"),
            )
          ],
        ));
  }

  //TODO: Extract in class
  Widget _buildXAxisTile() {
    return ExpansionTile(
      title: const Text("Y Axis"),
      children: [
        for (GraphAxis a in widget.graphWidget.yAxes ?? [])
          Dismissible(
            onDismissed: (dir) {
              setState(() {
                widget.graphWidget.removeYAxis(a);
              });
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: const Icon(Icons.delete_forever),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: const Icon(Icons.delete_forever),
              ),
            ),
            direction: DismissDirection.endToStart,
            key: ValueKey(a),
            child: _AxisListTile(
                axis: a,
                onSave: (axis) {
                  setState(() {
                    int id = widget.graphWidget.yAxes
                            ?.indexWhere((element) => element.id == a.id) ??
                        0;
                    widget.graphWidget.yAxes?[id] = axis;
                  });
                },
                graphWidget: widget.graphWidget),
          ),
        ElevatedButton(
          onPressed: widget.graphWidget.yAxes == null ||
                  widget.graphWidget.yAxes!.length < 2
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AxisSettingsPage(
                            graphWidget: widget.graphWidget,
                            graphAxis:
                                GraphAxis(dataType: AxisDataType.numbers),
                            onSave: (axis) {
                              String id = Manager.instance.getRandString(6);
                              widget.graphWidget.yAxes ??= [];
                              while (widget.graphWidget.yAxes!
                                  .any((element) => element.id == id)) {
                                id = Manager.instance.getRandString(6);
                              }
                              axis.id = id;

                              setState(() {
                                widget.graphWidget.yAxes!.add(axis);
                              });
                            })),
                  );
                }
              : null,
          child: const Text("Add Y Axis"),
        )
      ],
    );
  }

  //TODO: Extract in class
  Widget _buildYAxisTile() {
    return ExpansionTile(
      title: const Text("X Axis"),
      children: [
        for (GraphAxis a in widget.graphWidget.xAxes ?? [])
          Dismissible(
            onDismissed: (dir) {
              setState(() {
                widget.graphWidget.removeXAxis(a);
              });
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: const Icon(Icons.delete_forever),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: const Icon(Icons.delete_forever),
              ),
            ),
            direction: DismissDirection.endToStart,
            key: ValueKey(a),
            child: _AxisListTile(
                axis: a,
                onSave: (axis) {
                  setState(() {
                    int id = widget.graphWidget.xAxes
                            ?.indexWhere((element) => element.id == a.id) ??
                        0;
                    widget.graphWidget.xAxes?[id] = axis;
                  });
                },
                graphWidget: widget.graphWidget),
          ),
        ElevatedButton(
          onPressed: widget.graphWidget.xAxes == null ||
                  widget.graphWidget.xAxes!.length < 2
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AxisSettingsPage(
                            graphWidget: widget.graphWidget,
                            graphAxis: GraphAxis(dataType: AxisDataType.time),
                            onSave: (axis) {
                              String id = Manager.instance.getRandString(6);
                              widget.graphWidget.xAxes ??= [];
                              while (widget.graphWidget.xAxes!
                                  .any((element) => element.id == id)) {
                                id = Manager.instance.getRandString(6);
                              }
                              axis.id = id;

                              setState(() {
                                widget.graphWidget.xAxes!.add(axis);
                              });
                            })),
                  );
                }
              : null,
          child: const Text("Add X Axis"),
        )
      ],
    );
  }
}

//TODO: Implement clone function and replace the edited element in the list!

class _AxisListTile extends StatelessWidget {
  final GraphAxis axis;
  final Function(GraphAxis) onSave;
  final GraphWidget graphWidget;
  const _AxisListTile(
      {Key? key,
      required this.axis,
      required this.onSave,
      required this.graphWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(axis.description ?? ""),
      trailing: const Icon(Icons.navigate_next),
      subtitle: Text(axis.dataType.toString()),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AxisSettingsPage(
                    graphWidget: graphWidget,
                    graphAxis: axis.clone(),
                    onSave: onSave)));
      },
    );
  }
}

class _GraphLineListTile extends StatelessWidget {
  final GraphWidget graphWidget;
  final GraphLine line;
  final Function(GraphLine) onSave;
  const _GraphLineListTile(
      {Key? key,
      required this.line,
      required this.graphWidget,
      required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(line.name ?? "No Name Set"),
      trailing: const Icon(Icons.navigate_next),
      subtitle: Text(line.dataPoint?.id ?? "No Device Selected"),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LineSettingsPage(
                    graphWidget: graphWidget,
                    graphLine: line.clone(),
                    onSave: onSave)));
      },
    );
  }
}

class _LineExpansionTile extends StatefulWidget {
  final GraphWidget graphWidget;
  GraphLine? graphLine;
  _LineExpansionTile({Key? key, required this.graphWidget}) : super(key: key);

  @override
  State<_LineExpansionTile> createState() => _LineExpansionTileState();
}

class _LineExpansionTileState extends State<_LineExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: widget.key,
      title: const Text("Lines"),
      children: [
        for (GraphLine a in widget.graphWidget.graphLines ?? [])
          _GraphLineListTile(
              line: a.clone(),
              graphWidget: widget.graphWidget,
              onSave: (v) {
                int index = widget.graphWidget.graphLines!
                    .indexWhere((element) => element.name == (a.name));
                setState(() {
                  widget.graphWidget.graphLines![index] = v;
                });
              }),
        ElevatedButton(
          child: const Text("Add Line"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LineSettingsPage(
                        graphWidget: widget.graphWidget,
                        graphLine: widget.graphLine ?? GraphLine(),
                        onSave: (c) {
                          setState(() {
                            widget.graphWidget.graphLines ??= [];
                            widget.graphWidget.graphLines!.add(c);
                          });
                        })));
          },
        )
      ],
    );
  }
}
