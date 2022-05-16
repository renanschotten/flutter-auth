import 'package:auth/core/failure/failure.dart';
import 'package:auth/modules/auth/model/auth_status.dart';
import 'package:auth/modules/auth/model/user_register_model.dart';
import 'package:auth/modules/auth/repository/firebase/firebase_auth_repository.dart';
import 'package:auth/modules/auth/view_model/bloc/auth_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements FirebaseAuthRepository {}

void main() {
  late MockAuthRepository authRepository;
  late AuthBloc authBloc;
  final UserRegisterModel userRegisterModel = UserRegisterModel(
    email: "email",
    password: "password",
  );

  setUp(() {
    authRepository = MockAuthRepository();
    authBloc = AuthBloc(authRepository: authRepository);
  });

  test("Initial state should be AuthStateInitial", () async {
    expect(authBloc.state, equals(isA<AuthStateInitial>()));
  });

  test("Should emit AuthStateSuccess when successfully creates an user",
      () async {
    when(
      () => authRepository.createUser(userRegisterModel: userRegisterModel),
    ).thenAnswer((invocation) => Future.value(const Right(AuthStatus.success)));
    authBloc.add(CreateUser(userRegisterModel: userRegisterModel));
    expectLater(
      authBloc.stream,
      emitsInOrder(
        [
          isA<AuthStateLoading>(),
          isA<AuthStateSuccess>(),
        ],
      ),
    );
  });

  test("Should emit AuthStateFailure when a failure occurs", () async {
    when(
      () => authRepository.createUser(userRegisterModel: userRegisterModel),
    ).thenAnswer((invocation) => Future.value(Left(Failure())));
    authBloc.add(CreateUser(userRegisterModel: userRegisterModel));
    expectLater(
      authBloc.stream,
      emitsInOrder(
        [
          isA<AuthStateLoading>(),
          isA<AuthStateFailure>(),
        ],
      ),
    );
  });
}
