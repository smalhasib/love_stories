import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../dashboard_screen.dart';
import 'custom_sign_in_screen.dart';

class CustomVerifyEmailScreen extends StatelessWidget {
  static const String routeName = '/verify-email';

  const CustomVerifyEmailScreen({Key? key}) : super(key: key);

  void _showAuthMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return EmailVerificationScreen(
      actionCodeSettings: ActionCodeSettings(
        url: 'https://love-stories-54e35.firebaseapp.com',
        handleCodeInApp: true,
      ),
      actions: [
        EmailVerifiedAction(() {
          Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
          _showAuthMessage(context, 'Email Successfully Verified.');
        }),
        AuthCancelledAction((ctx) {
          Navigator.of(ctx).pushReplacementNamed(CustomSignInScreen.routeName);
          _showAuthMessage(context, 'Authentication Failed.');
        })
      ],
    );
  }
}
