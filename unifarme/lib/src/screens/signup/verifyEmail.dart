import 'package:flutter/material.dart';
import 'package:unifarme/src/screens/unifarmeLogo.dart';

class SignUpVerifyEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UnifarmeLogo(),
          SizedBox(
            height: 40,
          ),
          Text(
            "Thanks for signing up a unifarme account Please check your email for verification link",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
