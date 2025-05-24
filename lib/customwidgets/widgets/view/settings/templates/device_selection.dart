import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/generated/state/state.pb.dart' as grpc;
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/manager/manager.dart';

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
      {super.key,
      required this.onDeviceSelected,
      required this.onDataPointSelected,
      required this.customWidgetManager,
      this.deviceLabel = "Device",
      this.dataPointLabel = "Datapoint",
      this.selectedDataPoint,
      this.selectedDevice,
      this.preferredRole});

  @override
  State<DeviceSelection> createState() => _DeviceSelectionState();
}

class _DeviceSelectionState extends State<DeviceSelection> {
  Device? _currentDevice;
  DataPoint? _currentDataPoint;
  StreamController<grpc.SearchStateRequest>? searchInputStream;
  Stream<grpc.SearchStateResponse>? searchOutputStream;
  List<String> items = [];

  @override
  void initState() {
    _currentDevice = widget.selectedDevice;
    _currentDataPoint = widget.selectedDataPoint;
    searchInputStream = StreamController();

    searchOutputStream =
        Manager().deviceManager.startSearch(searchInputStream!.stream);
    searchOutputStream!.listen(
      (event) {
        _onResult(event);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    searchInputStream!.close();
    super.dispose();
  }
  // ignore: slash_for_doc_comments
  /**
   * Row(
      children: [

        Expanded(
          child: DropdownSearch<Device>(
            popupProps: PopupProps.modalBottomSheet(
                showSelectedItems: true,
                title: Text(
                  widget.deviceLabel,
                  style: const TextStyle(fontSize: 17.5),
                ),
                showSearchBox: true,
                isFilterOnline: false,
                searchDelay: const Duration(seconds: 0),
                modalBottomSheetProps: ModalBottomSheetProps(
                    backgroundColor: Theme.of(context).colorScheme.surface)),
            //popupTitle: Text(widget.deviceLabel, style: const TextStyle(fontSize: 17.5),),
            items: widget.customWidgetManager.manager.deviceManager.devicesList,
            itemAsString: (e) => e.name,
            onChanged: (e) {
              if (e != _currentDevice) {
                setState(() {
                  _currentDevice = e;
                  _currentDataPoint = selectPrefDataPoint(e);
                  widget.onDataPointSelected(_currentDataPoint);
                  widget.onDeviceSelected(_currentDevice);
                });
              }
            },
            filterFn: (d, s) {
              return d.id.toLowerCase().contains(s.toLowerCase()) ||
                  d.name.toLowerCase().contains(s.toLowerCase());
            },
            compareFn: (d, d1) {
              return d.id == d1.id;
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: widget.deviceLabel,
              ),
            ),

            /*searchDelay: const Duration(seconds: 0),
            showClearButton: true,
            showAsSuffixIcons: true,
            dropdownSearchDecoration: InputDecoration(labelText: widget.deviceLabel),


            mode: Mode.BOTTOM_SHEET,
            showSearchBox: true, */
            selectedItem: _currentDevice,
          ),
        ),
        Container(
          width: 10,
        ),
        Expanded(
          child: DropdownSearch<DataPoint>(
            popupProps: PopupProps.modalBottomSheet(
              modalBottomSheetProps: ModalBottomSheetProps(
                  backgroundColor: Theme.of(context).colorScheme.surface),
              showSelectedItems: true,
              searchDelay: const Duration(seconds: 0),
              showSearchBox: true,
              title: Text(
                widget.dataPointLabel,
                style: const TextStyle(fontSize: 17.5),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: widget.dataPointLabel,
              ),
            ),
            items: _currentDevice?.dataPoints ?? [],
            itemAsString: (e) {
              String name = e.name;
              String? sName = e.getInformation("name");
              if (sName != null) {
                name += " ($sName)";
              }
              return name;
            },
            onChanged: (e) => {
              _currentDataPoint = e,
              widget.onDataPointSelected(_currentDataPoint)
            },
            clearButtonProps: const ClearButtonProps(isVisible: true),
            filterFn: (d, s) {
              return d.id.toLowerCase().contains(s.toLowerCase()) ||
                  d.name.toLowerCase().contains(s.toLowerCase());
            },
            compareFn: (d, d1) {
              return d.id == d1.id;
            },
            /*showClearButton: true,
            showAsSuffixIcons: true,
            dropdownSearchDecoration:  InputDecoration(labelText: widget.dataPointLabel),
            mode: Mode.BOTTOM_SHEET,
            showSearchBox: true,*/
            selectedItem: _currentDataPoint,
          ),
        )
      ],
    );
   */

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }

  _onResult(grpc.SearchStateResponse resp) {
    setState(() {
      items = resp.states.map((e) => e.stateId).toList();
    });
  }

  DataPoint? selectPrefDataPoint(Device? device) {
    if (widget.preferredRole == null) {
      return null;
    }
    for (DataPoint d in device?.dataPoints ?? []) {
      if (d.role == widget.preferredRole) {
        return d;
      }
    }
    return null;
  }
}
