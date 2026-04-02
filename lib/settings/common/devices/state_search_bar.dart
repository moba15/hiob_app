import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/di/injection.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/services/device/device_service_interface.dart';
import 'package:smart_home/utils/widgets/dropdown_search/cubit/cubit/async_search_cubit.dart';
import 'package:smart_home/utils/widgets/dropdown_search/cubit/cubit/async_search_cubit_factory.dart';
import 'package:smart_home/utils/widgets/dropdown_search/dropdown_search_async.dart';
import 'package:smart_home/utils/widgets/substring_highlight_widget.dart';

class StateSearchBar extends StatefulWidget {
  final String? selectedObject;
  final Function(IobrokerObject) onSelected;
  const StateSearchBar({
    super.key,
    required this.selectedObject,
    required this.onSelected,
  });

  @override
  State<StateSearchBar> createState() => _StateSearchBarState();
}

class _StateSearchBarState extends State<StateSearchBar> {
  late DeviceServiceInterface<IobrokerObject> deviceManager;
  late AsyncSearchCubit<IobrokerObject> asyncSearchCubit;
  late AsyncSearchCubitFactory asyncSearchCubitFactory;
  IobrokerObject? selectedObject;
  String _currentSearch = "";
  Map<String, bool> filters = {};
  @override
  void initState() {
    DeviceServiceInterface d = context.read<DeviceServiceInterface>();
    if (d is DeviceServiceInterface<IobrokerObject>) {
      deviceManager = d;
    } else {
      throw Exception("DeviceServiceInterface is not of type IobrokerObject");
    }

    asyncSearchCubitFactory = getIt<AsyncSearchCubitFactory>();
    asyncSearchCubit = asyncSearchCubitFactory.create(
      getInitalValues: () => deviceManager.getAllDevices(limit: 250),
    );

    if (widget.selectedObject != null) {
      deviceManager.getDeviceById(id: widget.selectedObject!).then((value) {
        setState(() {
          selectedObject = value;
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (filters.isEmpty) {
      deviceManager.getSelectableFilters().then((value) {
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
            await deviceManager.searchDevices(userQuery: p0, filters: filters),
          );
        },
        chipList: _SearchChipList(
          filters: filters,
          filterUpdated: () {
            deviceManager
                .searchDevices(userQuery: _currentSearch, filters: filters)
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sortedFilters = widget.filters.entries.toList()
      ..sort((a, b) {
        if (a.value == b.value) {
          return a.key.compareTo(b.key);
        }
        return a.value ? -1 : 1;
      });
    return Listener(
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {
          final newOffset =
              _scrollController.offset + pointerSignal.scrollDelta.dy;
          _scrollController.jumpTo(newOffset);
        }
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: sortedFilters.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: FilterChip(
                label: Text(entry.key),
                selected: entry.value,
                onSelected: (value) {
                  setState(() {
                    widget.filters[entry.key] = value;
                  });
                  widget.filterUpdated();
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
