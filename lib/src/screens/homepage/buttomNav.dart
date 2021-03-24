import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/providers/navBottom.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    BottomNavIndexProvider nav = Provider.of<BottomNavIndexProvider>(context);
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: HexColor(blueVar),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "News",
            icon: Icon(FontAwesomeIcons.newspaper),
          ),
          BottomNavigationBarItem(
            label: "Farmer",
            icon: Icon(FontAwesomeIcons.hatCowboy),
          ),
          BottomNavigationBarItem(
            label: "Friends",
            icon: Icon(Icons.people),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
        ],
        onTap: (index) {
          nav.setBottomNavIndex(index);
        },
        currentIndex: nav.getBottomNavIndex,
      ),
    );
  }
}
