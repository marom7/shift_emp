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
    apiKey: 'AIzaSyCVWZhpZOh1vSLFhoTTGtQr52PhB-bQGWo',
    appId: '1:472323542984:web:0f04262af460e4ab563afd',
    messagingSenderId: '472323542984',
    projectId: 'employee-shifts-506a0',
    authDomain: 'employee-shifts-506a0.firebaseapp.com',
    storageBucket: 'employee-shifts-506a0.appspot.com',
    measurementId: 'G-EQEJ6S566X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdWJ5WsBmBUT_i1IGRU2aYNQEN0JEf9bk',
    appId: '1:472323542984:android:2751ee0def0cf8ff563afd',
    messagingSenderId: '472323542984',
    projectId: 'employee-shifts-506a0',
    storageBucket: 'employee-shifts-506a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwUO1Gm5JdKxYfSZiMwb_ca5hLqdIP_Ec',
    appId: '1:472323542984:ios:bd99a2ed6ab3be34563afd',
    messagingSenderId: '472323542984',
    projectId: 'employee-shifts-506a0',
    storageBucket: 'employee-shifts-506a0.appspot.com',
    iosBundleId: 'com.example.empShift',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwUO1Gm5JdKxYfSZiMwb_ca5hLqdIP_Ec',
    appId: '1:472323542984:ios:720dfb4032416c46563afd',
    messagingSenderId: '472323542984',
    projectId: 'employee-shifts-506a0',
    storageBucket: 'employee-shifts-506a0.appspot.com',
    iosBundleId: 'com.example.empShift.RunnerTests',
  );
}
