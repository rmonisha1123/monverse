import 'package:flutter/material.dart';
import 'package:monisha_portfolio/screens/landing_screen.dart';
import 'package:monisha_portfolio/screens/introduction/intro_screen.dart';
import 'package:monisha_portfolio/utils/constants.dart';

class ScreenRoutes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.intro:
        return MaterialPageRoute(builder: (_) => const IntroScreen());

      default:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
    }
  }
}
