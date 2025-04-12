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
  String name, email, password, phone, username;
  SignupButtonPressedEvent(
      {required this.email,
      required this.username,
      required this.name,
      required this.password,
      required this.phone});
}
