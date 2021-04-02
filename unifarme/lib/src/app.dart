import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:unifarme/src/providers/googleSignInProvider.dart';
import 'package:unifarme/src/providers/navBottom.dart';
import 'package:unifarme/src/providers/selectedItem.dart';
import 'package:unifarme/src/providers/userProvider.dart';
import 'package:unifarme/src/routes/routes.dart';
import 'package:unifarme/src/splashscreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BottomNavIndexProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GoogleSignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SelectedItemProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
