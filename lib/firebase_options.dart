import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
/// author: Firebase
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
    apiKey: 'AIzaSyBlqPPRFt3YD59dNJBu26BN8V2QX83__Fo',
    appId: '1:787472742798:web:c6699c6a4b9b6dfcdbccdf',
    messagingSenderId: '787472742798',
    projectId: 'fit-flow-b17cd',
    authDomain: 'fit-flow-b17cd.firebaseapp.com',
    storageBucket: 'fit-flow-b17cd.appspot.com',
    measurementId: 'G-QNVSLX8JKX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiRzksitDK2Oo80LA3KODdCi1tOFlxV2U',
    appId: '1:787472742798:android:404be933ef8b4883dbccdf',
    messagingSenderId: '787472742798',
    projectId: 'fit-flow-b17cd',
    storageBucket: 'fit-flow-b17cd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRXNspOTzDSxBn4vaOYM8pkz2saI_TTSo',
    appId: '1:787472742798:ios:5494f5b788cc9880dbccdf',
    messagingSenderId: '787472742798',
    projectId: 'fit-flow-b17cd',
    storageBucket: 'fit-flow-b17cd.appspot.com',
    iosClientId:
        '787472742798-hnj1n9b11e0in2t87d8gh8tjmigjmeiu.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitFlowFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRXNspOTzDSxBn4vaOYM8pkz2saI_TTSo',
    appId: '1:787472742798:ios:5494f5b788cc9880dbccdf',
    messagingSenderId: '787472742798',
    projectId: 'fit-flow-b17cd',
    storageBucket: 'fit-flow-b17cd.appspot.com',
    iosClientId:
        '787472742798-hnj1n9b11e0in2t87d8gh8tjmigjmeiu.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitFlowFlutter',
  );
}
