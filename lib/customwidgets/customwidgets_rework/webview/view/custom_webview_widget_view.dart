import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/custom_webview_widget.dart';
import 'package:smart_home/device/bloc/device_bloc.dart';

import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CustomWebViewWidgetView extends StatefulWidget {
  final CustomWebViewWidget customWebViewWidget;
  const CustomWebViewWidgetView({Key? key, required this.customWebViewWidget})
    : super(key: key);

  @override
  State<CustomWebViewWidgetView> createState() =>
      _CustomWebViewWidgetViewState();
}

class _CustomWebViewWidgetViewState extends State<CustomWebViewWidgetView> {
  InAppWebViewController? _webViewController;
  DataPointBloc? bloc;
  bool image = false;
  late String? url;
  late InAppWebViewSettings? _webViewSettings;

  @override
  void initState() {
    if ((widget.customWebViewWidget.url != null ||
            widget.customWebViewWidget.url!.trim().isNotEmpty) &&
        (widget.customWebViewWidget.url!.startsWith("https://") ||
            widget.customWebViewWidget.url!.startsWith("http://"))) {
      url = widget.customWebViewWidget.url;
    } else {
      url = "https://${widget.customWebViewWidget.url ?? "google.de"}";
    }

    _webViewSettings = InAppWebViewSettings(
      javaScriptEnabled: true,
      supportZoom: widget.customWebViewWidget.enabledZoom,
      builtInZoomControls: widget.customWebViewWidget.enabledZoom,
      verticalScrollBarEnabled: true,
      verticalScrollbarTrackColor: Colors.grey,
      disableVerticalScroll: !widget.customWebViewWidget.enableInlineScroll,
      disableHorizontalScroll: !widget.customWebViewWidget.enableInlineScroll,
      mediaPlaybackRequiresUserGesture: false,
    );
    if (widget.customWebViewWidget.dataPoint != null) {
      bloc = DataPointBloc(widget.customWebViewWidget.dataPoint!);
    }
    /*  if (widget.customWebViewWidget.dataPoint != null) {
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
    }*/

    super.initState();
  }

  @override
  didUpdateWidget(covariant CustomWebViewWidgetView oldWidget) {
    if ((widget.customWebViewWidget.url != null ||
            widget.customWebViewWidget.url!.trim().isNotEmpty) &&
        (widget.customWebViewWidget.url!.startsWith("https://") ||
            widget.customWebViewWidget.url!.startsWith("http://"))) {
      url = widget.customWebViewWidget.url;
    } else {
      url = "https://${widget.customWebViewWidget.url ?? "google.de"}";
    }
    _webViewSettings = InAppWebViewSettings(
      javaScriptEnabled: true,
      supportZoom: widget.customWebViewWidget.enabledZoom,
      builtInZoomControls: widget.customWebViewWidget.enabledZoom,
      verticalScrollBarEnabled: true,
      verticalScrollbarTrackColor: Colors.grey,
      disableVerticalScroll: !widget.customWebViewWidget.enableInlineScroll,
      disableHorizontalScroll: !widget.customWebViewWidget.enableInlineScroll,
      mediaPlaybackRequiresUserGesture: false,
    );
    _webViewController?.setSettings(settings: _webViewSettings!);
    _webViewController?.loadUrl(
      urlRequest: URLRequest(url: WebUri(url ?? "https://google.de")),
    );
    if (widget.customWebViewWidget.dataPoint != null) {
      bloc = DataPointBloc(widget.customWebViewWidget.dataPoint!);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isLinux) {
      return Center(
        child: Text(
          "WebView for linux not supported: (${widget.customWebViewWidget.height})",
          style: TextStyle(color: Colors.red),
        ),
      );
    }
    if (bloc != null) {
      return BlocBuilder<DataPointBloc, DataPointState>(
        bloc: bloc!,
        builder: (context, state) {
          String url = state.value == null
              ? (widget.customWebViewWidget.dataPoint!.value?.toString() ??
                    "https://google.de")
              : state.value.toString();
          if (url.isNotEmpty &&
              (url.startsWith("https://") || url.startsWith("http://"))) {
          } else {
            url = "https://$url";
          }
          return SizedBox(
            height: widget.customWebViewWidget.height.toDouble(),
            child: InAppWebView(
              gestureRecognizers: {
                Factory<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer(),
                ),
                Factory<HorizontalDragGestureRecognizer>(
                  () => HorizontalDragGestureRecognizer(),
                ),
              },
              initialUrlRequest: URLRequest(url: WebUri(url)),
              onReceivedError: (controller, request, error) =>
                  print("Error: $error"),
              initialSettings: _webViewSettings,
              onWebViewCreated: (controller) => _webViewController = controller,
            ),
          );
        },
      );
    }
    return SizedBox(
      height: widget.customWebViewWidget.height.toDouble(),
      child: InAppWebView(
        gestureRecognizers: {
          Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer(),
          ),
          Factory<HorizontalDragGestureRecognizer>(
            () => HorizontalDragGestureRecognizer(),
          ),
        },
        initialUrlRequest: URLRequest(
          url: WebUri(this.url ?? "https://google.de"),
        ),

        initialSettings: _webViewSettings,
        onWebViewCreated: (controller) => _webViewController = controller,
      ),
    );
    /* return GestureDetector(
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
    );*/
  }
}
