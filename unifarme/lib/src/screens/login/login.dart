import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/providers/googleSignInProvider.dart';
import 'package:unifarme/src/providers/userProvider.dart';
import 'package:unifarme/src/request/auth.dart';
import 'package:unifarme/src/screens/unifarmeLogo.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../constants/colors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isSignIn = false;
  bool google = false;

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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final authGoogleProv = Provider.of<GoogleSignInProvider>(context);
    final userModelProv = Provider.of<UserProvider>(context, listen: false);

    if (authGoogleProv.getIsSigningIn) {
      return Container(
        width: width,
        height: height,
        color: HexColor(blueVar),
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 50.0,
        ),
      );
    }

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
                  onPressed: () async {
                    final googleSignIn = Provider.of<GoogleSignInProvider>(
                      context,
                      listen: false,
                    );
                    final data = await googleSignIn.login();
                    if (data != null) {
                      userModelProv.updateUserModel(data);
                      Navigator.of(context).popAndPushNamed('/home');
                    }
                  },
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
