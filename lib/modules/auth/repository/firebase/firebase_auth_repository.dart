import 'package:auth/core/failure/failure.dart';
import 'package:auth/modules/auth/data/firebase/firebase_auth_service.dart';
import 'package:auth/modules/auth/model/auth_status.dart';
import 'package:auth/modules/auth/model/user_register_model.dart';
import 'package:dartz/dartz.dart';

import '../auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({required this.firebaseAuthService});

  final FirebaseAuthService firebaseAuthService;

  @override
  Future<Either<Failure, AuthStatus>> createUser({
    required UserRegisterModel userRegisterModel,
  }) {
    return firebaseAuthService.createUser(userRegisterModel: userRegisterModel);
  }
}
