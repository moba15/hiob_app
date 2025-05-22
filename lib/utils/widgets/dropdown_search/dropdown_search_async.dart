import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GroupedItems {}

class DropdownSearchAsync<T> extends StatefulWidget {
  final Future<List<T>> Function(String) onSearch;
  final Widget Function(T, String) toWidget;
  const DropdownSearchAsync(
      {Key? key, required this.onSearch, required this.toWidget})
      : super(key: key);

  @override
  State<DropdownSearchAsync<T>> createState() => _DropdownSearchAsyncState<T>();
}

class _DropdownSearchAsyncState<T> extends State<DropdownSearchAsync<T>> {
  List<T> items = [];
  final _controller = StreamController<List<T>>.broadcast();
  String currentSearch = "";

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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
        child: Text(
          "value",
          style: TextStyle(
            color: "value" == null ? Colors.grey : Colors.black,
          ),
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
                  onChanged: (value) async {
                    widget.onSearch(value).then(
                      (result) {
                        _controller.sink.add(result);
                        items = result;
                        currentSearch=value;
                        setState(() {
                          print("set state");
                        });
                      },
                    );
                  },
                  onSaved: (newValue) {
                    print("saved");
                  },
                  onEditingComplete: () {
                    print("complete");
                  },
                  onFieldSubmitted: (a) {
                    print("onSubmit");
                  },
                  decoration: InputDecoration(label: Text("Search")),
                ),
                Text("Result"),
                StreamBuilder(
                  stream: _controller.stream,
                  builder: (context, snapshot) {
                    List<T>? items = snapshot.data;
                    if (items == null) {
                      return Text("Error");
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
                )
              ],
            );
          },
        );
      },
    );
  }
}
