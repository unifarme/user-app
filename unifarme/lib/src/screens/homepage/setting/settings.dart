import 'package:flutter/material.dart';
import 'package:unifarme/src/screens/homepage/farmer/farmerProfile/dashboard.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FarmersDashboard(),
    );
  }
}
