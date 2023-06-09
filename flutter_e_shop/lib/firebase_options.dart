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
        return macos;
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
    apiKey: 'AIzaSyBl5xhe28NYZetJvnd-PP-4eSJVrwC-AFA',
    appId: '1:303106680848:web:4eb7799afe8b39d18e4295',
    messagingSenderId: '303106680848',
    projectId: 'flutter-e-shop-c43c3',
    authDomain: 'flutter-e-shop-c43c3.firebaseapp.com',
    storageBucket: 'flutter-e-shop-c43c3.appspot.com',
    measurementId: 'G-S20JEFTRN0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6Rq0D68SkRhBDfaD2KR08GZm1Zq2rllo',
    appId: '1:303106680848:android:378da051850103c08e4295',
    messagingSenderId: '303106680848',
    projectId: 'flutter-e-shop-c43c3',
    storageBucket: 'flutter-e-shop-c43c3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0HvUifoLQMiKeE1N17JY_ZVlvTfLiF18',
    appId: '1:303106680848:ios:3c1e23526278d44d8e4295',
    messagingSenderId: '303106680848',
    projectId: 'flutter-e-shop-c43c3',
    storageBucket: 'flutter-e-shop-c43c3.appspot.com',
    iosClientId: '303106680848-ka3f3ujnomro97u8qc8osm9ca5dfbpcm.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterEShop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0HvUifoLQMiKeE1N17JY_ZVlvTfLiF18',
    appId: '1:303106680848:ios:3c1e23526278d44d8e4295',
    messagingSenderId: '303106680848',
    projectId: 'flutter-e-shop-c43c3',
    storageBucket: 'flutter-e-shop-c43c3.appspot.com',
    iosClientId: '303106680848-ka3f3ujnomro97u8qc8osm9ca5dfbpcm.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterEShop',
  );
}
