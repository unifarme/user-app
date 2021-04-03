import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/providers/googleSignInProvider.dart';
import 'package:unifarme/src/providers/navBottom.dart';
import 'package:unifarme/src/providers/userProvider.dart';
import 'package:unifarme/src/screens/homepage/appBar.dart';
import 'package:unifarme/src/screens/homepage/buttomNav.dart';
import 'package:unifarme/src/screens/homepage/farmer/farmer.dart';
import 'package:unifarme/src/screens/homepage/friends/friend.dart';
import 'package:unifarme/src/screens/homepage/home/home.dart';
import 'package:unifarme/src/screens/homepage/news/newsPage.dart';
import 'package:unifarme/src/screens/homepage/setting/settings.dart';
import 'package:unifarme/src/screens/homepage/userDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userModelProv = Provider.of<UserProvider>(context);
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
                  child: Text('Logout'),
                ),
                PopupMenuItem(
                  key: Key("settings"),
                  value: "settings",
                  child: Text('Settings'),
                ),
                PopupMenuItem(
                  key: Key("profile"),
                  value: "profile",
                  child: Text('Profile'),
                ),
              ],
              icon: CircleAvatar(
                backgroundImage: NetworkImage(
                  userModelProv.getUserModel.picture,
                ),
              ),
              onSelected: (value) async {
                print(value);
                if (value == "settings") {
                  Navigator.of(context).pushNamed('/settings');
                } else if (value == "profile") {
                  Navigator.of(context).popAndPushNamed('/profile');
                } else if (value == "logout") {
                  final googleSignInProvider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  await googleSignInProvider.logout();
                  print("Yes");
                  Navigator.of(context).popAndPushNamed('/login');
                } // log the student out at the back end
                else {
                  print(value);
                }
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/product/search');
              },
            ),

            IconButton(
              icon: Badge(
                badgeContent: Text(
                  "4",
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),

            IconButton(
              icon: Badge(
                badgeContent: Text(
                  "3",
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            )
            // IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
          ],
        ),
        drawer: UserDrawer(),
        bottomNavigationBar: BottomNav(),
        // body: Text("Hello"));
        body: [
          Home(),
          NewsPage(),
          Farmer(),
          Friend(),
          Settings(),
        ].elementAt(navIndex.getBottomNavIndex));
  }
}
