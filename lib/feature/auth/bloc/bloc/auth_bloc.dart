import 'dart:io';

import 'package:home_serviece/feature/auth/data/data_source/auth_datasource.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/auth/data/models/get_profile.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthDatasource authDatasource;

  AuthBloc({required this.authDatasource}) : super(AuthInitial()) {
    on<LoginButtonPressedEvent>((event, emit) async {
      emit(AuthLoading());
      final loginResult =
          await authDatasource.login(event.email, event.password);
      final token = loginResult?.data?.token;
      if (token != null) {
        emit(AuthLoginSuccess(token: token));
      } else {
        emit(AuthLoginFailure(
            message: "Login failed. Please check your credentials."));
      }
    });

    on<SignupButtonPressedEvent>((event, emit) async {
      emit(AuthLoading());
      final register = await authDatasource.register(event.email,
          event.password, event.phone, event.fullname, event.username);
      final token = register?.data?.token;
      if (token != null) {
        emit(RegisterSuccess(token: token));
      } else {
        emit(RegisterFailure(error: "Signup failed please check your"));
      }
    });
    on<PasswordButtonPressed>((event, emit) async {
      emit(AuthLoading());
      final changepassword = await authDatasource.changepassword(
          event.new_password_confirmation,
          event.current_password,
          event.new_password);
      final token = changepassword?.data?.token;
      if (token != null) {
        emit(PasswordSucces());
      } else {
        emit(PasswordFailure(erro: " failed please check your password"));
      }
    });
    on<UpdateProfileButtonPressed>((event, emit) async {
      emit(AuthLoading());
      final updateprofile = await authDatasource.updateProfile(
          name: event.name,
          phone: event.phone,
          email: event.email,
          username: event.username,
          image: event.image);
      final token = updateprofile.data?.token;
      if (token != null) {
        emit(UpdateProfileSucces());
      } else {
        emit(UpdateProfilefailure(error: " failed please check your profile"));
      }
    });
    on<GetProfile>((event, emit) async {
      emit(AuthLoading());
      try {
        final profileData = await authDatasource.getProfile(event.token);
        if (profileData != null && profileData.data != null) {
          emit(GetProfileSuccess(user: profileData.data!));
        } else {
          emit(GetprofileFailure(message: 'البيانات غير مكتملة'));
        }
      } catch (e) {
        emit(GetprofileFailure(message: e.toString()));
      }
    });
  }
}
