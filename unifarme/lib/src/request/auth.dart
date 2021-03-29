import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth;
  bool isUserSignedIn = false;

  Future signInWithGoogle() async {
    // model.state =ViewState.Busy;
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    // AuthResult authResult = await _auth.signInWithCredential(credential);
    // _user = authResult.user;
    // assert(!_user.isAnonymous);
    // assert(await _user.getIdToken() != null);
    // FirebaseUser currentUser = await _auth.currentUser();
    // assert(_user.uid == currentUser.uid);
    // model.state = ViewState.Idle;
    // print("User Name: ${_user.displayName}");
    // print("User Email ${_user.email}");
  }
}
