import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_home/utils/theme.dart';

class GroupedItems {}

class DropdownSearchAsync<T> extends StatefulWidget {
  final T Function(String) onSearch;
  final String Function(T) toText;
  const DropdownSearchAsync(
      {Key? key, required this.onSearch, required this.toText})
      : super(key: key);

  @override
  State<DropdownSearchAsync<T>> createState() => _DropdownSearchAsyncState<T>();
}

class _DropdownSearchAsyncState<T> extends State<DropdownSearchAsync<T>> {
  List<T> items = [];
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
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Gap(20),
                    TextFormField(
                      onChanged: (value) {
                        widget.onSearch(value);
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
                  ],
                ));
          },
        );
      },
    );
  }
}
