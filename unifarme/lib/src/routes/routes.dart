import 'package:flutter/material.dart';
import 'package:unifarme/src/screens/homepage/homepage.dart';
import 'package:unifarme/src/screens/homepage/profile/profile.dart';
import 'package:unifarme/src/screens/login/login.dart';
import 'package:unifarme/src/screens/login/login_new.dart';
import 'package:unifarme/src/screens/login/loginWithCredential.dart';
import 'package:unifarme/src/screens/login/otpscreen.dart';
import 'package:unifarme/src/screens/onboard/onboard.dart';
import 'package:unifarme/src/screens/signup/signup.dart';
import 'package:unifarme/src/screens/signup/signup_new.dart';
import 'package:unifarme/src/screens/signup/signupotp.dart';
import 'package:unifarme/src/screens/signup/signupwithcredentials.dart';
import 'package:unifarme/src/screens/signup/verifyEmail.dart';
import 'package:unifarme/src/splashscreen.dart';
import 'package:unifarme/src/screens/welcome/welcome.dart';

class RouteGenerator {
  // ignore: missing_return
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
      case '/welcome':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/login':
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => SignupScreen(),
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

      case '/verify/email/cover':
        return MaterialPageRoute(
          builder: (_) => SignUpVerifyEmail(),
        );

      // case '/':
      //   return MaterialPageRoute(builder: (_) => Cover());
    }
  }
}
