part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final String token;

  AuthLoginSuccess({required this.token});
}

class AuthLoginFailure extends AuthState {
  final String message;

  AuthLoginFailure({required this.message});
}

class RegisterSuccess extends AuthState {
  final String token;

  RegisterSuccess({required this.token});
}

class RegisterFailure extends AuthState {
  final String error;
  RegisterFailure({required this.error});
}

class PasswordSucces extends AuthState {
  final String token;
  PasswordSucces({required this.token});
}

class PasswordFailure extends AuthState {
  final String erro;
  PasswordFailure({required this.erro});
}
