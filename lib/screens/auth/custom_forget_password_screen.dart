import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class CustomForgetPasswordScreen extends StatelessWidget {
  static const String routeName = '/forgot-password';

  const CustomForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return ForgotPasswordScreen(
      email: arguments?['email'],
    );
  }
}
