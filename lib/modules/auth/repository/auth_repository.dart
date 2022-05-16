import 'package:auth/core/failure/failure.dart';
import 'package:auth/modules/auth/model/auth_status.dart';
import 'package:auth/modules/auth/model/user_register_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthStatus>> createUser({
    required UserRegisterModel userRegisterModel,
  });
}
