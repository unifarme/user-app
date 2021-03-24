import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/screens/hompage/homepage.dart';
import 'package:unifarme/src/screens/hompage/menuscreen/menuscreen.dart';

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  final _drawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: UserMenuScreen(),
    );
  }
}
