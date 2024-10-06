import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/custom_webview_widget.dart';

import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';
//import 'package:webview_flutter/webview_flutter.dart';

class CustomWebViewWidgetView extends StatefulWidget {
  final CustomWebViewWidget customWebViewWidget;
  const CustomWebViewWidgetView({Key? key, required this.customWebViewWidget})
      : super(key: key);

  @override
  State<CustomWebViewWidgetView> createState() =>
      _CustomWebViewWidgetViewState();
}

class _CustomWebViewWidgetViewState extends State<CustomWebViewWidgetView> {
  // late WebViewController _webViewController;
  late DataPointBloc bloc;

  @override
  void initState() {
    /* if (widget.customWebViewWidget.dataPoint != null) {
      _webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(
            Uri.parse(widget.customWebViewWidget.dataPoint!.value.toString()));
      bloc = DataPointBloc(widget.customWebViewWidget.dataPoint!);
    } else {
      if (widget.customWebViewWidget.url.toString().startsWith("https://") ||
          widget.customWebViewWidget.url.toString().startsWith("http://")) {
        _webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(widget.customWebViewWidget.url ?? ""));
      } else {
        _webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(
              Uri.parse("https://${widget.customWebViewWidget.url ?? ""}"));
      }
    }*/

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
    /*return GestureDetector(
        onLongPress: () => _webViewController.reload(),
        child: Column(
          children: [
            if (widget.customWebViewWidget.dataPoint != null)
              BlocListener<DataPointBloc, DataPointState>(
                bloc: bloc,
                child: SizedBox(
                  height: widget.customWebViewWidget.height.toDouble(),
                  child: WebViewWidget(
                    controller: _webViewController,
                  ),
                ),
                listener: (context, state) {
                  if (state.value.toString().startsWith("https://") ||
                      state.value.toString().startsWith("http://")) {
                    _webViewController
                        .loadRequest(Uri.parse(state.value.toString()));
                  } else {
                    _webViewController
                        .loadRequest(Uri.parse("https://${state.value}"));
                  }
                },
              ),
            if (widget.customWebViewWidget.dataPoint == null)
              SizedBox(
                height: widget.customWebViewWidget.height.toDouble(),
                child: WebViewWidget(
                  controller: _webViewController,
                ),
              ),
          ],
        ));*/
    return Placeholder();
  }
}
