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
    apiKey: 'AIzaSyBexJEXB_ScRnRYZ48Epsj6ODKxZZIEZbM',
    appId: '1:250874616128:web:ce7ac184e2e39ddf4102a5',
    messagingSenderId: '250874616128',
    projectId: 'oneinvest-cce5f',
    authDomain: 'oneinvest-cce5f.firebaseapp.com',
    databaseURL: 'https://oneinvest-cce5f-default-rtdb.firebaseio.com',
    storageBucket: 'oneinvest-cce5f.appspot.com',
    measurementId: 'G-3M07L0FEVX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_nIST0l_YAcdnM4lvLR9nllf5GUF9DUQ',
    appId: '1:250874616128:android:53347a43fcf733c64102a5',
    messagingSenderId: '250874616128',
    projectId: 'oneinvest-cce5f',
    databaseURL: 'https://oneinvest-cce5f-default-rtdb.firebaseio.com',
    storageBucket: 'oneinvest-cce5f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACyRPWApC7EpT3NrhnE26qGJX8l4JD-vY',
    appId: '1:250874616128:ios:16f0cde94be229dc4102a5',
    messagingSenderId: '250874616128',
    projectId: 'oneinvest-cce5f',
    databaseURL: 'https://oneinvest-cce5f-default-rtdb.firebaseio.com',
    storageBucket: 'oneinvest-cce5f.appspot.com',
    iosBundleId: 'com.example.oneinvest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACyRPWApC7EpT3NrhnE26qGJX8l4JD-vY',
    appId: '1:250874616128:ios:a6c4a95743128b174102a5',
    messagingSenderId: '250874616128',
    projectId: 'oneinvest-cce5f',
    databaseURL: 'https://oneinvest-cce5f-default-rtdb.firebaseio.com',
    storageBucket: 'oneinvest-cce5f.appspot.com',
    iosBundleId: 'com.example.oneinvest.RunnerTests',
  );
}
