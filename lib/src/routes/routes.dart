import 'package:flutter/material.dart';
import 'package:unifarme/src/screens/login/login.dart';
import 'package:unifarme/src/screens/login/loginWithCredential.dart';
import 'package:unifarme/src/screens/login/otpscreen.dart';
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
          builder: (_) => OnBoarding(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case '/otp/screen':
        return MaterialPageRoute(
          builder: (_) => OTPScreen(),
        );
      case '/login/credential':
        return MaterialPageRoute(
          builder: (_) => LoginCredentials(),
        );

      // case '/':
      //   return MaterialPageRoute(builder: (_) => Cover());
    }
  }
}
