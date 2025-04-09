part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  String email, password;
  LoginEvent({
    required this.email,
    required this.password,
  });
}

class SignupEvent extends AuthEvent {
  String fullname, email, password, phone;
  SignupEvent(
      {required this.email,
      required this.fullname,
      required this.password,
      required this.phone});
}
