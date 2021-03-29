import 'package:flutter/material.dart';
import 'package:unifarme/src/screens/homepage/menuscreen/menuscreen.dart';

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: UserMenuScreen(),
    );
  }
}
