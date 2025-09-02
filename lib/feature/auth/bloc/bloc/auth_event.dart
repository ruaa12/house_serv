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

class JoinRequestEvent extends AuthEvent {
  final String service, address, name;
  final File cv;

  JoinRequestEvent(this.cv, {required this.service, required this.address, required this.name});
}

class PasswordButtonPressed extends AuthEvent {
  final String current_password, new_password, new_password_confirmation;
  PasswordButtonPressed(
      {required this.current_password,
      required this.new_password,
      required this.new_password_confirmation});
}

class UpdateProfileButtonPressed extends AuthEvent {
  final String name, phone, username, email;
  File? image;
  UpdateProfileButtonPressed(
      {required this.email,
      required this.name,
      this.image,
      required this.phone,
      required this.username});
}

class GetProfile extends AuthEvent {
  final String token;
  GetProfile({required this.token});
}
