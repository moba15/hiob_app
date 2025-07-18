import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/utils/theme.dart';

class TriggerActionSelectionTemplate extends StatefulWidget {
  final Function(TriggerAction?, TriggerActionSetting?) onChange;
  final TriggerAction? preSelectedTriggerAction;
  const TriggerActionSelectionTemplate({
    Key? key,
    required this.onChange,
    required this.preSelectedTriggerAction,
  }) : super(key: key);

  @override
  State<TriggerActionSelectionTemplate> createState() =>
      _TriggerActionSelectionTemplateState();
}

class _TriggerActionSelectionTemplateState
    extends State<TriggerActionSelectionTemplate> {
  TriggerActionType _selectedType = TriggerActionType.none;
  TriggerAction? _triggerAction;
  TriggerActionSetting? _triggerActionSetting;
  @override
  void initState() {
    _triggerAction = widget.preSelectedTriggerAction;
    _selectedType =
        widget.preSelectedTriggerAction?.type ?? TriggerActionType.none;
    _triggerActionSetting = widget.preSelectedTriggerAction?.settings;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownSearch<TriggerActionType>(
          onChanged: (d) {
            setState(() {
              _triggerAction = d?.triggerAction;
              _triggerActionSetting = _triggerAction?.settings;
              widget.onChange(_triggerAction, _triggerActionSetting);
            });
          },
          popupProps: PopupProps.modalBottomSheet(
            modalBottomSheetProps: ModalBottomSheetProps(
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
            showSelectedItems: true,
          ),
          selectedItem: _selectedType,
          items: const [
            TriggerActionType.none,
            TriggerActionType.multiSelection,
            TriggerActionType.slider,
            TriggerActionType.handleSwitch,
            TriggerActionType.button,
          ],
          itemAsString: (i) => i.name,
          compareFn: (d, d2) => d == d2,
        ),
        ExpansionTile(
          title: const Text("Main Body Settings"),
          leading: const Icon(Icons.settings),
          initiallyExpanded: true,
          childrenPadding: const EdgeInsets.only(left: 10),
          expandedAlignment: Alignment.centerLeft,
          children: [
            _triggerActionSetting == null
                ? const Text("No Settings")
                : InputFieldContainer.inputContainer(
                    child: _triggerActionSetting as Widget,
                  ),
          ],
        ),
      ],
    );
  }
}
