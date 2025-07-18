import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/custom_webview_widget.dart';

import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebViewWidgetView extends StatefulWidget {
  final CustomWebViewWidget customWebViewWidget;
  const CustomWebViewWidgetView({super.key, required this.customWebViewWidget});

  @override
  State<CustomWebViewWidgetView> createState() =>
      _CustomWebViewWidgetViewState();
}

class _CustomWebViewWidgetViewState extends State<CustomWebViewWidgetView> {
  late WebViewController _webViewController;
  late DataPointBloc bloc;

  @override
  void initState() {
    //TODO Value
    if (widget.customWebViewWidget.dataPoint != null) {
      final dataPointValue = Manager().deviceManager.getCurrentValue(
        widget.customWebViewWidget.dataPoint!,
      );
      if (dataPointValue == null) {
        _webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse("https://github.com/asdasdasd/adasdasd"));
        bloc = DataPointBloc(widget.customWebViewWidget.dataPoint!);
      } else {
        _webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(dataPointValue.toString()));
        bloc = DataPointBloc(widget.customWebViewWidget.dataPoint!);
      }
    } else {
      if (widget.customWebViewWidget.url.toString().startsWith("https://") ||
          widget.customWebViewWidget.url.toString().startsWith("http://")) {
        _webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(
            Uri.parse(widget.customWebViewWidget.url ?? "https://google.de"),
          );
      } else {
        _webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(
            Uri.parse(
              "https://${widget.customWebViewWidget.url ?? "https://google.de"}",
            ),
          );
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
                child: WebViewWidget(controller: _webViewController),
              ),
              listener: (context, state) {
                if (state.value.toString().startsWith("https://") ||
                    state.value.toString().startsWith("http://")) {
                  _webViewController.loadRequest(
                    Uri.parse(state.value.toString()),
                  );
                } else {
                  _webViewController.loadRequest(
                    Uri.parse("https://${state.value}"),
                  );
                }
              },
            ),
          if (widget.customWebViewWidget.dataPoint == null)
            SizedBox(
              height: widget.customWebViewWidget.height.toDouble(),
              child: WebViewWidget(controller: _webViewController),
            ),
        ],
      ),
    );
  }
}
