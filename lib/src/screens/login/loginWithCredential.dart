import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:email_validator/email_validator.dart' as vd;
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';

import '../../../constants/colors.dart';
import '../../../constants/colors.dart';
import '../../../constants/colors.dart';
import '../../../constants/colors.dart';
import '../../../constants/colors.dart';
import '../../../constants/colors.dart';

class LoginCredentials extends StatefulWidget {
  @override
  _LoginCredentialsState createState() => _LoginCredentialsState();
}

class _LoginCredentialsState extends State<LoginCredentials> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool clickedLogin = false;
  String email = "";
  String password = "";

  var validEmial = null;
  var validPassword = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logos/logo.png",
              width: 120.0,
              height: 120.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Login With Credentials",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 35,
            ),
            loginForm(context),
          ],
        ),
      ),
    );
  }

  Widget loginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailField(context),
          SizedBox(
            height: 10,
          ),
          passwordField(context),
          SizedBox(
            height: 10,
          ),
          loginField(context),
          SizedBox(
            height: 5,
          ),
          (clickedLogin ? loadingWidget() : Text("")),
        ],
      ),
    );
  }

  Widget emailField(context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: HexColor(blueVar)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "email",
          hintStyle: TextStyle(fontSize: 25),
          hintText: "example@123.com",
          labelStyle: TextStyle(
            color: HexColor(green),
          ),
          prefixIcon: Icon(
            FontAwesomeIcons.user,
            color: HexColor(green),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: HexColor(green),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: HexColor(green),
            ),
          ),
        ),
        validator: (email) {
          if (vd.EmailValidator.validate(email)) {
            return null;
          } else {
            return "please enter a valid email";
          }
        },
        onSaved: (email) {
          this.email = email;
        },
      ),
    );
  }

  Widget passwordField(context) {
    return Theme(
      child: TextFormField(
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "password",
          hintStyle: TextStyle(fontSize: 25),
          hintText: "*******",
          labelStyle: TextStyle(
            color: HexColor(green),
          ),
          prefixIcon: Icon(
            FontAwesomeIcons.lock,
            color: HexColor(green),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: HexColor(green),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: HexColor(green),
            ),
          ),
        ),
        onSaved: (password) {
          this.password = password;
        },
      ),
      data: Theme.of(context).copyWith(primaryColor: HexColor(blueVar)),
    );
  }

  Widget loginField(context) {
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
          setState(() {
            clickedLogin = true;
          });
          if (_formKey.currentState.validate()) {
            // print("object");
          } else {}
          setState(() {
            clickedLogin = false;
          });
        },
        child: Text(
          "Login",
          style: TextStyle(
            color: HexColor(blueVarText),
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return Center(
      child: Loading(
        color: Colors.pink,
        indicator: BallSpinFadeLoaderIndicator(),
        size: 50,
      ),
    );
  }
}
