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
    apiKey: 'AIzaSyDXVrZ6Xy60K8VUfUd0DKWsH95nKpO2Rno',
    appId: '1:569144975210:web:dbe4982fc95a84e131cf13',
    messagingSenderId: '569144975210',
    projectId: 'authamalskuy',
    authDomain: 'authamalskuy.firebaseapp.com',
    storageBucket: 'authamalskuy.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATHkassDLnKP-MqrQKFGyDRK3FWNif8W8',
    appId: '1:569144975210:android:d99415158590014231cf13',
    messagingSenderId: '569144975210',
    projectId: 'authamalskuy',
    storageBucket: 'authamalskuy.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-nDSYjYlXyyZeXEI98aZQTL0zQiAcMdg',
    appId: '1:569144975210:ios:444ea91e1981c66631cf13',
    messagingSenderId: '569144975210',
    projectId: 'authamalskuy',
    storageBucket: 'authamalskuy.appspot.com',
    iosClientId: '569144975210-8t28gmrk44dom3adqqgshuasum88k850.apps.googleusercontent.com',
    iosBundleId: 'com.example.amalskuy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-nDSYjYlXyyZeXEI98aZQTL0zQiAcMdg',
    appId: '1:569144975210:ios:d1c6a1b157347d4431cf13',
    messagingSenderId: '569144975210',
    projectId: 'authamalskuy',
    storageBucket: 'authamalskuy.appspot.com',
    iosClientId: '569144975210-i573sf4uefsbfkoea8h628tp2c0t8usq.apps.googleusercontent.com',
    iosBundleId: 'com.example.amalskuy.RunnerTests',
  );
}
