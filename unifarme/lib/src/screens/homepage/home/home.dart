import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/screens/homepage/home/advert/advert.dart';
import 'package:unifarme/src/screens/homepage/home/category/category.dart';
import 'package:unifarme/src/screens/homepage/home/nearbyFarms/farmsNearby.dart';
import 'package:unifarme/src/screens/homepage/home/search/search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool onInputFocus = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: HexColor(myGray),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          SearchInput(),
          SizedBox(
            height: 10,
          ),
          // Text("Adver"),
          AdvertSliderList(),
          CategorySlider(),
          SizedBox(
            height: 10,
          ),
          Text(
            "Farms Nearby",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          FarmsNearBy(),
        ],
      ),
      // child: Column(
      //   children: [
      //     SearchInput(),
      //     SingleChildScrollView(
      //       child: Container(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             SizedBox(
      //               height: 10,
      //             ),
      //             // Text("Adver"),
      //             AdvertSliderList(),
      //             CategorySlider(),
      //             SizedBox(
      //               height: 10,
      //             ),
      //             Text(
      //               "Farms Nearby",
      //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //             ),
      //             FarmsNearBy(),
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
