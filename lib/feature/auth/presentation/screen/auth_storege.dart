import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/auth/bloc/bloc/auth_bloc.dart';
import 'package:home_serviece/feature/auth/data/data_source/auth_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthStorege extends Bloc<AuthEvent, AuthState> {
  late final AuthDatasource authDatasource;

  AuthStorege(super.initialState);
// دالة لتخزين التوكن
  Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token); // حفظ التوكن
  }

// دالة لاسترجاع التوكن
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token'); // استرجاع التوكن
  }
}
