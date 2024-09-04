import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_media_player_widget.dart';
import 'package:smart_home/utils/theme.dart';

class CustomMediaPlayerSettings extends CustomWidgetSettingStatefulWidget {
  final CustomMediaPlayerWidget customMediaPlayerWidget;
  const CustomMediaPlayerSettings(
      {Key? key, required this.customMediaPlayerWidget})
      : super(key: key);

  @override
  State<CustomMediaPlayerSettings> createState() =>
      _CustomMediaPlayerSettingsState();

  @override
  CustomWidgetDeprecated get customWidgetDeprecated => customMediaPlayerWidget;
  @override
  // TODO: implement customWidget
  CustomWidget get customWidget => throw UnimplementedError();

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys => [];

  @override
  bool validate() {
    return customMediaPlayerWidget.url != null &&
        customMediaPlayerWidget.url != "";
  }

  @override
  bool get deprecated => true;
}

class _CustomMediaPlayerSettingsState extends State<CustomMediaPlayerSettings> {
  TextEditingController? _urlTextEditingController;
  @override
  void initState() {
    _urlTextEditingController =
        TextEditingController(text: widget.customMediaPlayerWidget.url);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            InputFieldContainer.inputContainer(
                child: TextFormField(
              controller: _urlTextEditingController,
              onChanged: (s) {
                widget.customMediaPlayerWidget.url = s;
              },
              decoration: const InputDecoration(
                  labelText: "Media URL",
                  suffix: Icon(Icons.settings_system_daydream_rounded)),
            )),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Aspect ratio",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Slider(
                      value: widget.customMediaPlayerWidget.width.toDouble(),
                      max: 20,
                      min: 5,
                      divisions: 15,
                      label: widget.customMediaPlayerWidget.width.toString(),
                      onChanged: (s) {
                        setState(() {
                          widget.customMediaPlayerWidget.width = s.round();
                        });
                      }),
                ),
                const Text(
                  "\\",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: Slider(
                      value: widget.customMediaPlayerWidget.height.toDouble(),
                      max: 20,
                      min: 5,
                      divisions: 15,
                      label: widget.customMediaPlayerWidget.height.toString(),
                      onChanged: (s) {
                        setState(() {
                          widget.customMediaPlayerWidget.height = s.round();
                        });
                      }),
                )
              ],
            )
          ],
        ));
  }
}
