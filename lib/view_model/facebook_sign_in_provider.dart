import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Provides the functionality for signing in with Facebook in a Flutter application.
///
/// The FacebookSignInProvider class is responsible for handling the authentication flow
/// using Facebook as the identity provider. It utilizes the Firebase Authentication SDK
/// and provides a method to sign in with Facebook.
///
///authors: Christoffer & Jakob
class FacebookSignInProvider extends ChangeNotifier {
  /// Signs in the user with Facebook and returns a [UserCredential] once the process is complete.
  ///
  /// This method initiates the Facebook sign-in flow by creating a new [FacebookAuthProvider]
  /// instance and configuring the required scopes and custom parameters. It then calls the
  /// signInWithPopup method from the Firebase Authentication SDK to authenticate the user
  /// with Facebook. Once the sign-in is successful, it notifies the listeners and navigates
  /// to the dashboard screen.
  ///
  /// Returns a [Future] that completes with a [UserCredential] once the sign-in is complete.
  ///
  /// authors: Christoffer & Jakob
  Future signInWithFacebook() async {
    FacebookAuthProvider facebookProvider = FacebookAuthProvider();

    facebookProvider.addScope('email');
    facebookProvider.setCustomParameters({
      'display': 'popup',
    });

    await FirebaseAuth.instance.signInWithPopup(facebookProvider);
    notifyListeners();
    Get.offNamed("/dashboard");
  }
}
