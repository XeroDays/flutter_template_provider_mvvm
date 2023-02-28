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
    apiKey: 'AIzaSyDGe49eOVerO2PjxTxcLSLBlCklEsNJuZE',
    appId: '1:504449834445:web:0ae012eaf831e8c8afb884',
    messagingSenderId: '504449834445',
    projectId: 'mvvm-template-apptex',
    authDomain: 'mvvm-template-apptex.firebaseapp.com',
    storageBucket: 'mvvm-template-apptex.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbJNhCm5SEir-NYpkrg1m3Flj5pxGERDk',
    appId: '1:504449834445:android:152165f721d869d0afb884',
    messagingSenderId: '504449834445',
    projectId: 'mvvm-template-apptex',
    storageBucket: 'mvvm-template-apptex.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMB1jzMjV-reKKlWSjo3NhC1mC6n1XTxM',
    appId: '1:504449834445:ios:f920537a3e69af86afb884',
    messagingSenderId: '504449834445',
    projectId: 'mvvm-template-apptex',
    storageBucket: 'mvvm-template-apptex.appspot.com',
    iosClientId: '504449834445-krdr51q5p2g13sdqn3qunj3irkc8o858.apps.googleusercontent.com',
    iosBundleId: 'com.example.mvvmTemplate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMB1jzMjV-reKKlWSjo3NhC1mC6n1XTxM',
    appId: '1:504449834445:ios:f920537a3e69af86afb884',
    messagingSenderId: '504449834445',
    projectId: 'mvvm-template-apptex',
    storageBucket: 'mvvm-template-apptex.appspot.com',
    iosClientId: '504449834445-krdr51q5p2g13sdqn3qunj3irkc8o858.apps.googleusercontent.com',
    iosBundleId: 'com.example.mvvmTemplate',
  );
}
