import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/constants/colors.dart';
import 'package:unifarme/src/providers/userProvider.dart';

class UserMenuScreen extends StatefulWidget {
  @override
  _UserMenuScreenState createState() => _UserMenuScreenState();
}

class _UserMenuScreenState extends State<UserMenuScreen> {
  @override
  Widget build(BuildContext context) {
    final userModelProv = Provider.of<UserProvider>(context);
    return Container(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text(userModelProv.getUserModel.email),
            accountName: Text(userModelProv.getUserModel.name),
            decoration: BoxDecoration(color: HexColor(blueVar)),
            currentAccountPicture: GestureDetector(
              onTap: () {
                Navigator.of(context).popAndPushNamed('/profile');
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  userModelProv.getUserModel.picture,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.user),
            title: Text("Profile"),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/profile');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/home');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.shoppingCart),
            title: Text("Orders"),
            onTap: () {
              Navigator.of(context).pushNamed('/orders');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.peopleCarry),
            title: Text("Friends"),
            onTap: () {
              Navigator.of(context).pushNamed('/friends');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(FontAwesomeIcons.hatCowboy),
            title: Text("Farmer"),
            onTap: () {
              print("Yes");
              Navigator.of(context).popAndPushNamed('/farmer');
            },
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  Navigator.of(context).popAndPushNamed(
                    '/settings',
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
