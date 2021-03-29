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
  Map<String, Float> location;
  bool logged;
  String auth;
  bool isFarmer;

  // When logging in
  UserModel.fromJson(parsedJson) {
    name = parsedJson["name"] ? parsedJson["name"] : "";
    email = parsedJson["email"] ? parsedJson["email"] : "";
    country = parsedJson["country"] ? parsedJson["country"] : "";
    state = parsedJson["state"] ? parsedJson["state"] : "";
    city = parsedJson["city"] ? parsedJson["city"] : "";
    address = parsedJson["address"] ? parsedJson["address"] : "";
    mobile_no = parsedJson["mobile_no"] ? parsedJson["mobile_no"] : "";
    picture = parsedJson["picture"] ? parsedJson["picture"] : "";
    logged = parsedJson["logged"] ? parsedJson["logged"] : false;
    auth = parsedJson["auth-token"] ? parsedJson["auth-token"] : "";
    isFarmer = parsedJson["isFarmer"] ? parsedJson["isFarmer"] : false;
    googleId = parsedJson["googleId"] ? parsedJson["googleId"] : "";
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
