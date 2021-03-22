import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unifarme/src/routes/routes.dart';
import 'package:unifarme/src/splashscreen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // SharedPreferences prefs;
  // Map info = {};
  Future value;
  bool logged = false;
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getLoginData();
  }

  Future<void> getLoginData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool('logged') == true) {
      setState(() {
        logged = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (_) => AppState(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
