import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/manager/customise_manager.dart';

import '../../../../../device/device.dart';

class DeviceSelection extends StatefulWidget {
  final Function(Device?) onDeviceSelected;
  final Function(DataPoint?) onDataPointSelected;
  final CustomWidgetManager customWidgetManager;
  final String deviceLabel;
  final String dataPointLabel;
  final Device? selectedDevice;
  final DataPoint? selectedDataPoint;
  final String? preferredRole;
  const DeviceSelection(
      {
        Key? key,
        required this.onDeviceSelected,
        required this.onDataPointSelected,
        required this.customWidgetManager,
        this.deviceLabel = "Device",
        this.dataPointLabel = "Datapoint",
        this.selectedDataPoint,
        this.selectedDevice,
        this.preferredRole

      }) : super(key: key);

  @override
  State<DeviceSelection> createState() => _DeviceSelectionState();
}

class _DeviceSelectionState extends State<DeviceSelection> {
  Device? _currentDevice;
  DataPoint? _currentDataPoint;

  @override
  void initState() {
    _currentDevice = widget.selectedDevice;
    _currentDataPoint = widget.selectedDataPoint;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownSearch<Device>(
            popupTitle: Text(widget.deviceLabel, style: const TextStyle(fontSize: 17.5),),
            items: widget.customWidgetManager.manager.deviceManager.devicesList,
            itemAsString: (e) => e?.name ?? "Error",
            onChanged: (e)  {
              if(e!=_currentDevice) {
                setState(() {
                  _currentDevice = e;
                  _currentDataPoint = selectPrefDataPoint(e);
                  widget.onDataPointSelected(_currentDataPoint);
                  widget.onDeviceSelected(_currentDevice);
                });
              }

            },
            searchDelay: const Duration(seconds: 0),
            showClearButton: true,
            showAsSuffixIcons: true,
            dropdownSearchDecoration: InputDecoration(labelText: widget.deviceLabel),


            mode: Mode.BOTTOM_SHEET,
            showSearchBox: true,
            selectedItem: _currentDevice,
          ),
        ),
        Container(width: 10,),
        Expanded(
          child: DropdownSearch<DataPoint>(
            popupTitle: Text(widget.dataPointLabel, style: const TextStyle(fontSize: 17.5),),
            items: _currentDevice?.dataPoints ?? [],
            itemAsString: (e) => e?.name ?? "Error",
            onChanged: (e) =>{
              _currentDataPoint = e,
              widget.onDataPointSelected(_currentDataPoint)
            },
            showClearButton: true,
            showAsSuffixIcons: true,
            dropdownSearchDecoration:  InputDecoration(labelText: widget.dataPointLabel),
            mode: Mode.BOTTOM_SHEET,
            showSearchBox: true,
            selectedItem: _currentDataPoint,
          ),
        )
      ],
    );
  }

  DataPoint? selectPrefDataPoint(Device? device) {
    print("ok");
    if(widget.preferredRole == null) {
      print("ok2");
      return null;
    }
    for(DataPoint d in device?.dataPoints ?? []) {
      print("select " + d.role.toString());
      if(d.role == widget.preferredRole) {

        return d;
      }
    }
    return null;
  }
}
