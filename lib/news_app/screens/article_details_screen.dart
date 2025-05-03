import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(url)),
        onWebViewCreated: (controller) {
        },
        onLoadStart: (controller, url) {},
        onLoadStop: (controller, url) {},
        onJsAlert: (controller, jsAlertRequest) async {
          if (jsAlertRequest.isMainFrame!) {
          }
          // Return true to indicate that the alert has been handled by Flutter
          return  ;
        },
      ),
    );
  }
}
