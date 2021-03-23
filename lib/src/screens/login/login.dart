import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:unifarme/constants/colors.dart';

import '../../../constants/colors.dart';
import '../../../constants/colors.dart';
import '../../../constants/colors.dart';
import '../../../constants/colors.dart';
import '../../../constants/colors.dart';
import '../../../constants/colors.dart';
import '../../../constants/colors.dart';
import '../../../constants/colors.dart';
import '../../../constants/colors.dart';
import '../../../constants/colors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String phoneNumber;
  String phoneIsoCode;

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: HexColor(cream),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logos/logo.png",
              width: 120.0,
              height: 120.0,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Login",
              style: logsignStyle,
            ),
            SizedBox(
              height: 20,
            ),
            InternationalPhoneInput(
              onPhoneNumberChange: onPhoneNumberChange,
              initialPhoneNumber: phoneNumber,
              initialSelection: phoneIsoCode,
              enabledCountries: ['+91'],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    HexColor(green),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("/otp/screen");
                },
                child: Text(
                  "Get OTP",
                  style: TextStyle(
                    color: HexColor(blueVarText),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    HexColor(blueVar),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email,
                      size: 30,
                      color: HexColor(cream),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Continue With Email",
                      style: withEmailStyleBtn,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: SignInButton(
                Buttons.Google,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
