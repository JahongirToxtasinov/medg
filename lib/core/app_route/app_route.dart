import 'package:flutter/material.dart';
import 'package:medg/core/pages/onboarding.dart';
import 'package:medg/core/pages/splash.dart';
import 'package:medg/features/authentication/presentation/pages/login_screen.dart';
import 'package:medg/features/home/home.dart';
import 'package:medg/features/main/presentation/main_screen.dart';
import 'package:medg/features/news/presentation/pages/news_screen.dart';

import '../app_route_name/app_route_names.dart';
import '../functions/app_functions.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return fade(const SplashScreen());
      case AppRouteNames.home:
        return fade(const HomePage());
      case AppRouteNames.onboarding:
        return fade(const OnBoarding());
      case AppRouteNames.news:
        return fade(const NewsScreen());
      case AppRouteNames.login:
        return fade(const LoginScreen());
      case AppRouteNames.main:
        return fade(const MainScreen());
      // case AppRouteNames.calendar:
      //   return fade(const CalendarScreen());
      // case AppRouteNames.statistics:
      //   return fade(const StatisticsScreen());
      // case AppRouteNames.sing_up:
      //   return fade(const SignUpScreen());
      // case AppRouteNames.forgot_password:
      //   return fade(const ForgotPassword());

      default:
        return fade(const Scaffold());
    }
  }
}