import 'package:flutter/material.dart';
import 'package:unifarme/src/screens/unifarmeLogo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:unifarme/components/back_icon.dart';

class SignUpVerifyEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: NetworkImage(
              "https://firebasestorage.googleapis.com/v0/b/unifar-me.appspot.com/o/images%2Fbackground.png?alt=media&token=70a1e11c-9867-41da-b342-f0717201d982"),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 70,
            child: UnifarmeLogo(),
          ),
          Positioned(
            top: 250,
            child: Text(
              "Thank You",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 55,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Card(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "for signing up an unifarme account. \n Please check your email for verification link.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: CachedNetworkImage(
              imageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/unifar-me.appspot.com/o/images%2Ftop.png?alt=media&token=e698d4ff-9c79-4e83-80b3-3f724df74379",
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            top: 25,
            left: 15,
            child: BackIcon(
              iconSrc:
                  "https://firebasestorage.googleapis.com/v0/b/unifar-me.appspot.com/o/logos%2Fback_black.png?alt=media&token=86392194-5794-4143-b2c2-e651301bc338",
              press: () {
                Navigator.pop(context, false);
              },
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CachedNetworkImage(
              imageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/unifar-me.appspot.com/o/images%2Fbottom.png?alt=media&token=b62640b4-c113-4348-9dda-4bf2c0a3d771",
              width: size.width * 0.4,
            ),
          ),
        ],
      ),
    );
  }
}
