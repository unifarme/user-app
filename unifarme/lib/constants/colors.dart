import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

var green = "#AADE87";
var cream = "#F7F8F3";
var lightBlueVar = "#ADDCCA";
var blueVar = "#52ADA2";
var myGray = "#eeeeee";

var greenColorText = "#447B1C";
var creamColorText = "#258C80";
var lightBlueVarText = "#258C80";
var blueVarText = "#F7F8F3";

Color greyColor = Colors.grey;
Color whiteColor = Colors.white;
Color blackColor = Colors.black;

SizedBox heightSpace = SizedBox(height: 10.0);
SizedBox widthSpace = SizedBox(width: 10.0);

double fixPadding = 10.0;

TextStyle bigHeadingStyle = TextStyle(
  fontSize: 22.0,
  color: HexColor(lightBlueVar),
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w600,
);

TextStyle headingStyle = TextStyle(
  fontSize: 18.0,
  color: HexColor(lightBlueVar),
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

TextStyle wbuttonWhiteTextStyle = TextStyle(
  fontSize: 16.0,
  color: HexColor(blueVarText),
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

TextStyle logsignStyle = TextStyle(
  color: HexColor(creamColorText),
  fontFamily: 'Roboto',
  fontSize: 40,
  fontWeight: FontWeight.bold,
);

TextStyle withEmailStyleBtn = TextStyle(
  color: Colors.white,
  fontFamily: 'Roboto',
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

TextStyle lightGreyStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.black,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

// List Item Style Start
TextStyle listItemTitleStyle = TextStyle(
  fontSize: 15.0,
  color: HexColor(lightBlueVar),
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);
