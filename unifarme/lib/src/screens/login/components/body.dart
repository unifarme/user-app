import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/models/user.dart';
import 'package:unifarme/src/providers/googleSignInProvider.dart';
import 'package:unifarme/src/providers/userProvider.dart';
import 'package:unifarme/src/request/user/user.dart';
import 'package:unifarme/src/screens/Login/components/background.dart';
import 'package:unifarme/components/already_have_an_account_acheck.dart';
import 'package:unifarme/components/rounded_button.dart';
import 'package:unifarme/components/rounded_input_field.dart';
import 'package:unifarme/components/rounded_password_field.dart';
import 'package:unifarme/src/screens/Login/components/or_divider.dart';
import 'package:unifarme/src/screens/Login/components/social_icon.dart';
import 'package:unifarme/src/screens/unifarmeLogo.dart';
import 'package:email_validator/email_validator.dart' as vd;

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool clickedLogin = false;

  String password;
  String email;
  bool passwordObscure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                UnifarmeLogo(),
                Positioned(
                    child: Container(
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  hintText: "Your Email",
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (vd.EmailValidator.validate(value)) {
                      return null;
                    } else {
                      return "Please enter a valid email";
                    }
                  },
                ),
                RoundedPasswordField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: passwordObscure,
                  changeVisibility: () {
                    setState(() {
                      passwordObscure = !passwordObscure;
                    });
                  },
                  validator: (value) {
                    if (value.length == 0) {
                      return "Password  required";
                    }
                    return null;
                  },
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () async {
                    setState(() {
                      clickedLogin = true;
                    });
                    if (_formKey.currentState.validate()) {
                      // _formKey.currentState.save();
                      UserRequest userReq = UserRequest.login(
                        email: email,
                        password: password,
                      );

                      var data = await userReq.loginUser();

                      if (data == null) {
                        final snackBar = SnackBar(
                          content: Text(
                            'Please check your intenet Connection',
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: HexColor(
                            green,
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        if (!data["logged"]) {
                          final snackBar = SnackBar(
                            content: Text(
                              'Email or password incorrect',
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: HexColor(
                              green,
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (data["logged"]) {
                          // Check if email is verified
                          if (!data["verify_email"]) {
                            Navigator.of(context)
                                .popAndPushNamed('/verify/email/cover');
                          } else if (data["verify_email"] && data["logged"]) {
                            UserModel logUser = UserModel.fromJson(data);
                            userModelProv.updateUserModel(logUser);
                            Navigator.of(context).popAndPushNamed('/home');
                          }
                        }
                      }
                      print(data);
                    } else {}
                    setState(
                      () {
                        clickedLogin = false;
                      },
                    );
                  },
                ),
                SizedBox(height: size.height * 0.03),
                (clickedLogin ? loadingWidget() : Text("")),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.of(context).pushNamed("/signup");
                  },
                ),
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc:
                          "https://firebasestorage.googleapis.com/v0/b/unifar-me.appspot.com/o/logos%2FGoogle.png?alt=media&token=64bb5d75-4f52-4a26-a319-d8c07ef9ff0a",
                      press: () async {
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
                    SocalIcon(
                      iconSrc:
                          "https://firebasestorage.googleapis.com/v0/b/unifar-me.appspot.com/o/logos%2FPhone.png?alt=media&token=139c5bb3-d3b4-44c4-a4e3-49f1ef78fe5e",
                      press: () {
                        Navigator.of(context).pushNamed("/otp/screen");
                      },
                    )
                  ],
                )
              ],
            ),
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
