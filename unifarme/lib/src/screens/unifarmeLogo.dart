import 'package:flutter/material.dart';

class UnifarmeLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Center(
            child: Image.asset(
              "assets/logos/logo.png",
              width: 150.0,
              height: 150.0,
            ),
          ),
        ),
      ],
    );
  }
}
