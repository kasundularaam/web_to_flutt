import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/assets_paths.dart';
import '../../../core/themes/app_theme.dart';
import '../../../logic/landing_cubit/landing_cubit.dart';
import '../../components/app_navigation.dart';
import '../../components/app_pages.dart';
import '../../components/app_texts.dart';
import '../../components/components.dart';
import '../../router/app_router.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    BlocProvider.of<LandingCubit>(context).loadApp();
    return BlocListener<LandingCubit, LandingState>(
      listener: (context, state) {
        if (state is LandingLoaded) {
          navAndClear(context: context, route: AppRouter.homePage);
        }
      },
      child: AppPage(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                AssetsPaths.logo,
                width: 100.w,
                fit: BoxFit.fitWidth,
              ),
            ),
            BodyMedium(
              text: "app_name".tr().toUpperCase(),
              color: appTheme.onGroundColorLow,
            ),
            const VSpacer(height: 2)
          ],
        ),
      ),
    );
  }
}
