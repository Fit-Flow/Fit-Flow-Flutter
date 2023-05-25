import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///authors: Jackie, Christoffer & Jakob

class FacebookSignInProvider extends ChangeNotifier {
  Future signInWithFacebook() async {
    // Create a new provider
    FacebookAuthProvider facebookProvider = FacebookAuthProvider();

    facebookProvider.addScope('email');
    facebookProvider.setCustomParameters({
      'display': 'popup',
    });

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithPopup(facebookProvider);

    notifyListeners();

    Get.offNamed("/dashboard");

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(facebookProvider);
  }
}
