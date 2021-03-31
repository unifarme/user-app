import 'package:flutter/material.dart';
import 'package:unifarme/components/rounded_button.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/screens/unifarmeLogo.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    ));

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          child: Container(
                        child: Center(
                          child: Text(
                            "Welcome Back!!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                UnifarmeLogo(),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RoundedButton(
                        text: "LOGIN",
                        press: () {
                          Navigator.of(context).pushNamed("/login");
                        },
                      ),
                      RoundedButton(
                        text: "SIGN UP",
                        color: kAccentColor,
                        textColor: Colors.black,
                        press: () {
                          Navigator.of(context).pushNamed("/signup");
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
