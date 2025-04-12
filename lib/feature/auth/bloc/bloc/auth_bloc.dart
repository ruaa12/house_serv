import 'package:home_serviece/feature/auth/data/data_source/auth_datasource.dart';
import 'package:home_serviece/feature/auth/data/models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

/*class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(
      (event, emit) async {
        emit(AuthLoading());
        final result =
            await AuthDatasource().login(event.email, event.password);
        if (result != null) {
          emit(AuthSuccess(auth: result));
        } else {
          emit(AuthFailure());
        }
      },
    );
    on<SignupEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await AuthDatasource()
          .signup(event.email, event.fullname, event.password, event.phone);
      if (result != null) {
        emit(AuthSuccess(auth: result));
      } else {
        emit(AuthFailure());
      }
    });
  }
}*/

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthDatasource authDatasource;

  AuthBloc({required this.authDatasource}) : super(AuthInitial()) {
    // إضافة الحدث LoginButtonPressed
    on<LoginButtonPressedEvent>((event, emit) async {
      emit(AuthLoading());
      final loginResult =
          await authDatasource.login(event.email, event.password);
      if (loginResult != null) {
        emit(AuthLoginSuccess(login: loginResult));
      } else {
        emit(AuthFailure(
            message: "Login failed. Please check your credentials."));
      }
    });

    // يمكنك الاحتفاظ بالأحداث الأخرى هنا كما هي إذا كنت ترغب بذلك
  }
}
