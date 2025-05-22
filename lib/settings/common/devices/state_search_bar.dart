import 'package:flutter/material.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/widgets/dropdown_search/dropdown_search_async.dart';
import 'package:smart_home/utils/widgets/substring_highlight_widget.dart';

class StateSearchBar extends StatefulWidget {
  const StateSearchBar({Key? key}) : super(key: key);

  @override
  State<StateSearchBar> createState() => _StateSearchBarState();
}

class _StateSearchBarState extends State<StateSearchBar> {
  late DeviceManager deviceManager;
  @override
  void initState() {
    deviceManager = Manager().deviceManager;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearchAsync<IobrokerObject>(
      onSearch: (p0) async {
        return deviceManager.searchIobrokerObjects(p0);
      },
      toWidget: (p0, currentSearch) {
        String displayName = p0.name ?? p0.id;
        final regexExp = RegExp("(.*)($currentSearch)(.*)");
        return ListTile(
            title: SubstringHighlightWidget(
                text: displayName, exp: regexExp, highlightedGroup: 2,),
            subtitle: p0.name == null
                ? (p0.desc != null ? SubstringHighlightWidget(text: p0.desc!, exp: regexExp, highlightedGroup: 2,) : null)
                : (SubstringHighlightWidget(text: "${p0.id}: ${p0.desc}", exp: regexExp, highlightedGroup: 2,)));
      },
    );
  }
}
