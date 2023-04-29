import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/templates/map_order_add_setting_template.dart';
import 'package:smart_home/customwidgets/widgets/custom_table_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/utils/theme.dart';

import '../../../../manager/manager.dart';

class CustomTableSettings extends CustomWidgetSettingStatefulWidget {
  final CustomTableWidget customTableWidget;
  final GlobalKey headerKey = GlobalKey();
  final GlobalKey elementsPerPageKey = GlobalKey();
  final GlobalKey initialSortKey = GlobalKey();
  final GlobalKey dataPointKey = GlobalKey();
  final GlobalKey columnsKey = GlobalKey();

  CustomTableSettings({Key? key, required this.customTableWidget})
      : super(key: key);

  @override
  State<CustomTableSettings> createState() => _CustomTableSettingsState();

  @override
  CustomWidget get customWidget => customTableWidget;

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      [headerKey, elementsPerPageKey, initialSortKey, dataPointKey, columnsKey];

  @override
  bool validate() {
    return customTableWidget.header.isNotEmpty &&
        customTableWidget.dataPoint != null;
  }
}

class _CustomTableSettingsState extends State<CustomTableSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          Showcase(
              key: widget.headerKey,
              title: "Header",
              description: "The Header will be displayed above the Table",
              child: InputFieldContainer.inputContainer(
                widget: TextFormField(
                  initialValue: widget.customTableWidget.header,
                  onChanged: (s) => widget.customTableWidget.header = s,
                  decoration: const InputDecoration(labelText: "Header"),
                ),
              )),
          Showcase(
              key: widget.elementsPerPageKey,
              title: "Elements per Page",
              description:
                  "How many Rows does one Page contains (Set it to 0 to show all Elements on the first page)",
              child: InputFieldContainer.inputContainer(
                widget: TextFormField(
                  initialValue:
                      widget.customTableWidget.elementsPerPage.toString(),
                  onChanged: (s) {
                    widget.customTableWidget.elementsPerPage =
                        int.tryParse(s) ?? 0;
                  },
                  decoration: const InputDecoration(
                      labelText: "Elements per Page ", hintText: "0: All"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              )),
          Showcase(
            key: widget.initialSortKey,
            title: "Initial sort",
            description: "If the table should be sorted initially",
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Initial sort: ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Checkbox(
                      value: widget.customTableWidget.initialSortEnabled,
                      onChanged: (d) {
                        setState(() {
                          widget.customTableWidget.initialSortEnabled =
                              d ?? false;
                        });
                      }),
                ],
              ),
            ),
          ),
          Row(
            children: [
              if (widget.customTableWidget.initialSortEnabled)
                Expanded(
                  flex: 40,
                  child: Row(
                    children: [
                      const Text(
                        "Ascending: ",
                        style: TextStyle(fontSize: 17),
                      ),
                      Checkbox(
                          value: widget.customTableWidget.sortAsc,
                          onChanged: (d) {
                            setState(() {
                              widget.customTableWidget.sortAsc = d ?? false;
                            });
                          }),
                    ],
                  ),
                ),
              if (widget.customTableWidget.initialSortEnabled)
                Expanded(
                  flex: 60,
                  child: TextFormField(
                    initialValue:
                        widget.customTableWidget.initialSortColumn.toString(),
                    onChanged: (s) {
                      widget.customTableWidget.initialSortColumn =
                          int.tryParse(s) ?? 0;
                    },
                    decoration: const InputDecoration(labelText: "Column"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                )
            ],
          ),
          Showcase(
            key: widget.dataPointKey,
            title: "Datapoint",
            description: "The Datapoint which contains the table data",
            child: DeviceSelection(
              onDataPointSelected: (d) =>
                  widget.customTableWidget.dataPoint = d,
              selectedDataPoint: widget.customTableWidget.dataPoint,
              selectedDevice: widget.customTableWidget.dataPoint?.device,
              onDeviceSelected: (d) {
                if (d == null) {
                  widget.customTableWidget.dataPoint = null;
                }
              },
              customWidgetManager: Manager.instance!.customWidgetManager,
            ),
          ),
          Showcase(
            key: widget.columnsKey,
            title: "Columns",
            description:
                "Here you setup the different Columns (and their names), you want to see and how they are called in the json format",
            child: MapOrderSettingTemplate<String>(
              title: const Text("Columns"),
              data: widget.customTableWidget.columns,
              alertKeyText: "Column key from json ",
              alertValueText: "Column name",
              alertTitle: const Text("Add new Column"),
              fromStr: (s) => s,
              onChange: (data) => widget.customTableWidget.columns = data,
              toStr: (v) => v ?? "",
              keyTileText: "Json Key: ",
              valueTileText: "Column: ",
            ),
          ),
        ],
      ),
    );
  }
}
