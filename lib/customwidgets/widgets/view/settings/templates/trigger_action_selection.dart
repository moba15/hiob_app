import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';

class TriggerActionSelectionTemplate extends StatefulWidget {
  final Function(TriggerAction?) onChange;
  final TriggerAction? preSelectedTriggerAction;
  const TriggerActionSelectionTemplate({Key? key, required this.onChange, required this.preSelectedTriggerAction}) : super(key: key);

  @override
  State<TriggerActionSelectionTemplate> createState() => _TriggerActionSelectionTemplateState();
}

class _TriggerActionSelectionTemplateState extends State<TriggerActionSelectionTemplate> {
  TriggerActionType _selectedType = TriggerActionType.none;
  TriggerAction? _triggerAction;
  TriggerActionSetting? _triggerActionSetting;
  @override
  void initState() {
    _triggerAction = widget.preSelectedTriggerAction;
    _selectedType = widget.preSelectedTriggerAction?.type ?? TriggerActionType.none;
    _triggerActionSetting = widget.preSelectedTriggerAction?.settings;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownSearch<TriggerActionType>(
          onChanged: (d)  {
            setState(() {
              _triggerAction= d?.triggerAction;
              _triggerActionSetting = _triggerAction?.settings;
              widget.onChange(_triggerAction);
            });
          },
          showClearButton: false,
          showSearchBox: false,
          selectedItem: _selectedType,
          items: const [TriggerActionType.none, TriggerActionType.multiSelection, TriggerActionType.slider],
          mode: Mode.BOTTOM_SHEET,
          itemAsString: (i) => i?.name ?? "",


        ),
        ExpansionTile(
          title: const Text("Trigger Settings"),
          leading: const Icon(Icons.settings),
          initiallyExpanded: true,
          childrenPadding: const EdgeInsets.only(left: 10),
          expandedAlignment: Alignment.centerLeft,
          children: [
            _triggerActionSetting == null ? const Text("No Settings") : _triggerActionSetting as Widget
          ],
        ),
      ],
    );
  }
}


