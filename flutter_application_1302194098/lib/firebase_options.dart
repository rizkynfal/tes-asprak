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
    apiKey: 'AIzaSyCHA1FsO4rqxzC3bk0hdIaKi8lVw_TRToI',
    appId: '1:372429840213:web:0f4e03900b5660bdadd9dc',
    messagingSenderId: '372429840213',
    projectId: 'tes-asprak-4ab87',
    authDomain: 'tes-asprak-4ab87.firebaseapp.com',
    databaseURL: 'https://tes-asprak-4ab87-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'tes-asprak-4ab87.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAunhb0wWc8zOZZhs-MARCDU46VEFi3Ze8',
    appId: '1:372429840213:android:fa076d013c713d21add9dc',
    messagingSenderId: '372429840213',
    projectId: 'tes-asprak-4ab87',
    databaseURL: 'https://tes-asprak-4ab87-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'tes-asprak-4ab87.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAXyOnsW_HVK2zYzn2vaw0OTbdJod3mTSA',
    appId: '1:372429840213:ios:0695040c82765eb4add9dc',
    messagingSenderId: '372429840213',
    projectId: 'tes-asprak-4ab87',
    databaseURL: 'https://tes-asprak-4ab87-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'tes-asprak-4ab87.appspot.com',
    iosClientId: '372429840213-oa24svle0l7erj6g6fg8e74a5er1f2le.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1302194098',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAXyOnsW_HVK2zYzn2vaw0OTbdJod3mTSA',
    appId: '1:372429840213:ios:0695040c82765eb4add9dc',
    messagingSenderId: '372429840213',
    projectId: 'tes-asprak-4ab87',
    databaseURL: 'https://tes-asprak-4ab87-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'tes-asprak-4ab87.appspot.com',
    iosClientId: '372429840213-oa24svle0l7erj6g6fg8e74a5er1f2le.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1302194098',
  );
}
