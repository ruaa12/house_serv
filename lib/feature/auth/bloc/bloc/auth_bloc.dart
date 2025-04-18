import 'package:home_serviece/feature/auth/data/data_source/auth_datasource.dart';
import 'package:home_serviece/feature/auth/data/models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/auth/data/models/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      final token = register!.data!.token;
      if (token != null) {
        emit(RegisterSuccess(token: token));
      } else {
        emit(RegisterFailure(error: "Signup failed please check your"));
      }
    });
    //on<UpdatepasswordButtonPressed>
  }
}
