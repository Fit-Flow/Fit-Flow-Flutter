import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Represents a provider for Google sign-in functionality.
///
/// This provider allows users to sign in with their Google accounts. It
/// uses the [googleLogin] method to initiate the Google sign-in process,
/// which displays a pop-up window for authentication. Once the user is
/// successfully signed in, the [notifyListeners] method is called to
/// notify any listeners that the sign-in state has changed. The user is
/// then redirected to the dashboard screen.
///
/// Authors: Christoffer & Jakob
class GoogleSignInProvider extends ChangeNotifier {
  /// Initiates the Google sign-in process.
  ///
  /// This method performs the Google sign-in using the [GoogleAuthProvider]
  /// and [FirebaseAuth] classes. It adds the necessary scope and custom parameters
  /// to the [GoogleAuthProvider], such as requesting access to the user's contacts
  /// and providing a login hint with the user's email address. After signing in,
  /// the [notifyListeners] method is called to notify listeners of the sign-in state
  /// change. Finally, the user is redirected to the dashboard screen.
  Future googleLogin() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    await FirebaseAuth.instance.signInWithPopup(googleProvider);
    notifyListeners();
    Get.offNamed("/dashboard");
  }
}
