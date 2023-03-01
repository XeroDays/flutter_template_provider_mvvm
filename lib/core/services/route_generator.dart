import 'package:flutter/material.dart';

import '../../ui/screens/authentication/forget_password/forget_password_screen.dart';
import '../../ui/screens/authentication/login_screen/login_screen.dart';
import '../../ui/screens/navigation/navigation_screen.dart';
import '../../ui/screens/splash_screen.dart';
import '../others/logger_customization/custom_logger.dart';

class RouteGenerator {
  static final log = CustomLogger(className: 'RouteGenerator');
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final arguments = settings.arguments;

    log.e("@generateRoute ${settings.name}");
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => SplashScreen());

      case LoginScreen.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => LoginScreen());

      case NavigationScreen.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => NavigationScreen());

      case ForgetPasswordScreen.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => ForgetPasswordScreen());

      case ForgetPasswordScreen.routeName:
        return MaterialPageRoute(
            settings: settings, builder: (_) => ForgetPasswordScreen());
    }
    return MaterialPageRoute(
        settings: settings, builder: (context) => SplashScreen());
  }
}
