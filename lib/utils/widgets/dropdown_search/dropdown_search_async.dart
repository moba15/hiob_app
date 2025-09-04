import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smart_home/utils/widgets/dropdown_search/cubit/cubit/async_search_cubit.dart';

class GroupedItems {}

class DropdownSearchAsync<T> extends StatefulWidget {
  final void Function(String) onSearch;
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
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AsyncSearchCubit<T>>();
    if (cubit.state is InitalAsyncSearchState<T>) {
      cubit.loadInitialValues();
    }
    return GestureDetector(
      onTap: () => _onTap(cubit),
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

  void _onTap(AsyncSearchCubit<T> cubit) {
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
                    currentSearch = value;
                    setState(() {});
                    widget.onSearch(value);
                  },
                  onSaved: (newValue) {},
                  onEditingComplete: () {},
                  onFieldSubmitted: (a) {},
                  decoration: InputDecoration(
                    label: Text("Search"),
                    hint: Text("Try searching with regex or wildcard"),
                  ),
                ),
                Gap(8),
                widget.chipList ?? const SizedBox.shrink(),
                Text("Result"),
                BlocBuilder<AsyncSearchCubit<T>, AsyncSearchState<T>>(
                  bloc: cubit,
                  builder: (context, state) {
                    if (state is LoadingAsyncSearchState<T> ||
                        state is InitalAsyncSearchState<T>) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is ErrorAsyncSearchState<T>) {
                      return Center(child: Text("Error: ${state.errorMsg}"));
                    } else if (state is LoadedAsyncSearchState<T>) {
                      items = state.objects;
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
                    }
                    return Text("Error: Unknown state");
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
