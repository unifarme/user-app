import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unifarme/src/screens/onboard/onboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Timer(
    //   Duration(seconds: 3),
    //   // () => Navigator.push(
    //   //   context,
    //   //   MaterialPageRoute(
    //   //     builder: (context) => OnBoard(),
    //   //   ),
    //   // ),
    //   () => Navigator.of(context).pushNamed("/onboard"),
    // );
  }

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            const Color(0xFF3366FF),
            const Color(0xFF00CCFF),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
        ),
      ),
    );
  }
}
