import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_diary/ui/views/home_page.dart';

class AuthHelper {
  Future signInWithGoogle(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
             accessToken: googleAuth?.accessToken,
             idToken: googleAuth?.idToken,
           );

    UserCredential _userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    User? user = _userCredential.user;



    if(user!.uid.isNotEmpty){
           Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
         } else {
           print('somting rong');
         }

  }

}