import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Get current user
  Future<User> getCurrentUser() async {
    return _firebaseAuth.currentUser!;
  }

  Future<String?> getUID() async {
    return _firebaseAuth.currentUser!.uid.toString();
  }

  // Sign in with email & password
  // Future signInEmailAndPassword( { required String email, required String password} ) async {
  //   try {
  //     await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     print("ERROR : Sign in Email Password !!!!");
  //     print(e.toString());
  //   }
  // }

  Future<Object?> signInEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return 1;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 2;
      }
    }
    return null;
  }

  // Register with email and password
  Future<Object?> RegisterEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("Signes in successfully !!!");
      return user.user;
    } catch (signUpError) {
      if (signUpError is PlatformException) {
        if (signUpError.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          print("EMAIL already used");
          return 1;
        }
      }

      if (signUpError.toString() ==
          "[firebase_auth/invalid-email] The email address is badly formatted.") {
        return 2;
      }

      debugPrint("SIGNUP ERROR = ${signUpError.toString()}");
      return null;
    }
  }

  // Sign out email & password
  Future<void> signOut() async {
    await _firebaseAuth.signOut();

    // added to see if it works
    // await googleSignIn.disconnect();
  }

  // sign in anonymosly
  Future signInAnon() async {
    try {
      await _firebaseAuth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  // // sign out with google
  // Future<void> signOutGoogle() async{
  //   final googleSignIn = GoogleSignIn();
  //   await googleSignIn.signOut();
  //   await _firebaseAuth.signOut();
  // }

  // final googleSignIn = GoogleSignIn();

  // GoogleSignInAccount? _user;

  // GoogleSignInAccount get user => _user!;

  // Future googleLogin() async{

  //   try {
  //     final googleUser = await googleSignIn.signIn();

  //     if (googleUser == null) return;

  //     _user = googleUser;

  //     final googleAuth = await googleUser.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken:  googleAuth.idToken
  //     );

  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //   } on Exception catch (e) {
  //     print("EXCEPTION GOOGLE SIGN IN ");
  //     print(e);
  //   }

  //   // notifyListeners();

  // }

  // Future googleLogOut() async {

  //   await googleSignIn.disconnect();
  //   _firebaseAuth.signOut();
}
