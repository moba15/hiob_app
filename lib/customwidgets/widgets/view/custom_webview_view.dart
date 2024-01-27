import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/widgets/custom_webview_widget.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
class CustomWebViewView extends StatefulWidget {
  final CustomWebViewWidget customWebViewWidget;
  const CustomWebViewView({Key? key, required this.customWebViewWidget}) : super(key: key);

  @override
  State<CustomWebViewView> createState() => _CustomWebViewViewState();
}

class _CustomWebViewViewState extends State<CustomWebViewView> {
  late BlocListener _blocListener;
  late WebViewController _webViewController;
  
  @override
  void initState() {
    if(widget.customWebViewWidget.dataPoint != null) {
      _webViewController = WebViewController()
      ..setJavaScriptMode(widget.customWebViewWidget.javaScript ? JavaScriptMode.unrestricted : JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(widget.customWebViewWidget.dataPoint!.value.toString()));
    } else {
      if(widget.customWebViewWidget.url.toString().startsWith("https://") || widget.customWebViewWidget.url.toString().startsWith("http://")) {
        _webViewController = WebViewController()
          ..setJavaScriptMode(
              widget.customWebViewWidget.javaScript ? JavaScriptMode
                  .unrestricted : JavaScriptMode.disabled)
          ..loadRequest(Uri.parse(widget.customWebViewWidget.url ?? ""));
      } else {
        _webViewController = WebViewController()
          ..setJavaScriptMode(
              widget.customWebViewWidget.javaScript ? JavaScriptMode
                  .unrestricted : JavaScriptMode.disabled)
          ..loadRequest(Uri.parse("https://${widget.customWebViewWidget.url ?? ""}"));
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _webViewController.reload() ,
      child: Column(
        children: [
          if(widget.customWebViewWidget.dataPoint != null)
            BlocListener<DataPointBloc, DataPointState>(
              bloc: DataPointBloc(widget.customWebViewWidget.dataPoint!),
              child: SizedBox(
                height: widget.customWebViewWidget.height.toDouble(),
                child: WebViewWidget(
                  controller: _webViewController,


                ),

              ),
              listener: (context, state)  {
                if(state.value.toString().startsWith("https://") || state.value.toString().startsWith("http://")) {
                  _webViewController.loadRequest(Uri.parse(state.value.toString()));
                } else {
                  _webViewController.loadRequest(Uri.parse("https://${state.value}"));
                }
              },
            ),
          if(widget.customWebViewWidget.dataPoint == null)
            SizedBox(
              height: widget.customWebViewWidget.height.toDouble(),
              child: WebViewWidget(
                controller: _webViewController,


              ),

            ),

        ],
      )
    );
  }
}


