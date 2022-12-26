import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_axis.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_line.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';

class LineSettingsPage extends StatelessWidget {
  final GraphWidget graphWidget;
  final GraphLine graphLine;
  final Function(GraphLine) onSave;
  const LineSettingsPage({Key? key, required this.graphWidget, required this.graphLine, required this.onSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Graph Line"),

      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () => _save(context),
      ),
      body: _LineSettingsBody(graphWidget: graphWidget, graphLine: graphLine),
    );
  }

  bool _validate() {
    //TODO: Validate
    return true;
  }

  void _save(BuildContext c) {
    if(_validate()) {
      Navigator.pop(c);
      onSave(graphLine);
    }

  }
}

class _LineSettingsBody extends StatelessWidget {
  final GraphWidget graphWidget;
  final GraphLine graphLine;
  const _LineSettingsBody({Key? key, required this.graphWidget, required this.graphLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: ListView(
        children: [
          TextFormField(
            onChanged: (v) => graphLine.name = v,
            decoration: const InputDecoration(
              labelText: "Name"
            ),
            initialValue: graphLine.name,
          ),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState)  {
              return DeviceSelection(
                selectedDataPoint: graphLine.dataPoint,
                selectedDevice: graphLine.dataPoint?.device,
                onDeviceSelected: (d)  {
                  setState(() =>  graphLine.dataPoint = null);
                },
                onDataPointSelected: (d) => graphLine.dataPoint = d,
                customWidgetManager: Manager.instance!.customWidgetManager,


              );
            },
          ),
          _buildGraphLineTypeSelector(),
          _buildAxisSelection(),
          TextFormField(
            initialValue: graphLine.minInterval?.toString() ?? "60",
            onChanged: (v)  {
              if(v.isEmpty) {
                graphLine.minInterval = 1;
              } else {
                graphLine.minInterval = int.tryParse(v) ?? 1;
              }
            },
            decoration: const InputDecoration(
                labelText: "Min time for next Update"
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),


          StatefulBuilder(

            builder: (context, setState) {
              return SwitchListTile(
                title: const Text("Show Datapoints"),
                value: graphLine.showDataDots ?? false,
                onChanged: (v) {
                  setState(() => {
                    graphLine.showDataDots = v
                  });
                } ,

              );
            },
          ),








          //TODO: Color picker
        ],
      ),
    );
  }

  Widget _buildGraphLineTypeSelector() {
    return DropdownSearch<GraphLineType>(
      popupProps:   PopupProps.menu(
        showSelectedItems: true,
        disabledItemFn: (f) => f == GraphLineType.bar
      ),

      compareFn: (i, i1) => i==i1,

      itemAsString: (i) => i.toString(),
      items: GraphLineType.values,
      onChanged: (v) => graphLine.type = v,
      selectedItem: graphLine.type,
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: "Line Type"
        )
      ),

    );
  }

  Widget _buildAxisSelection() {
    return Row(
      children: [
        Expanded(
          child: DropdownSearch<GraphAxis>(
            items: graphWidget.xAxes ?? [],
            popupProps:   const PopupProps.menu(
                showSelectedItems: true,
            ),
            itemAsString: (i) => i.description ?? "No Name found",
            compareFn: (i, i2) => i == i2,
            dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    labelText: "X axes"
                )
            ),
            onChanged: (v) => {graphLine.xAxis = v, graphLine.xAxisId = v?.id},
            selectedItem: graphLine.xAxis,

          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
        ),
        Expanded(
          child: DropdownSearch<GraphAxis>(
            items: graphWidget.yAxes ?? [], 
            popupProps:   const PopupProps.menu(
              showSelectedItems: true,
            ),
            itemAsString: (i) => i.description ?? "No Name found",
            compareFn: (i, i2) => i == i2,
            dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    labelText: "Y axes"
                )
            ),
            onChanged: (v) => {graphLine.yAxis = v, graphLine.yAxisId = v?.id},
            selectedItem: graphLine.yAxis,

          ),
        )
      ],
    );
  }
}

