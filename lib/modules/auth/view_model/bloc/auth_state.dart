part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthStateInitial extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateSuccess extends AuthState {}

class AuthStateFailure extends AuthState {
  final Failure failure;

  AuthStateFailure({
    required this.failure,
  });
}
