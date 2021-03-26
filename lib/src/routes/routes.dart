import 'package:flutter/material.dart';
import 'package:unifarme/src/screens/homepage/homepage.dart';
import 'package:unifarme/src/screens/homepage/profile/profile.dart';
import 'package:unifarme/src/screens/login/login.dart';
import 'package:unifarme/src/screens/login/loginWithCredential.dart';
import 'package:unifarme/src/screens/login/otpscreen.dart';
import 'package:unifarme/src/screens/onboard/onboard.dart';
import 'package:unifarme/src/screens/signup/signup.dart';
import 'package:unifarme/src/screens/signup/signupotp.dart';
import 'package:unifarme/src/screens/signup/signupwithcredentials.dart';
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
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => Signup(),
        );
      case '/otp/screen':
        return MaterialPageRoute(
          builder: (_) => OTPScreen(),
        );
      case '/otp/screen/signup':
        return MaterialPageRoute(builder: (_) => SignupOtp());
      case '/signup/with/credentials':
        return MaterialPageRoute(builder: (_) => SignupWithCredentials());
      case '/login/credential':
        return MaterialPageRoute(
          builder: (_) => LoginCredentials(),
        );
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());

      // case '/':
      //   return MaterialPageRoute(builder: (_) => Cover());
    }
  }
}
