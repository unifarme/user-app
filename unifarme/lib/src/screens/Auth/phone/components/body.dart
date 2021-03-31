import 'package:flutter/material.dart';
import 'package:unifarme/src/screens/Login/components/background.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/components/rounded_button.dart';
import 'package:unifarme/components/rounded_input_field.dart';
import 'package:unifarme/components/rounded_password_field.dart';
import 'package:unifarme/src/screens/unifarmeLogo.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String mobile_no;
  String phoneIsoCode;

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      mobile_no = number;
      phoneIsoCode = isoCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              UnifarmeLogo(),
              Positioned(
                  child: Container(
                child: Center(
                  child: Text(
                    "Phone Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
              SizedBox(height: size.height * 0.03),
              SizedBox(
                height: 20,
              ),
              InternationalPhoneInput(
                onPhoneNumberChange: onPhoneNumberChange,
                initialPhoneNumber: mobile_no,
                initialSelection: phoneIsoCode,
                enabledCountries: ['+91'],
                hintText: "8264174451",
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              // Divider(
              //   thickness: 2,
              // ),
              SizedBox(
                height: 10,
              ),
              RoundedButton(
                text: "GET OTP",
                press: () {
                  Navigator.of(context).pushNamed("/otp/screen/signup");
                },
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
