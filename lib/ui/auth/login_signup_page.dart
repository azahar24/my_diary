import 'package:flutter/material.dart';
import 'package:my_diary/helper/auth_helper.dart';

class LoginSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => AuthHelper().signInWithGoogle(context),
              child: Text('Login & SignUp With Google'),
            ),
          ),
        ],
      ),
    );
  }
}
