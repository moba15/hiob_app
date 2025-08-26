import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_value_widget.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/settings/common/devices/state_search_bar.dart';
import 'package:smart_home/utils/widgets/map/map_order_add_setting_template.dart';
import 'package:smart_home/utils/theme.dart';

class CustomValueWidgetSettingsView extends CustomWidgetSettingStatefulWidget {
  final CustomValueWidget customValueWidget;
  const CustomValueWidgetSettingsView({
    super.key,
    required this.customValueWidget,
  });

  @override
  State<CustomValueWidgetSettingsView> createState() =>
      _CustomTableWidgetSettingsViewState();

  @override
  CustomWidget get customWidget => customValueWidget;

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
    return customValueWidget.dataPoint != null;
  }
}

class _CustomTableWidgetSettingsViewState
    extends State<CustomValueWidgetSettingsView> {
  late CustomWidgetBlocCubit c;
  late TextEditingController _labelController,
      _suffixController,
      _prefixController,
      _roundController;

  @override
  void initState() {
    _labelController = TextEditingController(
      text: widget.customValueWidget.label,
    );
    _suffixController = TextEditingController(
      text: widget.customValueWidget.suffix,
    );
    _prefixController = TextEditingController(
      text: widget.customValueWidget.prefix,
    );
    _roundController = TextEditingController(
      text: widget.customValueWidget.round.toString(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _labelController.dispose();
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
              controller: _labelController,
              onChanged: (d) => {
                widget.customValueWidget.label = d,
                c.update(widget.customValueWidget),
              },
              decoration: const InputDecoration(
                label: Text("Label (optional)"),
              ),
            ),
          ),
          InputFieldContainer.inputContainer(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _prefixController,
                    onChanged: (d) => {
                      widget.customValueWidget.prefix = d,
                      c.update(widget.customValueWidget),
                    },
                    decoration: const InputDecoration(
                      label: Text("Prefix (optional)"),
                    ),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: TextField(
                    controller: _suffixController,
                    onChanged: (d) => {
                      widget.customValueWidget.suffix = d,
                      c.update(widget.customValueWidget),
                    },
                    decoration: const InputDecoration(
                      label: Text("Suffix (optional)"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          InputFieldContainer.inputContainer(
            child: TextField(
              controller: _roundController,
              onChanged: (d) => {
                widget.customValueWidget.round = int.tryParse(d) ?? 0,
                c.update(widget.customValueWidget),
              },
              decoration: const InputDecoration(label: Text("Round")),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          InputFieldContainer.inputContainer(
            child: MapOrderSettingTemplate<String>(
              title: const Text("Value mapper"),
              data: Map.from(widget.customValueWidget.valueMapper),
              onChange: (p0) {
                widget.customValueWidget.valueMapper = p0;
                c.update(widget.customValueWidget);
              },
              toStr: (p0) {
                return p0.toString();
              },
              fromStr: (p0) {
                return p0;
              },
              alertTitle: const Text("Value Mapper (optional)"),
              alertKeyText: "Value to map from",
              alertValueText: "Value to map to",
              keyTileText: "Map from: ",
              valueTileText: "Map to: ",
            ),
          ),
        ],
      ),
    );
  }

  void onSelect(IobrokerObject iobrokerObject) {
    widget.customValueWidget.dataPoint = iobrokerObject.id;
    c.update(widget.customValueWidget);
  }
}
