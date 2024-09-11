import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_home/utils/reorder_helper.dart';

@Deprecated("Please do not use this")
class MapSettingWidget extends StatefulWidget {
  final Widget title;
  final bool enabled;
  final Map<String, String> map;
  final bool Function(String key)? onDismiss;
  final bool Function(String key, String value)? onAdd;
  final bool Function(int oldIndex, int newIndex)? onReorder;
  const MapSettingWidget(
      {Key? key,
      required this.title,
      this.enabled = true,
      this.map = const {},
      this.onAdd,
      this.onDismiss,
      this.onReorder})
      : super(key: key);

  @override
  State<MapSettingWidget> createState() => _MapSettingWidgetState();
}

class _MapSettingWidgetState extends State<MapSettingWidget> {
  List<Widget> children = [];

  @override
  void initState() {
    _loadChildren();
    super.initState();
  }

  _loadChildren() {
    children.clear();
    widget.map.forEach(
      (key, value) {
        children.add(_loadChild(key, value));
      },
    );
  }

  Widget _loadChild(String key, String value) {
    return Dismissible(
      key: ValueKey(key),
      confirmDismiss: (direction) async {
        if (widget.onDismiss != null) {
          return widget.onDismiss!(key);
        }
        return false;
      },
      onDismissed: (direction) {
        if (widget.onDismiss != null) {
          widget.map.remove(key);
          setState(() {
            _loadChildren();
          });
        }
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
          child: const Icon(Icons.delete_forever),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
          child: const Icon(Icons.delete_forever),
        ),
      ),
      child: ListTile(
        title: Text(key),
        subtitle: Text(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Row(
          children: [
            widget.title,
            TextButton(onPressed: _onAddPress, child: const Text("Add"))
          ],
        ),
        enabled: widget.enabled,
        initiallyExpanded: true,
        children: [
          ReorderableListView(
            shrinkWrap: true,
            children: children,
            onReorder: (oldIndex, newIndex) {
              if (widget.onReorder != null &&
                  widget.onReorder!(oldIndex, newIndex)) {
                ReorderHelper.reorderMap(widget.map,
                    oldIndex: oldIndex, newIndex: newIndex);
                setState(() {
                  _loadChildren();
                });
              }
            },
          ),
        ]);
  }

  _onAddPress() {
    showDialog(
      context: context,
      builder: (context) => _AddEditDialog(
        title: const Text("Add"),
        add: _onAdd,
        keyLabel: const Text("Column key from json"),
        valueLabel: const Text("Coumn name"),
      ),
    );
  }

  _onAdd(String key, String value) {
    if (widget.onAdd != null && widget.onAdd!(key, value)) {
      widget.map[key] = value;
      setState(() {
        _loadChildren();
      });
    }
  }
}

class _AddEditDialog extends StatelessWidget {
  final Widget title;
  final Widget keyLabel, valueLabel;
  final String initKey, initValue;
  final Function(String key, String value) add;
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  _AddEditDialog(
      {Key? key,
      required this.title,
      required this.keyLabel,
      required this.valueLabel,
      required this.add,
      this.initKey = "",
      this.initValue = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _keyController..text = initKey,
            decoration: InputDecoration(label: keyLabel),
          ),
          const Gap(15),
          TextField(
            controller: _valueController..text = initValue,
            decoration: InputDecoration(label: valueLabel),
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              add(_keyController.text, _valueController.text);
              Navigator.pop(context);
            },
            child: const Text("Add")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancle"))
      ],
    );
  }
}
