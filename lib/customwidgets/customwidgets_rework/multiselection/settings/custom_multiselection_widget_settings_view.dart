import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/custom_multiselection_widget.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/settings/common/devices/state_search_bar.dart';
import 'package:smart_home/utils/widgets/map/map_order_add_setting_template.dart';
import 'package:smart_home/utils/theme.dart';

class CustomMultiselectionWidgetSettingsView
    extends CustomWidgetSettingStatefulWidget {
  final CustomMultiselectionWidget customMultiselectionWidget;
  const CustomMultiselectionWidgetSettingsView({
    super.key,
    required this.customMultiselectionWidget,
  });

  @override
  State<CustomMultiselectionWidgetSettingsView> createState() =>
      _CustomTableWidgetSettingsViewState();

  @override
  CustomWidget get customWidget => customMultiselectionWidget;

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
    return customMultiselectionWidget.selections.isNotEmpty &&
        customMultiselectionWidget.dataPoint != null;
  }
}

class _CustomTableWidgetSettingsViewState
    extends State<CustomMultiselectionWidgetSettingsView> {
  late CustomWidgetBlocCubit c;
  late TextEditingController _headerController;

  @override
  void initState() {
    _headerController = TextEditingController(
      text: widget.customMultiselectionWidget.label,
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
                text: widget.customMultiselectionWidget.label,
              ),
              onChanged: (d) => {
                widget.customMultiselectionWidget.label = d,
                c.update(widget.customMultiselectionWidget),
              },
              decoration: const InputDecoration(
                label: Text("Label (optional)"),
              ),
            ),
          ),
          InputFieldContainer.inputContainer(
            child: MapOrderSettingTemplate<String>(
              title: const Text("Selections"),
              data: widget.customMultiselectionWidget.selections,
              onChange: (p0) {
                widget.customMultiselectionWidget.selections = p0;
                c.update(widget.customMultiselectionWidget);
              },
              toStr: (p0) {
                return p0.toString();
              },
              fromStr: (p0) {
                return p0;
              },
              alertTitle: const Text("Selection"),
              alertKeyText: "Value",
              alertValueText: "Display name",
              keyTileText: "Value: ",
              valueTileText: "Name: ",
            ),
          ),
        ],
      ),
    );
  }

  void onSelect(IobrokerObject iobrokerObject) {
    widget.customMultiselectionWidget.dataPoint = iobrokerObject.id;
    c.update(widget.customMultiselectionWidget);
  }
}
