import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
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
            top: 0,
            left: 0,
            child: CachedNetworkImage(
              imageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/unifar-me.appspot.com/o/images%2Ftop.png?alt=media&token=e698d4ff-9c79-4e83-80b3-3f724df74379",
              width: size.width * 0.35,
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
          child,
        ],
      ),
    );
  }
}
