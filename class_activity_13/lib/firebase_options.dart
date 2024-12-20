// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyC5-YPeVs1Rvuagfe29eIvDX6_9628f09U',
    appId: '1:360125137286:web:4547465598d8cc3fd26c07',
    messagingSenderId: '360125137286',
    projectId: 'class-assignment-10-66d56',
    authDomain: 'class-assignment-10-66d56.firebaseapp.com',
    storageBucket: 'class-assignment-10-66d56.firebasestorage.app',
    measurementId: 'G-62ZYHSW0YG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAeqKFOdNtfWJ_6jCMQ1OHMhPk9hHQlWE',
    appId: '1:360125137286:android:dac255c331fb327fd26c07',
    messagingSenderId: '360125137286',
    projectId: 'class-assignment-10-66d56',
    storageBucket: 'class-assignment-10-66d56.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5y0ZwoIsW4dDo731PK_-yOVNukMmz7Zc',
    appId: '1:360125137286:ios:2bdb69974991a25ad26c07',
    messagingSenderId: '360125137286',
    projectId: 'class-assignment-10-66d56',
    storageBucket: 'class-assignment-10-66d56.firebasestorage.app',
    iosBundleId: 'com.example.classActivity13',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5y0ZwoIsW4dDo731PK_-yOVNukMmz7Zc',
    appId: '1:360125137286:ios:2bdb69974991a25ad26c07',
    messagingSenderId: '360125137286',
    projectId: 'class-assignment-10-66d56',
    storageBucket: 'class-assignment-10-66d56.firebasestorage.app',
    iosBundleId: 'com.example.classActivity13',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC5-YPeVs1Rvuagfe29eIvDX6_9628f09U',
    appId: '1:360125137286:web:ce7c5f45b79b082fd26c07',
    messagingSenderId: '360125137286',
    projectId: 'class-assignment-10-66d56',
    authDomain: 'class-assignment-10-66d56.firebaseapp.com',
    storageBucket: 'class-assignment-10-66d56.firebasestorage.app',
    measurementId: 'G-ZCCYLXJ6T5',
  );

}