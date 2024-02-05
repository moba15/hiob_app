import 'package:flutter/material.dart';

class BoolSelectionTemplate extends StatefulWidget {
  final Function(bool) onChange;
  final bool startValue;
  final String title;

  const BoolSelectionTemplate(
      {Key? key,
      required this.onChange,
      this.startValue = false,
      this.title = "No titlle"})
      : super(key: key);

  @override
  State<BoolSelectionTemplate> createState() => _BoolSelectionTemplateState();
}

class _BoolSelectionTemplateState extends State<BoolSelectionTemplate> {
  bool value = false;
  @override
  void initState() {
    value = widget.startValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.title, style: const TextStyle(fontSize: 16.5)),
        Checkbox(
          value: value,
          onChanged: (v) {
            if (v == null) {
              return;
            }
            setState(() {
              value = v;
            });
            widget.onChange(v);
          },
        ),
      ],
    );
    /*return ListTile(
      onTap: ()  {
        setState(() {
          value = !value;
        });
        widget.onChange(value);
      },
      title: Container(
        alignment: Alignment.topLeft,
        child: widget.title != null ? Text(widget.title!, style: const TextStyle(fontSize: 16.5)) : null,
      ),
      trailing: Checkbox(
        value: value,
        onChanged: (v)  {
          if(v==null) {
            return;
          }
          setState(() {
            value = v;
          });
          widget.onChange(v);

        },
      ),



    );*/
  }
}
