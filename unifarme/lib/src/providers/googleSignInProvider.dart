import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unifarme/src/models/user.dart';

class GoogleSignInProvider extends ChangeNotifier {
  // Default values
  bool _isLogged;
  bool _inValidLoginCredentials;

  final googleSignIn = GoogleSignIn();
  bool _isSigningIn;

  GoogleSignInProvider() {
    _isSigningIn = false;
    _isLogged = false;
    _inValidLoginCredentials = false;
  }

  bool get getIsLogged => _isLogged;
  bool get getIsInvalid => _inValidLoginCredentials;
  bool get getIsSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  set isLogged(bool isLog) {
    _isLogged = isLog;
    notifyListeners();
  }

  set inValidLoginCredential(bool inval) {
    _inValidLoginCredentials = inval;
    notifyListeners();
  }

  Future login() async {
    isSigningIn = true;
    final user = await googleSignIn.signIn();
    print(user);

    if (user == null) {
      isSigningIn = false;
      isLogged = false;
      return null;
    } else {
      try {
        final googleAuth = await user.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        // It means we are logged in
        isLogged = true;
        isSigningIn = false;
        return new UserModel(
            name: user.displayName,
            email: user.email,
            googleId: user.id,
            picture: user.photoUrl,
            logged: true,
            isFarmer: false);
      } on FirebaseAuthException catch (e) {
        print(e);
        if (e.code == 'account-exists-with-different-credential') {
        } else if (e.code == 'invalid-credential') {
          inValidLoginCredential = false;
          isLogged = false;
          return null;
          // handle the error here
        }
      } catch (e) {
        print(e);
        return null;
        // handle the error here
      }
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
