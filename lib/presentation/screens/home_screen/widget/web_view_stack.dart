import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/configs/configs.dart';
import '../../../../logic/web_view_cubit/web_view_cubit.dart';

class WebViewStack extends StatefulWidget {
  final Completer<WebViewController> controller;
  const WebViewStack({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;

  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocListener<WebViewCubit, WebViewState>(
          listener: (context, state) => _controller!.loadUrl(state.url),
          child: WebView(
            initialUrl: initUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (webViewController) {
              _controller = webViewController;
              widget.controller.complete(_controller);
            },
            onPageStarted: (url) {
              setState(() {
                loadingPercentage = 0;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
              });
            },
          ),
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
