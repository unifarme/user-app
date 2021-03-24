import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/providers/navBottom.dart';
import 'package:unifarme/src/screens/hompage/appBar.dart';
import 'package:unifarme/src/screens/hompage/buttomNav.dart';
import 'package:unifarme/src/screens/hompage/farmer/farmer.dart';
import 'package:unifarme/src/screens/hompage/friends/friend.dart';
import 'package:unifarme/src/screens/hompage/home/home.dart';
import 'package:unifarme/src/screens/hompage/setting/settings.dart';
import 'package:unifarme/src/screens/hompage/userDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    BottomNavIndexProvider navIndex =
        Provider.of<BottomNavIndexProvider>(context);
    return Scaffold(
        appBar: AppBar(
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
              icon: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/43884482?s=460&u=c5d4799c520a8ac3faef1153596bcbaa6be44418&v=4",
                ),
              ),
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
        ),
        drawer: UserDrawer(),
        bottomNavigationBar: BottomNav(),
        // body: Text("Hello"));
        body: [Home(), Text("News"), Farmer(), Friend(), Settings()]
            .elementAt(navIndex.getBottomNavIndex));
  }
}
