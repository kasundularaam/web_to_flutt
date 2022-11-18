import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/theme_cubit/theme_cubit.dart';
import 'app_colors.dart';
import 'app_theme_data.dart';
import 'inherited_app_theme.dart';

class AppTheme extends StatelessWidget {
  final AppThemeData light;
  final AppThemeData dark;
  final Widget child;
  const AppTheme({
    required this.light,
    required this.dark,
    required this.child,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final data = state.themeMode == ThemeMode.light ? light : dark;
        return InheritedAppTheme(
          data: data,
          child: Theme(
            data: data.themeData,
            child: child,
          ),
        );
      },
    );
  }

  static AppThemeData of(BuildContext context) {
    final theme = Theme.of(context);
    return context.dependOnInheritedWidgetOfExactType<InheritedAppTheme>()!.data
      ..themeData = theme;
  }
}

final myLightTheme = AppThemeData(
  themeData: ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: AppColors.primaryColor,
  ),
  primaryColor: AppColors.lightPrimaryColor,
  backgroundColor: AppColors.lightBackgroundColor,
  foregroundColor: AppColors.lightForegroundColor,
  onGroundColor: AppColors.lightOnGroundColor,
  onGroundColorLow: AppColors.lightOnGroundColorLow,
);

final myDarkTheme = AppThemeData(
  themeData: ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: AppColors.primaryColor,
  ),
  primaryColor: AppColors.darkPrimaryColor,
  backgroundColor: AppColors.darkBackgroundColor,
  foregroundColor: AppColors.darkForegroundColor,
  onGroundColor: AppColors.darkOnGroundColor,
  onGroundColorLow: AppColors.darkOnGroundColorLow,
);

setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: themeMode == ThemeMode.light
          ? AppColors.lightBackgroundColor
          : AppColors.darkBackgroundColor,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? AppColors.lightBackgroundColor
          : AppColors.darkBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );
}
