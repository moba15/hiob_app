import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
enum DropdownMenuMode {
  bottomSheet, dropdown
}
class CustomDropdownButton<T> extends FormField<T> {
  final List<T> items;
  final DropdownMenuMode mode;
  final Widget Function(BuildContext, dynamic)? itemBuilder;
  final T? selected;

  const CustomDropdownButton(
      {Key? key, this.items = const [], this.itemBuilder, this.mode = DropdownMenuMode.dropdown, this.selected})
      : super(key: key, builder: _build);

  static Widget _build<T>(FormFieldState<T> state) {
    return state.build(state.context);
  }

  @override
  FormFieldState<T> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends FormFieldState<T> {
  late CustomDropdownButton<T> w;
  late Widget Function(BuildContext, dynamic) itemBuilder;
  T? selected;

  @override
  void initState() {
    w = widget as CustomDropdownButton<T>;
    itemBuilder = w.itemBuilder ?? (context, t) => Text(t.toString());
    selected = w.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomDropdownButton w = widget as CustomDropdownButton;
    if(w.mode == DropdownMenuMode.dropdown || w.mode == DropdownMenuMode.bottomSheet) {
      return GestureDetector(
        onTap: ()  {
          if(w.mode == DropdownMenuMode.bottomSheet) {
            openBottomSheet(context);
          }
        },
        child: DropdownButtonFormField<T>(
          value: selected,
          onChanged: (d)  {
            setState(() {
              selected = d;
            });

          },
          decoration: const InputDecoration(border: OutlineInputBorder(),labelText: "Test"),

          iconEnabledColor: SchedulerBinding.instance.window.platformBrightness == Brightness.dark ? Colors.grey[400] : Colors.black,
          iconDisabledColor: SchedulerBinding.instance.window.platformBrightness == Brightness.dark ? Colors.grey[400] : Colors.black,


          items: w.mode == DropdownMenuMode.bottomSheet ? [] : w.items.map((e) {
            return DropdownMenuItem<T>(
              value: e,
              child: itemBuilder(context, e),
            );
          }).toList(),
        ),
      );
    }

    return const Text("");

  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return _BottomSheetMenu<T>(items: w.items, itemBuilder: itemBuilder,onSelect: (dynamic e)  {
          if(e is T) {
            setState(() {
              selected = e;
            });
          }

        });
      }
    );
  }
}

class _BottomSheetMenu<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  final Function(dynamic) onSelect;
  const _BottomSheetMenu({Key? key, required this.items, required this.itemBuilder, required this.onSelect}) : super(key: key);

  @override
  State<_BottomSheetMenu> createState() => _BottomSheetMenuState<T>();
}

class _BottomSheetMenuState<T> extends State<_BottomSheetMenu> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: (widget as _BottomSheetMenu<T>).items.map((T e) => ListTile(title: widget.itemBuilder(context, e), onTap: () => widget.onSelect(e),)).toList(),
    );
  }
}

