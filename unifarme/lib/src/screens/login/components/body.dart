import 'package:flutter/material.dart';
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
                      fontWeight: FontWeight.bold),
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
                press: () {},
              ),
              SocalIcon(
                iconSrc: "assets/logos/Phone.png",
                press: () {},
              )
            ])
          ],
        ),
      ),
    );
  }
}
