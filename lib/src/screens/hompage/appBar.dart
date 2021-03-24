import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unifarme/constants/colors.dart';

class UserAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: HexColor(blueVar),
      actions: <Widget>[
        PopupMenuButton(
          itemBuilder: (context) => <PopupMenuEntry>[
            PopupMenuItem(
              key: Key("logout"),
              value: "logout",
              child: GestureDetector(
                child: Text('Logout'),
                onTap: () async {
                  // SharedPreferences pref =
                  //     await SharedPreferences.getInstance();
                  // pref.setBool("logged", false);
                  // pref.remove("passwrd");
                  // pref.remove("email");
                  // print("Logout");
                },
              ),
            ),
            PopupMenuItem(
              key: Key("settings"),
              value: "settings",
              child: Text('Settings'),
            ),
          ],
          // icon: Consumer<StudentInfoProvider>(
          //   builder: (context, user, child) {
          //     return CircleAvatar(
          //       backgroundImage:
          //           NetworkImage(user.getStudentInfo["avatar"]),
          //     );
          //   },
          // ),
          onSelected: (value) async {
            if (value == "settings") {
              Navigator.of(context).pushNamed('/student/sidemenu/settings');
            } else {
              // Navigator.of(context).popUntil(ModalRoute.withName('/login'));
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/student/login', ModalRoute.withName('/studentoption'));
            } // log the student out at the back end
          },
        ),
      ],
    );
  }
}
