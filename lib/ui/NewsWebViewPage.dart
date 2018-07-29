import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsWebViewPage extends StatelessWidget {
  final String url;
  final FlutterWebviewPlugin webViewPlugin = new FlutterWebviewPlugin();

  NewsWebViewPage(String url) : url = url;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (_) => new WebviewScaffold(
              url: url,
              withJavascript: true,
              withLocalStorage: true,
              withZoom: true,
            )
      },
    );
  }
}
