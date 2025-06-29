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

class PasswordSucces extends AuthState {}

class PasswordFailure extends AuthState {
  final String erro;
  PasswordFailure({required this.erro});
}

class UpdateProfileSucces extends AuthState {}

class UpdateProfilefailure extends AuthState {
  final String error;
  UpdateProfilefailure({required this.error});
}

class GetProfileSuccess extends AuthState {
  final UserData user;
  GetProfileSuccess({required this.user});
}

class GetprofileFailure extends AuthState {
  final String message;

  GetprofileFailure({required this.message});
}
