import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/custom_exeptions.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/services/database_service.dart';
import 'package:ecommerce_app/core/services/firebase_auth_service.dart';
import 'package:ecommerce_app/core/utils/backend_endpoints.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(uId: user.uid, name: name, email: email);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomExeptions catch (e) {
      if (user != null) {
        await user.delete();
      }
      return Left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await user.delete();
      }
      log(
        "Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}",
      );
      return Left(ServerFailure('لقد حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomExeptions catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log(
        "Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}",
      );
      return Left(ServerFailure('لقد حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}");
      return Left(ServerFailure('لقد حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}");
      return Left(ServerFailure('لقد حدث خطأ ما، يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoints.addUserData,
      data: user.toMap(),
    );
  }
}
