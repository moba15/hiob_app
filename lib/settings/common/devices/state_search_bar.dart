import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/pair.dart';
import 'package:smart_home/utils/widgets/dropdown_search/cubit/cubit/async_search_cubit.dart';
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
  late AsyncSearchCubit<IobrokerObject> asyncSearchCubit;
  IobrokerObject? selectedObject;
  String _currentSearch = "";
  Map<String, bool> filters = {};
  @override
  void initState() {
    deviceManager = Manager().deviceManager;
    asyncSearchCubit = AsyncSearchCubit(
      getInitalValues: () => deviceManager.getAllIobrokerObjects(limit: 250),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (filters.isEmpty) {
      deviceManager.getIobrokerAdapaters().then((value) {
        setState(() {
          filters = {for (var element in value) element: false};
        });
      });
    }
    return BlocProvider.value(
      value: asyncSearchCubit,
      child: DropdownSearchAsync<IobrokerObject>(
        title: "Select a state",
        selectedObject: selectedObject == null
            ? null
            : ListTile(
                title: Text(selectedObject?.name ?? selectedObject?.id ?? ""),
                subtitle: Text(selectedObject?.desc ?? ""),
              ),
        onSearch: (p0) async {
          _currentSearch = p0;
          asyncSearchCubit.onSearched(
            await deviceManager.searchIobrokerObjects(p0, filters: filters),
          );
        },
        chipList: _SearchChipList(
          filters: filters,
          filterUpdated: () {
            deviceManager
                .searchIobrokerObjects(_currentSearch, filters: filters)
                .then((value) {
                  asyncSearchCubit.onSearched(value);
                });
          },
        ),
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
      ),
    );
  }
}

class _SearchChipList extends StatefulWidget {
  final Map<String, bool> filters;
  final void Function() filterUpdated;
  const _SearchChipList({
    super.key,
    required this.filters,
    required this.filterUpdated,
  });

  @override
  State<_SearchChipList> createState() => __SearchChipListState();
}

class __SearchChipListState extends State<_SearchChipList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 10.0,
      runSpacing: 5,
      children: [
        for (MapEntry<String, bool> entry in widget.filters.entries)
          if (entry.value)
            FilterChip(
              label: Text(entry.key),
              selected: entry.value,
              onSelected: (value) {
                setState(() {
                  widget.filters[entry.key] = value;
                });
                widget.filterUpdated();
              },
            ),

        for (MapEntry<String, bool> entry in widget.filters.entries)
          if (!entry.value)
            FilterChip(
              label: Text(entry.key),
              selected: entry.value,
              onSelected: (value) {
                setState(() {
                  widget.filters[entry.key] = value;
                });
                widget.filterUpdated();
              },
            ),
      ],
    );
  }
}
