import 'dart:ffi';

class UserModel {
  String googleId;
  String name;
  String email;
  String country;
  String mobile_no;
  String picture;
  String state;
  String city;
  String address;
  Map<String, double> location;
  bool logged;
  String auth;
  bool isFarmer;

  // When logging in
  UserModel.fromJson(parsedJson) {
    name = parsedJson["name"] != null ? parsedJson["name"] : "";
    email = parsedJson["email"] != null ? parsedJson["email"] : "";
    country = parsedJson["country"] != null ? parsedJson["country"] : "";
    state = parsedJson["state"] != null ? parsedJson["state"] : "";
    city = parsedJson["city"] != null ? parsedJson["city"] : "";
    address = parsedJson["address"] != null ? parsedJson["address"] : "";
    mobile_no = parsedJson["mobile_no"] != null ? parsedJson["mobile_no"] : "";
    picture = parsedJson["picture"] != null ? parsedJson["picture"] : "";
    logged = parsedJson["logged"] != null ? parsedJson["logged"] : false;
    auth = parsedJson["auth-token"] != null ? parsedJson["auth-token"] : "";
    isFarmer = parsedJson["isFarmer"] != null ? parsedJson["isFarmer"] : false;
    googleId = parsedJson["googleId"] != null ? parsedJson["googleId"] : "";
  }

  // When initializing providers
  UserModel(
      {this.name,
      this.email,
      this.logged,
      this.city,
      this.state,
      this.address,
      this.auth,
      this.country,
      this.mobile_no,
      this.picture,
      this.location,
      this.isFarmer,
      this.googleId});
}
