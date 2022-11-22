import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:love_stories/screens/dashboard_screen.dart';

import 'helpers/app_constants.dart';
import 'helpers/firebase_options.dart';
import 'screens/auth/custom_profile_screen.dart';
import 'screens/auth/custom_sign_in_screen.dart';
import 'screens/auth/custom_verify_email_screen.dart';
import 'screens/auth/custom_forget_password_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    GoogleProvider(clientId: GOOGLE_CLIENT_ID),
  ]);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  String get initialRoute {
    final auth = FirebaseAuth.instance;

    if (auth.currentUser == null) {
      return CustomSignInScreen.routeName;
    }

    if (!auth.currentUser!.emailVerified && auth.currentUser!.email != null) {
      return CustomVerifyEmailScreen.routeName;
    }

    return DashboardScreen.routeName;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love Stories',
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: initialRoute,
      routes: {
        CustomSignInScreen.routeName: (context) => const CustomSignInScreen(),
        CustomProfileScreen.routeName: (context) => const CustomProfileScreen(),
        CustomForgetPasswordScreen.routeName: (context) =>
            const CustomForgetPasswordScreen(),
        CustomVerifyEmailScreen.routeName: (context) =>
            const CustomVerifyEmailScreen(),
        DashboardScreen.routeName: (context) => const DashboardScreen(),
      },
    );
  }
}
