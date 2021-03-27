import 'package:flutter/material.dart';

class BottomNavIndexProvider extends ChangeNotifier {
  int index = 0;

  int get getBottomNavIndex => index;

  void setBottomNavIndex(int a) {
    index = a;
    notifyListeners();
  }
}
