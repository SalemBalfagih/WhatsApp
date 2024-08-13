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
    apiKey: 'AIzaSyDjr5daClhzYPnw52JG8-fsOz0vKr2p7gw',
    appId: '1:549512315692:web:6a59aca3a98a1d8a26e289',
    messagingSenderId: '549512315692',
    projectId: 'whats-app-9ca40',
    authDomain: 'whats-app-9ca40.firebaseapp.com',
    storageBucket: 'whats-app-9ca40.appspot.com',
    measurementId: 'G-BM5L01GQ6X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKV-6m3BrTN1GWl9yDXCYo6lRoIg1lm4M',
    appId: '1:549512315692:android:71a11c1817f2f3aa26e289',
    messagingSenderId: '549512315692',
    projectId: 'whats-app-9ca40',
    storageBucket: 'whats-app-9ca40.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAm7z8lIUGiFXPpEIqa0Z0LM9OUsCAot74',
    appId: '1:549512315692:ios:8142c6168dd9dbe326e289',
    messagingSenderId: '549512315692',
    projectId: 'whats-app-9ca40',
    storageBucket: 'whats-app-9ca40.appspot.com',
    iosBundleId: 'com.example.whatsapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAm7z8lIUGiFXPpEIqa0Z0LM9OUsCAot74',
    appId: '1:549512315692:ios:8142c6168dd9dbe326e289',
    messagingSenderId: '549512315692',
    projectId: 'whats-app-9ca40',
    storageBucket: 'whats-app-9ca40.appspot.com',
    iosBundleId: 'com.example.whatsapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDjr5daClhzYPnw52JG8-fsOz0vKr2p7gw',
    appId: '1:549512315692:web:55bcbe45eddee42426e289',
    messagingSenderId: '549512315692',
    projectId: 'whats-app-9ca40',
    authDomain: 'whats-app-9ca40.firebaseapp.com',
    storageBucket: 'whats-app-9ca40.appspot.com',
    measurementId: 'G-8STDQ1JCJB',
  );
}
