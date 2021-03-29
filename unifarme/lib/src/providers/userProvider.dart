import 'package:flutter/material.dart';
import 'package:unifarme/src/models/user.dart';

class UserProvider extends ChangeNotifier {
  UserModel user = new UserModel(
    name: "",
    email: "",
    picture: "",
    logged: false,
    mobile_no: "",
    isFarmer: false,
  );

  // For gettting a particular User
  UserModel get getUserModel => user;

  // For updateing user model
  void updateUserModel(UserModel user) {
    this.user = user;
    notifyListeners();
  }
}
