import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/providers/userProvider.dart';
import 'package:unifarme/src/screens/homepage/farmer/farmerForm.dart';
import 'package:unifarme/src/screens/homepage/farmer/farmerProfile/FarmerPage.dart';

class Farmer extends StatefulWidget {
  @override
  _FarmerState createState() => _FarmerState();
}

class _FarmerState extends State<Farmer> {
  bool switchButton = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final userModelProv = Provider.of<UserProvider>(context);
    return Container(
      width: width,
      // height: height,
      child: userModelProv.getUserModel.isFarmer
          ? FarmerPage()
          : Container(
              width: width,
              height: height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Become Farmer",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Switch(
                          value: switchButton,
                          onChanged: (value) async {
                            setState(() {
                              switchButton = value;
                            });
                          },
                          activeTrackColor: HexColor(lightBlueVar),
                          activeColor: HexColor(blueVar),
                        )
                      ],
                    ),
                    switchButton ? FarmerForm() : Text(""),
                  ],
                ),
              ),
            ),
    );
  }
}
