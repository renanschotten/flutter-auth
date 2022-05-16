import 'package:auth/core/failure/failure.dart';
import 'package:auth/modules/auth/model/user_register_model.dart';
import 'package:auth/modules/auth/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthStateInitial()) {
    on<CreateUser>(
      (event, emit) async {
        emit(AuthStateLoading());
        final response = await authRepository.createUser(
          userRegisterModel: event.userRegisterModel,
        );
        response.fold(
          (l) => emit(AuthStateFailure(failure: l)),
          (r) => emit(AuthStateSuccess()),
        );
      },
    );
  }
}
