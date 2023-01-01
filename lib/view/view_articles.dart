import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';

class ViewArticle extends StatefulWidget {
  final String newsUrl;
  const ViewArticle({super.key, required this.newsUrl});

  @override
  State<ViewArticle> createState() => _ViewArticleState();
}

class _ViewArticleState extends State<ViewArticle> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "News App",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.add)),
          )
        ],
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Colors.brown,

        child: WebView(
            initialUrl: widget.newsUrl,
            onWebViewCreated: (WebViewController webViewController) {
              _completer.complete(webViewController);
            }),
      ),
    );
  }
}

// WebView(
//     {required String initialUrl,
//     required Null Function(WebViewController webViewController)
//         onWebViewCreated}) {}
