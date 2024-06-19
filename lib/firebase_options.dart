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
    apiKey: 'AIzaSyCvqU8edtxZcfuuhy9oXNBeHeqqVSBx4yM',
    appId: '1:675364019815:web:53088a5ad367a41476bec2',
    messagingSenderId: '675364019815',
    projectId: 'iotproject-420723',
    authDomain: 'iotproject-420723.firebaseapp.com',
    storageBucket: 'iotproject-420723.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfI7FpT70gKwEptj0sh725thBm__eKmVc',
    appId: '1:675364019815:android:4921f580301a998076bec2',
    messagingSenderId: '675364019815',
    projectId: 'iotproject-420723',
    storageBucket: 'iotproject-420723.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUb_yylcxsGpbenpWqf91ophudDFaqHtA',
    appId: '1:675364019815:ios:52cbb69c228a601276bec2',
    messagingSenderId: '675364019815',
    projectId: 'iotproject-420723',
    storageBucket: 'iotproject-420723.appspot.com',
    androidClientId: '675364019815-tr9upeeaqiqn1eig69ja4ii4e3kmd0ta.apps.googleusercontent.com',
    iosClientId: '675364019815-jh6rhop2nptekpgm0i7gke9u5aojja9f.apps.googleusercontent.com',
    iosBundleId: 'com.mpasut.iot.iotApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUb_yylcxsGpbenpWqf91ophudDFaqHtA',
    appId: '1:675364019815:ios:52cbb69c228a601276bec2',
    messagingSenderId: '675364019815',
    projectId: 'iotproject-420723',
    storageBucket: 'iotproject-420723.appspot.com',
    androidClientId: '675364019815-tr9upeeaqiqn1eig69ja4ii4e3kmd0ta.apps.googleusercontent.com',
    iosClientId: '675364019815-jh6rhop2nptekpgm0i7gke9u5aojja9f.apps.googleusercontent.com',
    iosBundleId: 'com.mpasut.iot.iotApp',
  );
}