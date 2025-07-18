import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/networkplayer/custom_networkplayer_widget.dart';

class CustomNetworkPlayerWidgetView extends StatefulWidget {
  final CustomNetworkPlayerWidget customNetworkPlayer;
  const CustomNetworkPlayerWidgetView({
    super.key,
    required this.customNetworkPlayer,
  });

  @override
  State<CustomNetworkPlayerWidgetView> createState() =>
      _CustomNetworkPlayerWidgetViewState();
}

class _CustomNetworkPlayerWidgetViewState
    extends State<CustomNetworkPlayerWidgetView> {
  late VlcPlayerController _vlcPlayerController;
  @override
  void initState() {
    _vlcPlayerController = VlcPlayerController.network(
      widget.customNetworkPlayer.url ?? "ok",
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!Platform.isAndroid) {
      return const Center(child: Text("Only Supported on android"));
    }
    if (widget.customNetworkPlayer.url == null) {
      return const Text("Emtpy url");
    }
    return VlcPlayer(
      controller: _vlcPlayerController,
      aspectRatio:
          widget.customNetworkPlayer.width *
          1.0 /
          widget.customNetworkPlayer.height,
      placeholder: const Center(child: CircularProgressIndicator()),
    );
  }
}
