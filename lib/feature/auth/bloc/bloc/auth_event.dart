part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginButtonPressedEvent extends AuthEvent {
  String email, password;
  LoginButtonPressedEvent({
    required this.email,
    required this.password,
  });
}

class SignupButtonPressedEvent extends AuthEvent {
  final String fullname, email, password, phone, username;
  SignupButtonPressedEvent({
    required this.fullname,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
  });
}

class PasswordButtonPressed extends AuthEvent {
  final String current_password, new_password, new_password_confirmation;
  PasswordButtonPressed(
      {required this.current_password,
      required this.new_password,
      required this.new_password_confirmation});
}
