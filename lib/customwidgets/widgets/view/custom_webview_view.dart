import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:smart_home/customwidgets/widgets/custom_webview_widget.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebViewView extends StatefulWidget {
  final CustomWebViewWidget customWebViewWidget;
  const CustomWebViewView({Key? key, required this.customWebViewWidget})
      : super(key: key);

  @override
  State<CustomWebViewView> createState() => _CustomWebViewViewState();
}

class _CustomWebViewViewState extends State<CustomWebViewView> {
  late WebViewController _webViewController;
  late VlcPlayerController _videoPlayerController;

  @override
  void initState() {
    if (widget.customWebViewWidget.dataPoint != null) {
      _webViewController = WebViewController()
        ..setJavaScriptMode(widget.customWebViewWidget.javaScript
            ? JavaScriptMode.unrestricted
            : JavaScriptMode.disabled)
        ..loadRequest(
            Uri.parse(widget.customWebViewWidget.dataPoint!.value.toString()));
    } else {
      if (widget.customWebViewWidget.url.toString().startsWith("https://") ||
          widget.customWebViewWidget.url.toString().startsWith("http://")) {
        _webViewController = WebViewController()
          ..setJavaScriptMode(widget.customWebViewWidget.javaScript
              ? JavaScriptMode.unrestricted
              : JavaScriptMode.disabled)
          ..loadRequest(Uri.parse(widget.customWebViewWidget.url ?? ""));
      } else {
        _webViewController = WebViewController()
          ..setJavaScriptMode(widget.customWebViewWidget.javaScript
              ? JavaScriptMode.unrestricted
              : JavaScriptMode.disabled)
          ..loadRequest(
              Uri.parse("https://${widget.customWebViewWidget.url ?? ""}"));
      }
    }

    super.initState();

    _videoPlayerController = VlcPlayerController.network(
      'https://media.w3.org/2010/05/sintel/trailer.mp4',
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  Future<void> initializePlayer() async {}

  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
    await _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: VlcPlayer(
        controller: _videoPlayerController,
        aspectRatio: 16 / 9,
        placeholder: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
