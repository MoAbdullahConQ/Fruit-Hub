import 'dart:developer';

import 'package:ecommerce_app/core/errors/custom_exeptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      log(
        "Exeption in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} ${e.code}",
      );
      if (e.code == 'weak-password') {
        throw CustomExeptions(message: 'كلمة المرور ضعيفة جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExeptions(
          message: 'لديك حساب بالفعل لهذا البريد الإلكتروني.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomExeptions(message: 'لا يوجد اتصال بالإنترنت.');
      } else {
        throw CustomExeptions(message: 'لقد حدث خطأ ما. حاول مرة أخرى.');
      }
    } catch (e) {
      log(
        "Exeption in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}",
      );
      throw CustomExeptions(message: 'لقد حدث خطأ ما. حاول مرة أخرى.');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exeption in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} ${e.code}",
      );
      if (e.code == 'user-not-found') {
        throw CustomExeptions(
          message: 'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomExeptions(
          message: 'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomExeptions(message: 'لا يوجد اتصال بالإنترنت.');
      } else {
        throw CustomExeptions(message: 'لقد حدث خطأ ما. حاول مرة أخرى.');
      }
    } catch (e) {
      log(
        "Exeption in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}",
      );
      throw CustomExeptions(message: 'لقد حدث خطأ ما. حاول مرة أخرى.');
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn.instance.authenticate();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}
