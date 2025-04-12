import 'package:home_serviece/feature/auth/data/data_source/auth_datasource.dart';
import 'package:home_serviece/feature/auth/data/models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/auth/data/models/register_model.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthDatasource authDatasource;

  AuthBloc({required this.authDatasource}) : super(AuthInitial()) {
    on<LoginButtonPressedEvent>((event, emit) async {
      emit(AuthLoading());
      final loginResult =
          await authDatasource.login(event.email, event.password);
      if (loginResult != null) {
        emit(AuthLoginSuccess(login: loginResult));
      } else {
        emit(AuthLoginFailure(
            message: "Login failed. Please check your credentials."));
      }
    });

    on<SignupButtonPressedEvent>((event, emit) async {
      emit(AuthLoading());
      final register = await authDatasource.register(
        event.email,
        event.password,
        event.phone,
        event.name,
      );

      if (register != null) {
        emit(RegisterSuccess(register: Register()));
      } else {
        emit(RegisterFailure(error: "Signup failed please check your"));
      }
    });
  }
}
