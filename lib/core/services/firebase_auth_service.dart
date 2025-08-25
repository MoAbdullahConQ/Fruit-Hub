import 'dart:developer';

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
      log(
        "Exeption in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} ${e.code}",
      );
      if (e.code == 'weak-password') {
        throw CustomExeptions(message: 'كلمة المرور ضعيفة جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExeptions(
          message: 'لديك حساب بالفعل لهذا البريد الإلكتروني.',
        );
      }else if(e.code == 'network-request-failed'){
        throw CustomExeptions(message: 'لا يوجد اتصال بالإنترنت.');
      } 
      else {
        throw CustomExeptions(message: 'لقد حدث خطأ ما. حاول مرة أخرى.');
      }
    } catch (e) {
      log(
        "Exeption in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}",
      );
      throw CustomExeptions(message: 'لقد حدث خطأ ما. حاول مرة أخرى.');
    }
  }
}
