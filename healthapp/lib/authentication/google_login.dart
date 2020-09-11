import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/screens/doctor_pages/doc_chat_screen.dart';
import 'dart:async';
import 'package:healthapp/screens/user_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:healthapp/authentication/user.dart' as globals;

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
SharedPreferences prefs;

bool isLoading = false;
bool isLoggedIn = false;
FirebaseUser currentUser;

Future<Null> handleSignIn(BuildContext context) async {
  prefs = await SharedPreferences.getInstance();

  try {
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken, // allows access
      idToken: googleAuth.idToken, // contains info about user
    );

    FirebaseUser firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;

    if (firebaseUser != null) {
      globals.user.email = firebaseUser.email;
      // Check is already sign up
      final QuerySnapshot result = await Firestore.instance
          .collection('user')
          .where('id', isEqualTo: firebaseUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;

      // Update data to server if new user
      Firestore.instance.collection('user').document(firebaseUser.uid).setData({
        'name': firebaseUser.displayName,
        'photoUrl': firebaseUser.photoUrl,
        'id': firebaseUser.uid,
        'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
        'chattingWith': null,
        'email': firebaseUser.email,
      });

      // Write data to local
      currentUser = firebaseUser;
      globals.user.photo = firebaseUser.photoUrl;
      globals.user.id = firebaseUser.uid;
      globals.user.name = firebaseUser.displayName;
      globals.user.email = firebaseUser.email;
      print('NAME ${globals.user.name}');
      print('EMAIL ${globals.user.email}');
      print('photo ${globals.user.photo}');
      print('id ${globals.user.id}');
      await prefs.setString('id', currentUser.uid);
      await prefs.setString('name', currentUser.displayName);
      await prefs.setString('photo', currentUser.photoUrl);
      await prefs.setString('email', currentUser.email);

      print("Successfully Signed in");

      if (globals.user.id == 'HxotQtogDhYYb9wW4EbyqV3Vd1x1') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DocChatScreen(
                      currentUserId: firebaseUser.uid,
                    )));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    UserForm(currentUserId: firebaseUser.uid)));
      }
    } else {
      Fluttertoast.showToast(msg: "Sign in failed, Try Again");
      print("Sign in failed, Try Again");
    }
  } catch (e) {
    print(e.toString());
    print('Exception Caught!');
  }

  // ignore: unused_element
  void signOutGoogle() async {
    await googleSignIn.signOut();
    print("Google Sign Out Successful");
  }
  // check the drawer.dart for details on this one!!
}
