import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:love_stories/screens/auth/custom_forget_password_screen.dart';
import 'package:love_stories/screens/auth/custom_verify_email_screen.dart';

import '../dashboard_screen.dart';

class CustomSignInScreen extends StatelessWidget {
  static const String routeName = '/sign-in';

  const CustomSignInScreen({Key? key}) : super(key: key);

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
    return SignInScreen(
      actions: [
        ForgotPasswordAction((ctx, email) {
          Navigator.of(ctx).pushNamed(
            CustomForgetPasswordScreen.routeName,
            arguments: {'email': email},
          );
        }),
        AuthStateChangeAction<SignedIn>((ctx, state) {
          if (!state.user!.emailVerified) {
            Navigator.of(ctx).pushNamed(CustomVerifyEmailScreen.routeName);
          } else {
            Navigator.of(ctx).pushReplacementNamed(DashboardScreen.routeName);
          }
          _showAuthMessage(context, 'Successfully Sign In.');
        }),
        AuthStateChangeAction<UserCreated>((ctx, state) {
          if (!state.credential.user!.emailVerified) {
            Navigator.of(ctx).pushNamed(CustomVerifyEmailScreen.routeName);
          } else {
            Navigator.of(ctx).pushReplacementNamed(DashboardScreen.routeName);
          }
          _showAuthMessage(context, 'User Created Successfully.');
        }),
        AuthStateChangeAction<AuthFailed>((ctx, state) {
          if (kDebugMode) {
            print(state.exception);
          }
        }),
        AuthCancelledAction((ctx) {
          Navigator.of(ctx).pushReplacementNamed(CustomSignInScreen.routeName);
          _showAuthMessage(context, 'Authentication Cancelled.');
        })
      ],
    );
  }
}
