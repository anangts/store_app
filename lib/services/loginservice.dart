// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginService {
  LoginService() {
    Firebase.initializeApp();
  }

  Future<bool> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // if (googleSignIn == null) {
    //   return false;
    // }

    //obtain the auth details from request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    //create new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    //once signed in, return the UserCredential
    UserCredential userCreds =
        await FirebaseAuth.instance.signInWithCredential(credential);
    // if (userCreds != null) {
    //   //Todo collect user info here
    // }

    return true;
  }
}
