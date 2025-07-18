import 'package:flutter/material.dart';
import 'package:smart_home/utils/theme.dart';

class MapOrderSettingTemplate<V> extends StatefulWidget {
  final Widget title;
  final Widget alertTitle;
  final String alertKeyText;
  final String alertValueText;
  final V Function(String) fromStr;
  final String Function(V?) toStr;
  final Map<String, V> data;
  final Function(Map<String, V>) onChange;
  final String keyTileText;
  final String valueTileText;

  const MapOrderSettingTemplate({
    super.key,
    required this.title,
    required this.data,
    required this.onChange,
    required this.toStr,
    required this.fromStr,
    required this.alertTitle,
    required this.alertKeyText,
    required this.alertValueText,
    required this.keyTileText,
    required this.valueTileText,
  });

  @override
  State<MapOrderSettingTemplate> createState() =>
      _MapOrderSettingTemplateState<V>();
}

class _MapOrderSettingTemplateState<V>
    extends State<MapOrderSettingTemplate<V>> {
  late Map<String, V> data;

  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final keys = data.keys.toList();
    return ExpansionTile(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.title,
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => _AddAlertDialog(
                  title: widget.alertTitle,
                  valueLabelText: widget.alertValueText,
                  keyLabelText: widget.alertKeyText,
                  onAdd: (key, value) {
                    setState(() {
                      data[key] = widget.fromStr(value);
                    });
                    widget.onChange(data);
                  },
                ),
              );
            },
            child: const Text("Add"),
          ),
        ],
      ),
      children: [
        ReorderableListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (c, i) {
            String key = keys.elementAt(i);
            return Dismissible(
              key: ValueKey(key),
              onDismissed: (d) {
                setState(() {
                  data.remove(key);
                });
                widget.onChange(data);
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
              direction: DismissDirection.endToStart,
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => _AddAlertDialog(
                      title: const Text("Edit"),
                      onAdd: (p0, p1) {
                        setState(() {
                          data.remove(key);
                          data[p0] = widget.fromStr(p1);
                          this.reorder(data.length - 1, i);
                        });
                        widget.onChange(data);
                      },
                      valueLabelText: widget.alertValueText,
                      keyLabelText: widget.alertKeyText,
                      keyValue: key,
                      valueValue: widget.toStr(data[key]),
                    ),
                  );
                },
                title: Text(widget.valueTileText + widget.toStr(data[key])),
                subtitle: Text(widget.keyTileText + key),
              ),
            );
          },
          onReorder: reorder,
          itemCount: data.length,
        ),
      ],
    );
  }

  void reorder(int oldIndex, int newIndex) {
    Map<String, V> newMap = {};
    if (oldIndex > newIndex) {
      for (int i = 0; i < newIndex; i++) {
        String key = data.keys.elementAt(i);
        newMap[key] = data[key] as V;
      }
      newMap[data.keys.elementAt(oldIndex)] =
          data[data.keys.elementAt(oldIndex)] as V;
      for (int i = newIndex; i < oldIndex; i++) {
        String key = data.keys.elementAt(i);
        newMap[key] = data[key] as V;
      }
      for (int i = oldIndex + 1; i < data.length; i++) {
        String key = data.keys.elementAt(i);
        newMap[key] = data[key] as V;
      }
    } else if (oldIndex < newIndex) {
      for (int i = 0; i < oldIndex; i++) {
        String key = data.keys.elementAt(i);
        newMap[key] = data[key] as V;
      }

      for (int i = oldIndex + 1; i < newIndex; i++) {
        String key = data.keys.elementAt(i);
        newMap[key] = data[key] as V;
      }

      newMap[data.keys.elementAt(oldIndex)] =
          data[data.keys.elementAt(oldIndex)] as V;

      for (int i = newIndex; i < data.length; i++) {
        String key = data.keys.elementAt(i);
        newMap[key] = data[key] as V;
      }
    } else {
      newMap = data;
    }

    setState(() {
      data = newMap;
      widget.onChange(data);
    });
  }
}

class _AddAlertDialog extends StatelessWidget {
  final Widget title;
  final String keyLabelText;
  final String valueLabelText;
  final String keyValue;
  final String valueValue;
  final void Function(String, String) onAdd;
  final TextEditingController keyController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  _AddAlertDialog({
    required this.title,
    required this.onAdd,
    required this.valueLabelText,
    required this.keyLabelText,
    this.keyValue = "",
    this.valueValue = "",
  }) {
    keyController.text = keyValue;
    valueController.text = valueValue;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      actions: [
        TextButton(
          onPressed: () => {
            onAdd(keyController.text, valueController.text),
            Navigator.pop(context),
          },
          child: const Text("Save"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(labelText: keyLabelText),
            controller: keyController,
          ),
          InputFieldContainer.inputContainer(
            child: TextField(
              decoration: InputDecoration(labelText: valueLabelText),
              controller: valueController,
            ),
          ),
        ],
      ),
    );
  }
}
