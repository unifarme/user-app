import 'package:flutter/material.dart';
import 'package:unifarme/src/screens/onboard/onboard.dart';
import 'package:unifarme/src/splashscreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case '/onboard':
        return MaterialPageRoute(
          builder: (_) => OnBoard(),
        );

      // case '/':
      //   return MaterialPageRoute(builder: (_) => Cover());
    }
  }
}
