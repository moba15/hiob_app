import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/networkplayer/custom_networkplayer_widget.dart';
import 'package:smart_home/utils/theme.dart';

class CustomNetworkPlayerWidgetSettingView
    extends CustomWidgetSettingStatefulWidget {
  final CustomNetworkPlayerWidget customNetworkPlayer;
  const CustomNetworkPlayerWidgetSettingView({
    super.key,
    required this.customNetworkPlayer,
  });

  @override
  State<CustomNetworkPlayerWidgetSettingView> createState() =>
      _CustomNetworkPlayerSettingViewState();

  @override
  CustomWidget get customWidget => customNetworkPlayer;

  @override
  CustomWidgetDeprecated get customWidgetDeprecated =>
      throw UnimplementedError();

  @override
  bool get deprecated => false;

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      throw UnimplementedError();

  @override
  bool validate() {
    return (customNetworkPlayer.url != null &&
        customNetworkPlayer.url!.isNotEmpty);
  }
}

class _CustomNetworkPlayerSettingViewState
    extends State<CustomNetworkPlayerWidgetSettingView> {
  late TextEditingController urlLabelEditingController;
  late CustomWidgetBlocCubit c;

  @override
  void initState() {
    urlLabelEditingController = TextEditingController(
      text: widget.customNetworkPlayer.url,
    );
    super.initState();
  }

  @override
  void dispose() {
    urlLabelEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    c = context.read<CustomWidgetBlocCubit>();
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          InputFieldContainer.inputContainer(
            child: TextField(
              controller: urlLabelEditingController,
              decoration: const InputDecoration(label: Text("URL (optional)")),
              onChanged: (s) => {
                widget.customNetworkPlayer.url = s,
                c.update(widget.customNetworkPlayer),
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text("Aspect ratio", style: TextStyle(fontSize: 20)),
          ),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: widget.customNetworkPlayer.width.toDouble(),
                  max: 20,
                  min: 5,
                  divisions: 15,
                  label: widget.customNetworkPlayer.width.toString(),
                  onChanged: (s) {
                    setState(() {
                      widget.customNetworkPlayer.width = s.round();
                    });
                  },
                ),
              ),
              const Text(
                "\\",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Slider(
                  value: widget.customNetworkPlayer.height.toDouble(),
                  max: 20,
                  min: 5,
                  divisions: 15,
                  label: widget.customNetworkPlayer.height.toString(),
                  onChanged: (s) {
                    setState(() {
                      widget.customNetworkPlayer.height = s.round();
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
