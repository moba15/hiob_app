import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GroupedItems {}

class DropdownSearchAsync<T> extends StatefulWidget {
  final Future<List<T>> Function(String) onSearch;
  final Future<List<T>> Function() loadInitialValues;
  final Widget Function(T, String) toWidget;
  final Widget? selectedObject;
  final Widget? chipList;
  final String title;
  final String subtitle;
  const DropdownSearchAsync({
    super.key,
    required this.title,
    this.subtitle = "Tap to search",
    required this.onSearch,
    required this.toWidget,
    required this.loadInitialValues,
    this.selectedObject,
    this.chipList,
  });

  @override
  State<DropdownSearchAsync<T>> createState() => _DropdownSearchAsyncState<T>();
}

class _DropdownSearchAsyncState<T> extends State<DropdownSearchAsync<T>> {
  List<T> items = [];
  final _controller = StreamController<List<T>>.broadcast();
  String currentSearch = "";

  @override
  void initState() {
    super.initState();
    widget.loadInitialValues().then((value) {
      items = value;
      _controller.sink.add(items);
    });
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: "hintText",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
        child:
            widget.selectedObject ??
            ListTile(
              title: Text(widget.title),
              subtitle: Text(widget.subtitle),
              trailing: const Icon(Icons.arrow_drop_down),
            ),
      ),
    );
  }

  void _onTap() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      showDragHandle: true,
      enableDrag: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                Gap(0),
                TextFormField(
                  initialValue: currentSearch,
                  onChanged: (value) async {
                    widget.onSearch(value).then((result) {
                      _controller.sink.add(result);
                      items = result;
                      currentSearch = value;
                      setState(() {});
                    });
                  },
                  onSaved: (newValue) {},
                  onEditingComplete: () {},
                  onFieldSubmitted: (a) {},
                  decoration: InputDecoration(
                    label: Text("Search"),
                    hint: Text("Try searching with regex: .*Licht.*Garten"),
                  ),
                ),
                Gap(8),
                widget.chipList ?? const SizedBox.shrink(),
                Text("Result"),
                StreamBuilder(
                  stream: _controller.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      items = snapshot.data!;
                    }

                    if (items.isEmpty) {
                      return Center(child: Text("No results found"));
                    }
                    return Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: items.length,
                        itemBuilder: (_, index) {
                          final item = items[index];
                          return widget.toWidget(item, currentSearch);
                        },
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
