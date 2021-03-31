import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/providers/googleSignInProvider.dart';
import 'package:unifarme/src/providers/userProvider.dart';
import 'package:unifarme/src/request/user/user.dart';
import 'package:unifarme/src/screens/signup/components/background.dart';
import 'package:unifarme/components/already_have_an_account_acheck.dart';
import 'package:unifarme/components/rounded_button.dart';
import 'package:unifarme/components/rounded_input_field.dart';
import 'package:unifarme/components/rounded_password_field.dart';
import 'package:unifarme/src/screens/signup/components/or_divider.dart';
import 'package:unifarme/src/screens/signup/components/social_icon.dart';
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
  bool clickedSignup = false;
  String email = "";
  String password = "";
  String name = "";

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

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
    Size size = MediaQuery.of(context).size;
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
                      "Sign up",
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
                  hintText: "Your Name",
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (name) {
                    if (name.length == 0) {
                      return "Name field required";
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  hintText: "Your Email",
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (email) {
                    if (vd.EmailValidator.validate(email)) {
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
                  validator: passwordValidator,
                ),
                RoundedButton(
                  text: "SIGN UP",
                  press: () async {
                    setState(() {
                      clickedSignup = true;
                    });
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      UserRequest userReq = UserRequest(
                        email: email,
                        name: name,
                        password: password,
                      );

                      var result = await userReq.signupWithCredentials();
                      print(result);
                      if (result == null) {
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
                        if (result["exist"] && !result["registered"]) {
                          // For user account already exists
                          final snackBar = SnackBar(
                            content: Text(
                              'User with account already exist',
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: HexColor(
                              green,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        if (result["registered"]) {
                          // That means user has been registered successfully
                          Navigator.of(context)
                              .popAndPushNamed('/verify/email/cover');
                        }
                      }
                      print(result);
                    } else {}
                    setState(() {
                      clickedSignup = false;
                    });
                  },
                ),
                SizedBox(height: size.height * 0.03),
                (clickedSignup ? loadingWidget() : Text("")),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.of(context).pushNamed("/login");
                  },
                ),
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/logos/Google.png",
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
                      iconSrc: "assets/logos/Phone.png",
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
