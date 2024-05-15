import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  // Future<UserCredential?> loginWithFacebook() async {
  //   try {
  //     final result = await FacebookAuth.instance.login();
  //     if (result != null) {
  //       final credential =
  //           FacebookAuthProvider.credential(result.accessToken!.token);
  //       return await _auth.signInWithCredential(credential);
  //     } else {
  //       print("Facebook login failed: Result is null");
  //       return null;
  //     }
  //   } catch (e) {
  //     print("Error during Facebook login: $e");
  //     return null;
  //   }
  // }

// Google Authentication
  // Future<UserCredential?> loginwithGoogle() async {
  //   try {
  //     final googleUser = await GoogleSignIn().signIn();
  //     final googleAuth = await googleUser?.authentication;
  //     final cred = GoogleAuthProvider.credential(
  //         idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
  //     return await _auth.signInWithCredential(cred);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<User?> createUserwithEmaiAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      exceptionHandler(e.code);
    } catch (e) {
      print("Something went wrong");
    }
    return null;
  }

  Future<User?> loginUserwithEmaiAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      exceptionHandler(e.code);
    } catch (e) {
      print("Something went wrong");
    }
    return null;
  }

  Future<void> Signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Something went wrong");
    }
    return null;
  }
}

exceptionHandler(String code) {
  switch (code) {
    case "invalid-credential":
      print("Your login credential are invalid");
    case "weak-password":
      print("Your password at least 8 character");
    case "email-already-inuse":
      print("User Already exist");
    default:
      print("Something went wrong");
  }
}
