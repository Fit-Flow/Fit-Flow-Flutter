import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../widgets/dialogs/snackbar_dialog.dart';

/// The [AuthenticationViewModel] class handles user authentication and account interactions using Firebase Authentication in a Flutter app.
///
/// This class extends [GetxController] and implements the [GetxService] interface.
/// It provides methods for creating a new user, logging in, updating user information (display name, email, and password).
class AuthenticationViewModel extends GetxController implements GetxService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isLoading = false;

  /// Creates a new user with the provided email, password, first name, and last name.
  ///
  /// If the creation is successful, the user's display name is updated, and the user is redirected to the "/dashboard" route.
  /// If an error occurs during creation, specific error codes are handled, and corresponding error messages are displayed to the user.
  ///
  ///authors: Jackie, Christoffer & Jakob
  Future<void> createUser(String emailAddress, String password,
      String firstName, String lastName) async {
    isLoading = true;
    update();
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) async {
        final user = FirebaseAuth.instance.currentUser;
        await user?.updateDisplayName('$firstName $lastName');
        // Create a new user with a first and last name
        final userdb = <String, dynamic>{
          "first_name": firstName,
          "last_name": lastName,
          "email": emailAddress
        };

// Add a new document with a generated ID
        await db.collection("users").doc(user!.uid).set(userdb).then((value) {
          buildSuccessSnackBar('Buger oprettet', 'Din bruger er oprettet');
          Get.offNamed('/login');
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        buildErrorSnackBar('Fejl', 'Kodeord er ikke stærkt nok');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        buildErrorSnackBar('Fejl', 'Kontoen findes allerede');
      } else {
        buildErrorSnackBar('Fejl', '${e.message}');
      }
    } catch (e) {
      print(e);
      buildErrorSnackBar('Fejl', '${e}');
    }
    isLoading = false;
    update();
  }

  /// Login with the provided email and password.
  ///
  /// If the login is successful, the user is redirected to the "/dashboard" route.
  /// If an error occurs during login, specific error codes are handled, and corresponding error messages are displayed to the user.
  ///
  ///authors: Jackie, Christoffer & Jakob
  Future<void> login(String emailAddress, String password) async {
    isLoading = true;
    update();
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          )
          .then((value) => Get.offNamed('/dashboard'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        buildErrorSnackBar('Fejl', 'Ingen bruger med denne email');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        buildErrorSnackBar('Fejl', 'Forkete kodeord til denne bruger');
      } else {
        buildErrorSnackBar('Fejl', '${e.message}');
      }
    }
    isLoading = false;
    update();
  }

  /// Updates the user's display name with the provided first name and last name.
  ///
  /// If the update is successful, the UI is updated, and a success message is displayed to the user.
  /// If an error occurs, an error message is displayed.
  ///
  ///authors: Jackie, Christoffer & Jakob
  void updateDisplayName(String firstName, String lastName) async {
    try {
      final user = await FirebaseAuth.instance.currentUser!;
      await user.updateDisplayName('$firstName $lastName');
      update();
      buildSuccessSnackBar('Udført', 'Profil opdateret');
    } on FirebaseAuthException catch (e) {
      buildErrorSnackBar('Fejl', e.message);
    }
  }

  /// Updates the user's email with the provided email.
  ///
  /// If the update is successful, the UI is updated, and a success message is displayed to the user.
  /// If an error occurs, an error message is displayed.
  ///
  ///authors: Jackie, Christoffer & Jakob
  void updateEmail(String email) async {
    try {
      final user = await FirebaseAuth.instance.currentUser!;
      await user.updateEmail(email);
      update();
      buildSuccessSnackBar('Udført', 'Email opdateret');
    } on FirebaseAuthException catch (e) {
      buildErrorSnackBar('Fejl', e.message);
    }
  }

  /// Updates the user's password with the provided new password.
  ///
  /// If the update is successful, the UI is updated, and a success message is displayed to the user.
  /// If an error occurs, an error message is displayed.
  ///
  ///authors: Jackie, Christoffer & Jakob
  void updatePassword(String password, String newPassword) async {
    //TODO: skal bruge credentials
    try {
      final user = await FirebaseAuth.instance.currentUser!;
      await user.updatePassword(newPassword);
      update();
      buildSuccessSnackBar('Udført', 'Kodeord opdateret');
    } on FirebaseAuthException catch (e) {
      buildErrorSnackBar('Fejl', e.message);
    }
  }

  /// Retrieves the last name from the given input string.
  ///
  /// If the string contains both a first name and a last name separated by a space, only the last name is returned.
  /// Otherwise, empty string is returned.
  ///
  ///authors: Jackie, Christoffer & Jakob
  String getLastName(String input) {
    List<String> splitString = input.split(' ');
    if (splitString.length > 1) {
      return input.substring(input.indexOf(' ') + 1);
    } else {
      return '';
    }
  }
}
