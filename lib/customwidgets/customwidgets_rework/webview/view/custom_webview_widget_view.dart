import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/custom_webview_widget.dart';

import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebViewWidgetView extends StatefulWidget {
  final CustomWebViewWidget customWebViewWidget;
  const CustomWebViewWidgetView({Key? key, required this.customWebViewWidget})
    : super(key: key);

  @override
  State<CustomWebViewWidgetView> createState() =>
      _CustomWebViewWidgetViewState();
}

class _CustomWebViewWidgetViewState extends State<CustomWebViewWidgetView> {
  late WebViewController _webViewController;
  late DataPointBloc bloc;
  bool image = false;
  late String? url;

  @override
  void initState() {
    if (widget.customWebViewWidget.dataPoint != null) {
      if (widget.customWebViewWidget.dataPoint!.value == null) {
        _webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..enableZoom(true)
          ..loadRequest(Uri.parse("https://github.com/asdasdasd/adasdasd"));

        bloc = DataPointBloc(widget.customWebViewWidget.dataPoint!);
      } else {
        _webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..enableZoom(true)
          ..loadRequest(
            Uri.parse(widget.customWebViewWidget.dataPoint!.value.toString()),
          );

        url = widget.customWebViewWidget.dataPoint!.value.toString();
        bloc = DataPointBloc(widget.customWebViewWidget.dataPoint!);
      }
    } else {
      if (widget.customWebViewWidget.url.toString().startsWith("https://") ||
          widget.customWebViewWidget.url.toString().startsWith("http://")) {
        _webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..enableZoom(true)
          ..loadRequest(
            Uri.parse(widget.customWebViewWidget.url ?? "https://google.de"),
          );
        url = widget.customWebViewWidget.url;
        ;
      } else {
        _webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..enableZoom(true)
          ..loadRequest(
            Uri.parse(
              "https://${widget.customWebViewWidget.url ?? "https://google.de"}",
            ),
          );
        url = widget.customWebViewWidget.url;
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.customWebViewWidget.dataPoint != null) {
      bloc.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _webViewController.reload(),
      child: Column(
        children: [
          if (widget.customWebViewWidget.dataPoint != null)
            BlocListener<DataPointBloc, DataPointState>(
              bloc: bloc,
              child: SizedBox(
                height: widget.customWebViewWidget.height.toDouble(),
                child: !widget.customWebViewWidget.image
                    ? WebViewWidget(controller: _webViewController)
                    : Image.network(
                        url ??
                            "https://kagi.com/proxy/cute-kitten-4k-im.jpg?c=OvVvcvM20QvRUmySQvVdxCo532pklnGqs7mknbfVuW3rEpaR6GbhZDW6EBeonAwR2JzbQFgoCwWKYmCRMazYqBxJNPnYC8erNS86pzup3Qk%3D",
                      ),
              ),
              listener: (context, state) {
                url = state.value;
                if (state.value.toString().startsWith("https://") ||
                    state.value.toString().startsWith("http://")) {
                } else {
                  url = "https://${state.value}";
                }
                _webViewController.loadRequest(
                  Uri.parse(url ?? "https://google.de"),
                );
                setState(() {
                  url = state.value;
                });
              },
            ),
          if (widget.customWebViewWidget.dataPoint == null)
            SizedBox(
              height: widget.customWebViewWidget.height.toDouble(),
              child: !widget.customWebViewWidget.image
                  ? WebViewWidget(controller: _webViewController)
                  : Image.network(
                      url ??
                          "https://kagi.com/proxy/cute-kitten-4k-im.jpg?c=OvVvcvM20QvRUmySQvVdxCo532pklnGqs7mknbfVuW3rEpaR6GbhZDW6EBeonAwR2JzbQFgoCwWKYmCRMazYqBxJNPnYC8erNS86pzup3Qk%3D",
                    ),
            ),
        ],
      ),
    );
  }
}
