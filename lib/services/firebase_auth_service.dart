import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("Error: ${e.code}");
      throw e;
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }
  Future<void> signIn(String newEmail, String newPassword) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: newEmail, password: newPassword);
  }

  // Future<void> signUp(String newEmail, String newPassword) async {
  //   await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: newEmail, password: newPassword);
  // }

  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }
}
