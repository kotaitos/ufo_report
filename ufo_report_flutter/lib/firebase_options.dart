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
    apiKey: 'AIzaSyALO8cQlvU6GNTeGdZ1BVFPHjjsHMlYyI0',
    appId: '1:878217751119:web:4acfe9d3161c78a505183a',
    messagingSenderId: '878217751119',
    projectId: 'ufo-report-359817',
    authDomain: 'ufo-report-359817.firebaseapp.com',
    storageBucket: 'ufo-report-359817.appspot.com',
    measurementId: 'G-JH1PBM61EL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZTe7xCcu1_sk079GMDOS1JeiKAH7Ve5Y',
    appId: '1:878217751119:android:cc925c9b979189ee05183a',
    messagingSenderId: '878217751119',
    projectId: 'ufo-report-359817',
    storageBucket: 'ufo-report-359817.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBapQm-XmzQzCBW1AutiOcFJ92Nn_DclRk',
    appId: '1:878217751119:ios:f07913f62966605505183a',
    messagingSenderId: '878217751119',
    projectId: 'ufo-report-359817',
    storageBucket: 'ufo-report-359817.appspot.com',
    iosClientId: '878217751119-7vjjhljee061npa70ha54jjamggr6efp.apps.googleusercontent.com',
    iosBundleId: 'com.example.ufoSiting',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBapQm-XmzQzCBW1AutiOcFJ92Nn_DclRk',
    appId: '1:878217751119:ios:f07913f62966605505183a',
    messagingSenderId: '878217751119',
    projectId: 'ufo-report-359817',
    storageBucket: 'ufo-report-359817.appspot.com',
    iosClientId: '878217751119-7vjjhljee061npa70ha54jjamggr6efp.apps.googleusercontent.com',
    iosBundleId: 'com.example.ufoSiting',
  );
}