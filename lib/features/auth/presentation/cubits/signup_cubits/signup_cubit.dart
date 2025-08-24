import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignupLoading());
    var result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );
    result.fold(
      (failure) {
        emit(SignupFailure(failure.message));
      },
      (userEntity) {
        emit(SignupSuccess(userEntity: userEntity));
      },
    );
  }
}
