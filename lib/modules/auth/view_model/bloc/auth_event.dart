part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CreateUser extends AuthEvent {
  final UserRegisterModel userRegisterModel;
  CreateUser({
    required this.userRegisterModel,
  });
}
