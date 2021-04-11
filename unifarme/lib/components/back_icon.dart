import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unifarme/constants/colors.dart';

class BackIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const BackIcon({
    Key key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        child: CachedNetworkImage(
          imageUrl: iconSrc,
          height: 48,
          width: 48,
        ),
      ),
    );
  }
}
