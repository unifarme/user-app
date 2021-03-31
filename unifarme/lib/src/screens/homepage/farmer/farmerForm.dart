import 'dart:ffi';
import 'dart:io';
import 'package:email_validator/email_validator.dart' as vd;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/providers/userProvider.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class FarmerForm extends StatefulWidget {
  @override
  _FarmerFormState createState() => _FarmerFormState();
}

class _FarmerFormState extends State<FarmerForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Position _currentPosition;

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

  String phoneIsoCode;

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      mobile_no = number;
      phoneIsoCode = isoCode;
    });
  }

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      print(position);
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          userImage(),
          SizedBox(
            height: 30,
          ),
          formWidget(),
        ],
      ),
    );
  }

  Widget userImage() {
    final userProv = Provider.of<UserProvider>(context);
    if (_image != null) {
      return Stack(
        children: [
          CircleAvatar(
            radius: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.file(
                _image,
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 35, //give the values according to your requirement
            child: GestureDetector(
              child: Icon(
                Icons.add_a_photo,
                color: Colors.pink,
              ),
              onTap: getImage,
            ),
          ),
        ],
      );
    }
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          child: userProv.getUserModel.picture != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: userProv.getUserModel.picture != null
                      ? GestureDetector(
                          child: Image.network(
                            userProv.getUserModel.picture,
                            fit: BoxFit.cover,
                            width: 120,
                            height: 120,
                          ),
                          onTap: getImage,
                        )
                      : Image.file(
                          _image,
                          width: 120,
                          height: 120,
                          fit: BoxFit.fitHeight,
                        ),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey[800],
                  ),
                ),
        ),
        Positioned(
          bottom: 0, right: 35, //give the values according to your requirement
          child: GestureDetector(
            child: Icon(
              Icons.add_a_photo,
              color: Colors.pink,
            ),
            onTap: getImage,
          ),
        ),
      ],
    );
  }

  Widget formWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          nameField(context),
          SizedBox(
            height: 5,
          ),
          emailField(context),
          SizedBox(
            height: 5,
          ),
          addressField(context),
          SizedBox(
            height: 5,
          ),
          InternationalPhoneInput(
            onPhoneNumberChange: onPhoneNumberChange,
            initialPhoneNumber: mobile_no,
            initialSelection: phoneIsoCode,
            enabledCountries: ['+91'],
            hintText: "8264174451",
          ),
          SizedBox(
            height: 5,
          ),
          SelectState(
            // style: TextStyle(color: Colors.red),
            onCountryChanged: (value) {
              setState(() {
                country = value;
              });
            },
            onStateChanged: (value) {
              setState(() {
                state = value;
              });
            },
            onCityChanged: (value) {
              setState(() {
                city = value;
              });
            },
          ),
          SizedBox(
            height: 5,
          ),
          getLocation()
        ],
      ),
    );
  }

  Widget nameField(context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: HexColor(blueVar)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Name",
          hintStyle: TextStyle(fontSize: 25),
          hintText: "Suraj",
        ),
        validator: (email) {
          // if (vd.EmailValidator.validate(email)) {
          //   return null;
          // } else {
          //   return "please enter a valid email";
          // }
        },
        onSaved: (name) {
          this.name = name;
        },
      ),
    );
  }

  Widget emailField(context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: HexColor(blueVar)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Email",
          hintStyle: TextStyle(fontSize: 25),
          hintText: "example@123.com",
        ),
        validator: (email) {
          if (vd.EmailValidator.validate(email)) {
            return null;
          } else {
            return "please enter a valid email";
          }
        },
        onSaved: (email) {
          this.email = email;
        },
      ),
    );
  }

  Widget addressField(context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: HexColor(blueVar)),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Address",
          hintStyle: TextStyle(fontSize: 25),
          hintText: "Mataheko Jonkrobi",
        ),
        validator: (address) {
          // if (vd.EmailValidator.validate(email)) {
          //   return null;
          // } else {
          //   return "please enter a valid email";
          // }
        },
        onSaved: (email) {
          this.email = email;
        },
      ),
    );
  }

  Widget getLocation() {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          HexColor(blueVar),
        ),
      ),
      child: Text("Get location"),
      onPressed: () {
        _getCurrentLocation();
      },
    );
  }
}
