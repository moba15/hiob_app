
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_webview_widget.dart';



class CustomWebViewWidgetSettingWidget extends CustomWidgetSettingStatefulWidget {
  final CustomWebViewWidget customWebViewWidget;
  const CustomWebViewWidgetSettingWidget({Key? key, required this.customWebViewWidget}) : super(key: key);

  @override
  State<CustomWebViewWidgetSettingWidget> createState() => _CustomSimpleValueWidgetSettingWidgetState();

  @override
  CustomWidget get customWidget => customWebViewWidget;

  @override
  bool validate() {
    return customWebViewWidget.url != null;
  }
}

class _CustomSimpleValueWidgetSettingWidgetState extends State<CustomWebViewWidgetSettingWidget> {
  final TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    _urlController.text = widget.customWebViewWidget.url ?? "";
    super.initState();
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Url"),
            onChanged: (s) =>  {widget.customWebViewWidget.url = s, if(s.isEmpty) widget.customWebViewWidget.url = null},
            controller: _urlController,
          ),
          Row(
            children: [
              const Text("Height: ", style: TextStyle(fontSize: 17),),
              Expanded(
                child: Slider(
                  value: widget.customWebViewWidget.height.toDouble(),
                  max: 1000,
                  min: 100,
                  divisions: 18,
                  onChanged: (d) {
                    setState(() {
                      widget.customWebViewWidget.height = d.round();
                    });
                  },
                  label: widget.customWebViewWidget.height.toString(),
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text("Javascript enabled: ", style: TextStyle(fontSize: 17),),
              Checkbox(
                  value: widget.customWebViewWidget.javaScript,
                  onChanged: (d) {
                    setState(() {
                      widget.customWebViewWidget.javaScript = d ?? false;
                    });
                  }
              ),
            ],
          )
        ],
      ),
    );
  }
}
