import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/Screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth fAuth = FirebaseAuth.instance;
User? user;

signInWithGoogle(BuildContext context) async {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  final GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount?.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken);

  UserCredential result = await firebaseAuth.signInWithCredential(credential);

  User? userDetails = result.user;

  Map<String, dynamic> userInfoMap = {
    "email": userDetails!.email,
    "name": userDetails.displayName,
    "imgUrl": userDetails.photoURL,
    "id": userDetails.uid
  };
  await DatabaseMethods().addUser(userDetails.uid, userInfoMap).then((value) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Dashboard()));
  });
}

class DatabaseMethods {
  Future addUser(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("User")
        .doc(userId)
        .set(userInfoMap);
  }
}
