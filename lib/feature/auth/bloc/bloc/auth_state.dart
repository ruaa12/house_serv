part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final Login login;

  AuthLoginSuccess({required this.login});
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});
}
