import 'package:flutter/material.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/widgets/dropdown_search/dropdown_search_async.dart';
import 'package:smart_home/utils/widgets/substring_highlight_widget.dart';

class StateSearchBar extends StatefulWidget {
  final Function(IobrokerObject) onSelected;
  const StateSearchBar({super.key, required this.onSelected});

  @override
  State<StateSearchBar> createState() => _StateSearchBarState();
}

class _StateSearchBarState extends State<StateSearchBar> {
  late DeviceManager deviceManager;
  IobrokerObject? selectedObject;
  @override
  void initState() {
    deviceManager = Manager().deviceManager;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearchAsync<IobrokerObject>(
      title: "Select a state",
      selectedObject: selectedObject == null
          ? null
          : ListTile(
              title: Text(selectedObject?.name ?? selectedObject?.id ?? ""),
              subtitle: Text(selectedObject?.desc ?? ""),
            ),
      onSearch: (p0) async {
        return deviceManager.searchIobrokerObjects(p0);
      },
      toWidget: (p0, currentSearch) {
        String displayName = p0.name ?? p0.id;
        final regexExp = RegExp("(.*)($currentSearch)(.*)");
        return ListTile(
          title: SubstringHighlightWidget(
            text: displayName,
            exp: regexExp,
            highlightedGroup: 2,
          ),
          subtitle: p0.name == null
              ? (p0.desc != null
                  ? SubstringHighlightWidget(
                      text: p0.desc!,
                      exp: regexExp,
                      highlightedGroup: 2,
                    )
                  : null)
              : (SubstringHighlightWidget(
                  text: "${p0.id}: ${p0.desc}",
                  exp: regexExp,
                  highlightedGroup: 2,
                )),
          onTap: () {
            widget.onSelected(p0);
            setState(() {
              selectedObject = p0;
            });
            Navigator.pop(context);
          },
        );
      },
      loadInitialValues: () async {
        return await deviceManager.getAllIobrokerObjects(limit: 250);
      },
    );
  }
}
