part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final Login login;

  AuthLoginSuccess({required this.login});
}

class AuthLoginFailure extends AuthState {
  final String message;

  AuthLoginFailure({required this.message});
}

class RegisterSuccess extends AuthState {
  final Register register;

  RegisterSuccess({required this.register});
}

class RegisterFailure extends AuthState {
  final String error;
  RegisterFailure({required this.error});
}
