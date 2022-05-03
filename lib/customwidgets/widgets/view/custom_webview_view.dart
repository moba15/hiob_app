import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/widgets/custom_webview_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
class CustomWebViewView extends StatefulWidget {
  final CustomWebViewWidget customWebViewWidget;
  const CustomWebViewView({Key? key, required this.customWebViewWidget}) : super(key: key);

  @override
  State<CustomWebViewView> createState() => _CustomWebViewViewState();
}

class _CustomWebViewViewState extends State<CustomWebViewView> {
  WebViewController? _webViewController;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _webViewController?.reload() ,
      child: Column(
        children: [
          SizedBox(
            height: widget.customWebViewWidget.height.toDouble(),
            child: WebView(
              gestureNavigationEnabled: true,
              javascriptMode: widget.customWebViewWidget.javaScript ? JavascriptMode.unrestricted : JavascriptMode.disabled,
              initialUrl: widget.customWebViewWidget.url,
              backgroundColor: Colors.red,



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


