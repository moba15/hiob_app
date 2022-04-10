import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_light_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/bool_selection.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

import '../../../../manager/customise_manager.dart';

class CustomLightWidgetSettingWidget extends CustomWidgetSettingStatefulWidget {
  final CustomLightWidget customLightWidget;
  const CustomLightWidgetSettingWidget({Key? key, required this.customLightWidget}) : super(key: key);

  @override
  State<CustomLightWidgetSettingWidget> createState() => _CustomLightWidgetSettingWidgetState();

  @override
  CustomWidget get customWidget => customLightWidget;

  @override
  bool validate() {
    return customLightWidget.onDataPoint != null;
  }
}

class _CustomLightWidgetSettingWidgetState extends State<CustomLightWidgetSettingWidget> {
  DataPoint? _onDataPoint;

  bool _briSelected = false;
  
  
  bool _reachableSelected = false;
  final TextEditingController _displayController = TextEditingController();
  final TextEditingController _briDisplayController = TextEditingController();
  final TextEditingController _reachDisplayController = TextEditingController();
  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();
  final TextEditingController _stepController = TextEditingController();
  
  @override
  void initState() {
    _briSelected = widget.customLightWidget.briDataPoint != null;
    _reachableSelected = widget.customLightWidget.reachableDataPoint != null;
    _onDataPoint = widget.customLightWidget.onDataPoint;
    _minController.text = widget.customLightWidget.briMin.toString();
    _maxController.text = widget.customLightWidget.briMax.toString();
    _stepController.text = widget.customLightWidget.briSteps.toString();
    _briDisplayController.text = widget.customLightWidget.briDisplay;
    _reachDisplayController.text = widget.customLightWidget.reachableDisplay;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomWidgetManager customWidgetManager = context.read<CustomWidgetManager>();
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          Container(height: 20,),
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            child: const Text("Switch Datapoint:", style: TextStyle(fontSize: 16.5)),
          ),
          DeviceSelection(
            onDeviceSelected: (device) => {},
            onDataPointSelected: (dataPoint) => {widget.customLightWidget.onDataPoint = dataPoint},
            customWidgetManager: customWidgetManager,
            deviceLabel: "Switch Device",
            dataPointLabel: "Switch Datapoint",
            selectedDataPoint: _onDataPoint,
            selectedDevice: _onDataPoint?.device,
          ),

          Container(height: 20,),


          //Brightness
          BoolSelectionTemplate(
            onChange: (v)  {
              setState(() {
                _briSelected = v;
                if(!v) {
                  widget.customLightWidget.briDataPoint = null;
                }
              });
            },
            title: "Brightness:",
            startValue: _briSelected,
          ),
          if(_briSelected) ...[
            TextField(
              onChanged: (v)=> {widget.customLightWidget.briDisplay = v},
              decoration: const InputDecoration(labelText: "Brightness Display"),
              controller: _briDisplayController,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                  "Brightness Datapoint:",
                  style: TextStyle(fontSize: 16.5)
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (v)=> {widget.customLightWidget.briMin = int.tryParse(v) ?? widget.customLightWidget.briMin},
                    decoration: const InputDecoration(labelText: "Min"),
                    controller: _minController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                Container(width: 10,),
                Expanded(
                  child: TextField(
                    onChanged: (v)=> {widget.customLightWidget.briMax = int.tryParse(v) ?? widget.customLightWidget.briMax},
                    decoration: const InputDecoration(labelText: "Max"),
                    keyboardType: TextInputType.number,
                    controller: _maxController,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                Container(width: 10,),
                Expanded(
                  child: TextField(
                    onChanged: (v)=> {widget.customLightWidget.briSteps = int.tryParse(v) ?? widget.customLightWidget.briSteps},
                    decoration: const InputDecoration(labelText: "Steps"),
                    controller: _stepController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),
            DeviceSelection(
              onDeviceSelected: (device) => {},
              onDataPointSelected: (dataPoint) => {widget.customLightWidget.briDataPoint = dataPoint},
              customWidgetManager: customWidgetManager,
              deviceLabel: "Bri Device",
              dataPointLabel: "Bri Datapoint",
              selectedDataPoint: widget.customLightWidget.briDataPoint,
              selectedDevice: widget.customLightWidget.briDataPoint?.device ?? widget.customLightWidget.onDataPoint?.device,
            ),
          ],


          Container(height: 20,),
          //Reachable
          BoolSelectionTemplate(
            onChange: (v)  {
              setState(() {
                _reachableSelected = v;
                if(!v) {
                  widget.customLightWidget.reachableDataPoint = null;
                }
              });
            },
            startValue: _reachableSelected,
            title: "Reachable:",
          ),
          if(_reachableSelected) ...[
            TextField(
              onChanged: (v)=> {widget.customLightWidget.reachableDisplay = v},
              decoration: const InputDecoration(labelText: "Reachable Display"),
              controller: _reachDisplayController,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                  "Reachable Datapoint:", style: TextStyle(fontSize: 16.5)),
            ),
            DeviceSelection(
              onDeviceSelected: (device) => {},
              onDataPointSelected: (dataPoint) => {widget.customLightWidget.reachableDataPoint = dataPoint},
              customWidgetManager: customWidgetManager,
              deviceLabel: "Reachable Device",
              dataPointLabel: "Reachable Datapoint",
              selectedDataPoint: widget.customLightWidget.reachableDataPoint,
              selectedDevice: widget.customLightWidget.reachableDataPoint?.device ?? widget.customLightWidget.onDataPoint?.device,
            ),
          ]
        ],
      ),
    );
  }
}
