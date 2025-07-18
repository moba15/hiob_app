import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/table/custom_table_widget.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/settings/common/devices/state_search_bar.dart';
import 'package:smart_home/utils/widgets/map/map_order_add_setting_template.dart';
import 'package:smart_home/utils/theme.dart';

class CustomTableWidgetSettingsView extends CustomWidgetSettingStatefulWidget {
  final CustomTableWidget customTableWidget;
  const CustomTableWidgetSettingsView({
    super.key,
    required this.customTableWidget,
  });

  @override
  State<CustomTableWidgetSettingsView> createState() =>
      _CustomTableWidgetSettingsViewState();

  @override
  CustomWidget get customWidget => customTableWidget;

  @override
  CustomWidgetDeprecated get customWidgetDeprecated =>
      throw UnimplementedError();

  @override
  bool get deprecated => false;

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      throw UnimplementedError();

  @override
  bool validate() {
    return customTableWidget.columns.isNotEmpty &&
        customTableWidget.dataPoint != null;
  }
}

class _CustomTableWidgetSettingsViewState
    extends State<CustomTableWidgetSettingsView> {
  late CustomWidgetBlocCubit c;
  late TextEditingController _headerController, _initalSortColumn;

  @override
  void initState() {
    _headerController = TextEditingController(
      text: widget.customTableWidget.header,
    );
    _initalSortColumn = TextEditingController(
      text: widget.customTableWidget.initalSortColumn.toString(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _headerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    c = context.read<CustomWidgetBlocCubit>();
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          InputFieldContainer.inputContainer(
            child: StateSearchBar(onSelected: onSelect),
          ),
          InputFieldContainer.inputContainer(
            child: TextField(
              controller: TextEditingController(
                text: widget.customTableWidget.header,
              ),
              onChanged: (d) => {
                widget.customTableWidget.header = d,
                c.update(widget.customTableWidget),
              },
              decoration: const InputDecoration(
                label: Text("Header (optional)"),
              ),
            ),
          ),
          InputFieldContainer.inputContainer(
            child: MapOrderSettingTemplate<String>(
              title: const Text("Columns"),
              data: widget.customTableWidget.columns,
              onChange: (p0) {
                widget.customTableWidget.columns = p0;
                c.update(widget.customTableWidget);
              },
              toStr: (p0) {
                return p0.toString();
              },
              fromStr: (p0) {
                return p0;
              },
              alertTitle: const Text("Column"),
              alertKeyText: "Column key from json",
              alertValueText: "Column name",
              keyTileText: "Column json: ",
              valueTileText: "Column name: ",
            ),
          ),
          InputFieldContainer.inputContainer(
            child: SwitchListTile(
              title: const Text("Initial sort"),
              value: widget.customTableWidget.initialSortEnabled,
              onChanged: (value) {
                setState(() {
                  widget.customTableWidget.initialSortEnabled = value;
                });
              },
            ),
          ),
          InputFieldContainer.inputContainer(
            child: TextField(
              controller: _initalSortColumn,
              onChanged: (d) => {
                widget.customTableWidget.initalSortColumn =
                    int.tryParse(d) ?? 0,
                _initalSortColumn.text = widget
                    .customTableWidget
                    .initalSortColumn
                    .toString(),
                c.update(widget.customTableWidget),
              },
              decoration: const InputDecoration(
                label: Text("Initial sort column (optional)"),
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }

  void onSelect(IobrokerObject? ioBrokerObject) {
    widget.customTableWidget.dataPoint = ioBrokerObject?.id;
    c.update(widget.customTableWidget);
  }
}
