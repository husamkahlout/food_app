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
    apiKey: 'AIzaSyDMXoHjIl7lZpEy0apo6PAiZ-dsDor0FgA',
    appId: '1:382083646227:web:0e8951761ebd97ec2450e6',
    messagingSenderId: '382083646227',
    projectId: 'food-app-51341',
    authDomain: 'food-app-51341.firebaseapp.com',
    storageBucket: 'food-app-51341.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBI-sydjMeZSkHc8Ejwcn8t6PviVN5rS-8',
    appId: '1:382083646227:android:10578b4a871f88c52450e6',
    messagingSenderId: '382083646227',
    projectId: 'food-app-51341',
    storageBucket: 'food-app-51341.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDG_YkeYSrFG6wBMJQeNX7lUULCyJuoJ-c',
    appId: '1:382083646227:ios:1a1781587a5e01f62450e6',
    messagingSenderId: '382083646227',
    projectId: 'food-app-51341',
    storageBucket: 'food-app-51341.appspot.com',
    iosClientId: '382083646227-3l3arqmbepqoamn1kqq9ktik5lgjq418.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodApi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDG_YkeYSrFG6wBMJQeNX7lUULCyJuoJ-c',
    appId: '1:382083646227:ios:1a1781587a5e01f62450e6',
    messagingSenderId: '382083646227',
    projectId: 'food-app-51341',
    storageBucket: 'food-app-51341.appspot.com',
    iosClientId: '382083646227-3l3arqmbepqoamn1kqq9ktik5lgjq418.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodApi',
  );
}
