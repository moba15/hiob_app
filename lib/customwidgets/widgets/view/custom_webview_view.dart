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
  WebViewController? _webViewController;
  
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.customWebViewWidget.dataPoint);
    return GestureDetector(
      onLongPress: () => _webViewController?.reload() ,
      child: Column(
        children: [
          if(widget.customWebViewWidget.dataPoint != null)
            BlocListener<DataPointBloc, DataPointState>(
              bloc: DataPointBloc(widget.customWebViewWidget.dataPoint!),
              child: SizedBox(
                height: widget.customWebViewWidget.height.toDouble(),
                child: WebView(
                  gestureNavigationEnabled: true,
                  javascriptMode: widget.customWebViewWidget.javaScript ? JavascriptMode.unrestricted : JavascriptMode.disabled,
                  initialUrl: widget.customWebViewWidget.dataPoint!.value.toString(),
                  onWebViewCreated: (controller) => {
                    _webViewController = controller
                  },


                ),

              ),
              listener: (context, state)  {
                if(state.value.toString().startsWith("https://") || state.value.toString().startsWith("http://")) {
                  _webViewController?.loadUrl(state.value.toString());
                } else {
                  _webViewController?.loadUrl("https://" + state.value.toString());
                }
              },
            ),
          if(widget.customWebViewWidget.dataPoint == null)
            SizedBox(
              height: widget.customWebViewWidget.height.toDouble(),
              child: WebView(
                gestureNavigationEnabled: true,
                javascriptMode: widget.customWebViewWidget.javaScript ? JavascriptMode.unrestricted : JavascriptMode.disabled,
                initialUrl: widget.customWebViewWidget.url,
                onWebViewCreated: (controller) => {
                  _webViewController = controller
                },


              ),

            ),

        ],
      )
    );
  }
}


