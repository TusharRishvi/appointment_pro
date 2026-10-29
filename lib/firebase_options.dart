import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCWH2OVVxz0YkiIQHcSbR6gmfwrqvwStkk',
    appId: '1:467244338347:web:305c63a89cc26ca74a7bee',
    messagingSenderId: '467244338347',
    projectId: 'appointmentpro-34ee7',
    authDomain: 'appointmentpro-34ee7.firebaseapp.com',
    storageBucket: 'appointmentpro-34ee7.firebasestorage.app',
    measurementId: 'G-MNJQLEB65W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCY3DAdfGUKNpAG_0o_ex_MagRTobybWsI',
    appId: '1:467244338347:android:eb978b62597f1d2a4a7bee',
    messagingSenderId: '467244338347',
    projectId: 'appointmentpro-34ee7',
    storageBucket: 'appointmentpro-34ee7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzcCgUwefGjubZHw2wOq57hirV6Js6e04',
    appId: '1:467244338347:ios:92df8b6aa3a0052d4a7bee',
    messagingSenderId: '467244338347',
    projectId: 'appointmentpro-34ee7',
    storageBucket: 'appointmentpro-34ee7.firebasestorage.app',
    iosBundleId: 'com.example.appointmentPro',
  );
}
