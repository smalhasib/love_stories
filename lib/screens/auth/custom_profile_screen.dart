import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:love_stories/screens/auth/custom_sign_in_screen.dart';

class CustomProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  const CustomProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      actions: [
        SignedOutAction((context) { 
          Navigator.of(context).pushReplacementNamed(CustomSignInScreen.routeName);
        })
      ],
    );
  }
}
