import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:smart_home/customwidgets/widgets/custom_media_player_widget.dart';

class CustomMediaPlayerWidgetView extends StatefulWidget {
  final CustomMediaPlayerWidget customMediaPlayerWidget;
  const CustomMediaPlayerWidgetView(
      {Key? key, required this.customMediaPlayerWidget})
      : super(key: key);

  @override
  State<CustomMediaPlayerWidgetView> createState() =>
      _CustomMediaPlayerWidgetViewState();
}

class _CustomMediaPlayerWidgetViewState
    extends State<CustomMediaPlayerWidgetView> {
  late VlcPlayerController _vlcPlayerController;
  @override
  void initState() {
    _vlcPlayerController =
        VlcPlayerController.network(widget.customMediaPlayerWidget.url ?? "ok");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!Platform.isAndroid) {
      return const Center(
        child: Text("Only Supported on android"),
      );
    }
    if (widget.customMediaPlayerWidget.url == null) {
      return const Text("Emtpy url");
    }
    return VlcPlayer(
      controller: _vlcPlayerController,
      aspectRatio: widget.customMediaPlayerWidget.height *
          1.0 /
          widget.customMediaPlayerWidget.width,
      placeholder: const Center(child: CircularProgressIndicator()),
    );
  }
}
