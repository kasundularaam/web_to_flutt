import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../components/components.dart';

class NavigationControls extends StatelessWidget {
  const NavigationControls({required this.controller, super.key});

  final Completer<WebViewController> controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: controller.future,
      builder: (context, snapshot) {
        final WebViewController? controller = snapshot.data;
        if (snapshot.connectionState != ConnectionState.done ||
            controller == null) {
          return const Nothing();
        }

        return IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
          onPressed: () async {
            if (await controller.canGoBack()) {
              await controller.goBack();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No back history item')),
              );
              return;
            }
          },
        );
      },
    );
  }
}
