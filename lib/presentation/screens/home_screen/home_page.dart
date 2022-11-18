import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/configs/configs.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_theme.dart';
import '../../../logic/scanner_cubit/scanner_cubit.dart';
import '../../../logic/web_view_cubit/web_view_cubit.dart';
import '../../components/app_alerts.dart';
import '../../components/app_texts.dart';
import '../../widgets/drawings/qr_button_shape.dart';
import 'widget/navigation_controls.dart';
import 'widget/web_view_stack.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<WebViewController> controller =
      Completer<WebViewController>();

  @override
  void initState() {
    BlocProvider.of<WebViewCubit>(context).loadWebView(url: initUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return BlocListener<ScannerCubit, ScannerState>(
      listener: (scannerCubitContext, state) {
        if (state is ScannerFailed) {
          showErrorBar(scannerCubitContext, state.errorMsg);
        }
        if (state is ScannerSucceed) {
          BlocProvider.of<WebViewCubit>(context).loadWebView(url: state.result);
        }
      },
      child: Scaffold(
        backgroundColor: appTheme.backgroundColor,
        appBar: AppBar(
            backgroundColor: appTheme.backgroundColor,
            centerTitle: true,
            title: HeadlineMedium(
              text: "app_name".tr(),
              color: appTheme.primaryColor,
            ),
            leading: NavigationControls(controller: controller)),
        body: Stack(
          children: [
            WebViewStack(
              controller: controller,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomPaint(
                painter: QrButtonShape(backgroundColor: appTheme.primaryColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 6.w),
                  child: GestureDetector(
                    onTap: () =>
                        BlocProvider.of<ScannerCubit>(context).scanQRcode(),
                    child: Icon(
                      Icons.qr_code_rounded,
                      size: 28.sp,
                      color: AppColors.darkOnGroundColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
