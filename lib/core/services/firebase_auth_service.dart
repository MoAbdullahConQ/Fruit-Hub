import 'package:ecommerce_app/core/errors/custom_exeptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomExeptions(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExeptions(
          message: 'The account already exists for that email.',
        );
      } else {
        throw CustomExeptions(message: 'An error occurred.Please try again.');
      }
    } catch (e) {
      throw CustomExeptions(message: 'An error occurred.Please try again.');
    }
  }
}
