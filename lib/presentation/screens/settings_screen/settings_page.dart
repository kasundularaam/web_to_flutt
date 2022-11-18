import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/themes/app_theme.dart';
import '../../../logic/language_cubit/language_cubit.dart';
import '../../../logic/theme_cubit/theme_cubit.dart';
import '../../components/app_pages.dart';
import '../../components/app_texts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return AppPage(
      appBar: AppAppBar(
        title: "settings".tr(),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: appTheme.foregroundColor,
                borderRadius: BorderRadius.circular(5)),
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return Column(
                  children: [
                    HeadlineMedium(text: "theme".tr()),
                    RadioListTile<ThemeMode>(
                      activeColor: appTheme.primaryColor,
                      value: ThemeMode.light,
                      groupValue: state.themeMode,
                      onChanged: (value) =>
                          BlocProvider.of<ThemeCubit>(context).changeAppTheme(
                        themeMode: value!,
                      ),
                      title: BodyMedium(text: "light".tr()),
                    ),
                    RadioListTile<ThemeMode>(
                      activeColor: appTheme.primaryColor,
                      value: ThemeMode.dark,
                      groupValue: state.themeMode,
                      onChanged: (value) =>
                          BlocProvider.of<ThemeCubit>(context).changeAppTheme(
                        themeMode: value!,
                      ),
                      title: BodyMedium(text: "dark".tr()),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: appTheme.foregroundColor,
                borderRadius: BorderRadius.circular(5)),
            child: BlocBuilder<LanguageCubit, LanguageState>(
              builder: (context, state) {
                return Column(
                  children: [
                    HeadlineMedium(text: "language".tr()),
                    RadioListTile<String>(
                      activeColor: appTheme.primaryColor,
                      value: "en",
                      groupValue: state.language,
                      onChanged: (value) {
                        BlocProvider.of<LanguageCubit>(context).changeLanguage(
                          language: value!,
                        );
                        context.setLocale(const Locale("en"));
                      },
                      title: BodyMedium(text: "english".tr()),
                    ),
                    RadioListTile<String>(
                      activeColor: appTheme.primaryColor,
                      value: "si",
                      groupValue: state.language,
                      onChanged: (value) {
                        BlocProvider.of<LanguageCubit>(context).changeLanguage(
                          language: value!,
                        );
                        context.setLocale(const Locale("si"));
                      },
                      title: BodyMedium(text: "sinhala".tr()),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
