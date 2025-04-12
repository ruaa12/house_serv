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
  final String name, email, password, phone;
  SignupButtonPressedEvent(
      {required this.email,
      required this.name,
      required this.password,
      required this.phone});
}
