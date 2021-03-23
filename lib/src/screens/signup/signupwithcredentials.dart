import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:unifarme/src/screens/unifarmeLogo.dart';
import 'package:email_validator/email_validator.dart' as vd;

import '../../../constants/colors.dart';

class SignupWithCredentials extends StatefulWidget {
  @override
  _SignupWithCredentialsState createState() => _SignupWithCredentialsState();
}

class _SignupWithCredentialsState extends State<SignupWithCredentials> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool clickedSignup = false;
  String email = "";
  String password = "";
  String name = "";

  var validEmial = null;
  var validPassword = null;
  var validName = null;

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

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
      body: Container(
        padding: EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UnifarmeLogo(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Signup With Credentials",
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
          nameField(context),
          SizedBox(
            height: 10,
          ),
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
          (clickedSignup ? loadingWidget() : Text("")),
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

  Widget nameField(context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: HexColor(blueVar)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "name",
          hintStyle: TextStyle(fontSize: 25),
          hintText: "Boanerges",
          labelStyle: TextStyle(
            color: HexColor(green),
          ),
          prefixIcon: Icon(
            FontAwesomeIcons.pen,
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
        validator: (name) {
          if (name.length == 0) {
            return "Name field required";
          }
          return null;
        },
        onSaved: (name) {
          this.name = name;
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
        validator: passwordValidator,
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
            clickedSignup = true;
          });
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            // print("object");
          } else {}
          setState(() {
            clickedSignup = false;
          });
        },
        child: Text(
          "Signup",
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
