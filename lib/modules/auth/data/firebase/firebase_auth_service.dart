import 'package:auth/core/failure/failure.dart';
import 'package:auth/modules/auth/model/auth_status.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:auth/modules/auth/data/auth_service.dart';
import 'package:auth/modules/auth/model/user_register_model.dart';

class FirebaseAuthService implements AuthService {
  FirebaseAuthService({required this.firebaseAuthInstance});

  FirebaseAuth firebaseAuthInstance;

  @override
  Future<Either<Failure, AuthStatus>> createUser({
    required UserRegisterModel userRegisterModel,
  }) async {
    try {
      await firebaseAuthInstance.createUserWithEmailAndPassword(
        email: userRegisterModel.email,
        password: userRegisterModel.password,
      );
      return const Right(AuthStatus.success);
    } on FirebaseAuthException catch (e) {
      return Left(
        Failure(
          errorMessage: e.code,
        ),
      );
    }
  }
}

      // switch (e.code) {
      //   case "email-already-in-use":
      //     return AuthStatus.emailInUse;
      //   case "invalid-email":
      //     return AuthStatus.invalidEmail;
      //   case "operation-not-allowed":
      //     return AuthStatus.operationNotAllowed;
      //   case "weak-password":
      //     return AuthStatus.weakPassword;
      //   default:
      //     return AuthStatus.error;
      // }