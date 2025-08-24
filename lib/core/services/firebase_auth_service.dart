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
        throw CustomExeptions(message: 'كلمة المرور ضعيفة جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExeptions(
          message: 'لديك حساب بالفعل لهذا البريد الإلكتروني.',
        );
      } else {
        throw CustomExeptions(message: 'لقد حدث خطأ ما. حاول مرة أخرى.');
      }
    } catch (e) {
      throw CustomExeptions(message: 'لقد حدث خطأ ما. حاول مرة أخرى.');
    }
  }
}
