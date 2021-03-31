import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:unifarme/env.dart';

class UserRequest {
  String name;
  String email;
  String password;
  String mobile_no;
  UserRequest({this.email, this.name, this.password});
  UserRequest.login({this.email, this.password});
  UserRequest.mobile_number({this.mobile_no});

  // Login Methods
  Future loginUser() async {
    try {
      String route = env == "dev" ? urls[0] : urls[1];
      route = route + "/user/login/with/email/credential";
      Uri uri = Uri.parse(route);
      var data = await http.post(
        uri,
        body: json.encode(
          {
            "email": email,
            "password": password,
          },
        ),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      return json.decode(data.body);
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future loginWithPhoneCredentials() async {
    try {
      String route = env == "dev" ? urls[0] : urls[1];
      route = route + "/user/login/with/phone/credential";
      Uri uri = Uri.parse(route);
      var data = await http.post(
        uri,
        body: json.encode(
          {
            "mobile_no": mobile_no,
          },
        ),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      return json.decode(data.body);
    } catch (err) {
      print(err);
      return null;
    }
  }

  // Sign ups or registrations
  Future signupWithCredentials() async {
    try {
      String route = env == "dev" ? urls[0] : urls[1];
      route = route + "/user/register/with/email/credential";
      Uri uri = Uri.parse(route);
      var data = await http.post(
        uri,
        body: json.encode({
          "name": name,
          "email": email,
          "password": password,
        }),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      return json.decode(data.body);
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future signupWithPhoneCredentials() async {
    try {
      String route = env == "dev" ? urls[0] : urls[1];
      route = route + "/user/register/with/phone/credential";
      Uri uri = Uri.parse(route);
      var data = await http.post(
        uri,
        body: json.encode({
          "mobile_no": mobile_no,
        }),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      return json.decode(data.body);
    } catch (err) {
      print(err);
      return null;
    }
  }
}
