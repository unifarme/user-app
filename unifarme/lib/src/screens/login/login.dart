import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/screens/unifarmeLogo.dart';

import '../../../constants/colors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
              UnifarmeLogo(),
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
                  onPressed: () {
                    Navigator.of(context).pushNamed("/login/credential");
                  },
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
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      "New to Unifar.me",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
