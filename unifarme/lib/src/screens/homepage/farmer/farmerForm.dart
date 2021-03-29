import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/src/providers/userProvider.dart';

class FarmerForm extends StatefulWidget {
  @override
  _FarmerFormState createState() => _FarmerFormState();
}

class _FarmerFormState extends State<FarmerForm> {
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            userImage(),
          ],
        ),
      ),
    );
  }

  Widget userImage() {
    final userProv = Provider.of<UserProvider>(context);
    return CircleAvatar(
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
    );
  }
}
