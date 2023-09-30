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

  const MapOrderSettingTemplate({Key? key,
    required this.title,
    required this.data,
    required this.onChange,
    required this.toStr,
  required this.fromStr, required this.alertTitle, required this.alertKeyText, required this.alertValueText, required this.keyTileText, required this.valueTileText})
      : super(key: key);

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
    return ExpansionTile(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.title,
          TextButton(
              onPressed: () {
                showDialog(context: context, builder: (context)=>
                    _AddAlertDialog(
                      title: widget.alertTitle,
                      valueText: widget.alertValueText,
                      keyText: widget.alertKeyText,
                      onAdd: (key, value)  {
                        setState(() {
                          data[key] = widget.fromStr(value);
                        });
                        widget.onChange(data);
                      },

                    ));
              },
              child: const Text("Add")
          ),
        ],
      ),
      children: [
        ReorderableListView.builder(
          physics : const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (c, i) {
            String key = data.keys.elementAt(i);
            return Dismissible(
              key: ValueKey(key),
              child: ListTile(
                title: Text(widget.valueTileText + widget.toStr(data[key] )),
                subtitle: Text(widget.keyTileText + key),
              ),
              onDismissed: (d) {setState(() {
                data.remove(key);
              }); widget.onChange(data); },
              background: Container(
                color: Colors.red,
                child: Container(
                  child: const Icon(Icons.delete_forever),
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                ),
                alignment: Alignment.centerLeft,
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: Container(
                  child: const Icon(Icons.delete_forever),
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                ),
                alignment: Alignment.centerRight,
              ),
              direction: DismissDirection.endToStart,
            );
          }, onReorder: reorder, itemCount: data.length,
        )
      ],
    );
  }
  void reorder(int oldIndex, int newIndex) {
    Map<String, V> newMap = {};
    if(oldIndex>newIndex) {
      for(int i = 0; i<newIndex; i++) {
        String key = data.keys.elementAt(i);
        newMap[key] = data[key]!;

      }
      newMap[data.keys.elementAt(oldIndex)] = data[data.keys.elementAt(oldIndex)]!;
      for(int i = newIndex; i<oldIndex; i++) {
        String key = data.keys.elementAt(i);
        newMap[key] = data[key]!;
      }
      for(int i = oldIndex+1; i<data.length; i++) {
        String key = data.keys.elementAt(i);
        newMap[key] = data[key]!;
      }


    } else if(oldIndex<newIndex) {
      for(int i = 0; i<oldIndex; i++) {
        String key = data.keys.elementAt(i);
        newMap[key] = data[key]!;
      }

      for(int i = oldIndex+1; i<newIndex; i++) {
        String key = data.keys.elementAt(i);
        newMap[key] = data[key]!;
      }



      newMap[data.keys.elementAt(oldIndex)] = data[data.keys.elementAt(oldIndex)]!;


      for(int i = newIndex; i<data.length; i++) {
        String key = data.keys.elementAt(i);
        newMap[key] = data[key]!;
      }

    } else {
      newMap = data;
    }


    setState(() {
      data = newMap;
    });
  }
}

class _AddAlertDialog extends StatelessWidget {
  final Widget title;
  final String keyText;
  final String valueText;
  final void Function(String, String) onAdd;
  final TextEditingController keyController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  _AddAlertDialog(
      {Key? key, required this.title, required this.onAdd, required this.valueText, required this.keyText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      actions: [
        TextButton(onPressed: () =>
        {
          onAdd(keyController.text, valueController.text),
          Navigator.pop(context)
        }, child: const Text("Add")),
        TextButton(onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"))
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(labelText: keyText),
            controller: keyController,
          ),
          InputFieldContainer.inputContainer(
            child: TextField(
              decoration: InputDecoration(labelText: valueText),
              controller: valueController,
            ),
          )

        ],
      ),
    );
  }
}

