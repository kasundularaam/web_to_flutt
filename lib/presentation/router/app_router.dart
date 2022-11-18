import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/exceptions/route_exception.dart';
import '../../logic/landing_cubit/landing_cubit.dart';
import '../../logic/language_cubit/language_cubit.dart';
import '../../logic/scanner_cubit/scanner_cubit.dart';
import '../../logic/web_view_cubit/web_view_cubit.dart';
import '../screens/home_screen/home_page.dart';
import '../screens/landing_screen/landing_page.dart';
import '../screens/settings_screen/settings_page.dart';

class AppRouter {
  static const String landingPage = '/';
  static const String homePage = '/homePage';
  static const String settingsPage = '/settingsPage';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LandingCubit(),
            child: const LandingPage(),
          ),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => WebViewCubit(),
              ),
              BlocProvider(
                create: (context) => ScannerCubit(),
              )
            ],
            child: const HomePage(),
          ),
        );
      case settingsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LanguageCubit(),
            child: const SettingsPage(),
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
