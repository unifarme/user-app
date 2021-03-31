import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/providers/googleSignInProvider.dart';
import 'package:unifarme/src/providers/userProvider.dart';
import 'package:unifarme/src/screens/Login/components/background.dart';
import 'package:unifarme/components/already_have_an_account_acheck.dart';
import 'package:unifarme/components/rounded_button.dart';
import 'package:unifarme/components/rounded_input_field.dart';
import 'package:unifarme/components/rounded_password_field.dart';
import 'package:unifarme/src/screens/Login/components/or_divider.dart';
import 'package:unifarme/src/screens/Login/components/social_icon.dart';
import 'package:unifarme/src/screens/unifarmeLogo.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

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
    return Background(
      child: SingleChildScrollView(
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
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.of(context).pushNamed("/signup");
              },
            ),
            OrDivider(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
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
            ])
          ],
        ),
      ),
    );
  }
}
