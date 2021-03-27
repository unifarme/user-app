import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:unifarme/src/screens/unifarmeLogo.dart';

import '../../../constants/colors.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
          padding: EdgeInsets.all(30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UnifarmeLogo(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Signup",
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
              signupBtn(),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              signupwithCredentials(),
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
                      "Already got an account",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: Text(
                        "login",
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

  Widget signupBtn() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            HexColor(green),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed("/otp/screen/signup");
        },
        child: Text(
          "Signup",
          style: TextStyle(
            color: HexColor(blueVarText),
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget signupwithCredentials() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/signup/with/credentials");
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
    );
  }
}
