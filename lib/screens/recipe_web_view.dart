import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeWebView extends StatefulWidget {
  final String url;
  RecipeWebView(this.url);
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<RecipeWebView> {
  final _key = UniqueKey();
  String runningUrl;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  num _stackToView = 1;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    runningUrl = widget.url.replaceAll("http:", "https:");
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _stackToView,
        children: [
          WebView(
            key: _key,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                _stackToView = 0;
              });
            },
            onWebViewCreated: (webViewCreate) {
              _controller.complete(webViewCreate);
            },
            initialUrl: runningUrl,
          ),
          Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
