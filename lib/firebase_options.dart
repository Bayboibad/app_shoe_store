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
    apiKey: 'AIzaSyC85KrU_R2YTUIhURLX36BRGMfG3oykhX8',
    appId: '1:771892382040:web:1a21fe0abb1bad7861bd2d',
    messagingSenderId: '771892382040',
    projectId: 'appshoestore-2cb34',
    authDomain: 'appshoestore-2cb34.firebaseapp.com',
    storageBucket: 'appshoestore-2cb34.appspot.com',
    measurementId: 'G-9LC76N52BX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgSwsYsk9hkDSBU6Q9flE42OjUGo56hps',
    appId: '1:771892382040:android:69458360aec4229161bd2d',
    messagingSenderId: '771892382040',
    projectId: 'appshoestore-2cb34',
    storageBucket: 'appshoestore-2cb34.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjiGFzi4CyTH18kkWUh2bOm4mYT0Tphik',
    appId: '1:771892382040:ios:4e64f2b297c2a2ef61bd2d',
    messagingSenderId: '771892382040',
    projectId: 'appshoestore-2cb34',
    storageBucket: 'appshoestore-2cb34.appspot.com',
    iosBundleId: 'com.example.appShoeStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCjiGFzi4CyTH18kkWUh2bOm4mYT0Tphik',
    appId: '1:771892382040:ios:474397f2131ca60261bd2d',
    messagingSenderId: '771892382040',
    projectId: 'appshoestore-2cb34',
    storageBucket: 'appshoestore-2cb34.appspot.com',
    iosBundleId: 'com.example.appShoeStore.RunnerTests',
  );
}
