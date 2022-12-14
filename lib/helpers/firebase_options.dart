// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBW_G9s1uNHbi3fA_SKddeDTVid0TAXiT8',
    appId: '1:231883818787:web:9dc0e95e62b42be624ae96',
    messagingSenderId: '231883818787',
    projectId: 'love-stories-54e35',
    authDomain: 'love-stories-54e35.firebaseapp.com',
    storageBucket: 'love-stories-54e35.appspot.com',
    measurementId: 'G-NFPRLYGMZH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8Heg9aH2cmMFVxT14Yd0_TZHkc1khW5w',
    appId: '1:231883818787:android:9bf5f162d6287aa224ae96',
    messagingSenderId: '231883818787',
    projectId: 'love-stories-54e35',
    storageBucket: 'love-stories-54e35.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJuY2iMQuyjMfCoTdesPnmbyYDOHzX784',
    appId: '1:231883818787:ios:253098e82d92c71e24ae96',
    messagingSenderId: '231883818787',
    projectId: 'love-stories-54e35',
    storageBucket: 'love-stories-54e35.appspot.com',
    androidClientId: '231883818787-l19eo0bhijs5o8t1q5hvsr4o3s6b5uq8.apps.googleusercontent.com',
    iosClientId: '231883818787-vt2ioljto0hed2392g9c4k6f1ussvgbi.apps.googleusercontent.com',
    iosBundleId: 'com.hasib.loveStories',
  );
}
