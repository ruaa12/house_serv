import 'dart:io';

import 'package:home_serviece/feature/auth/data/models/changepass.dart';
import 'package:home_serviece/feature/auth/data/models/login_model.dart';
import 'package:home_serviece/feature/auth/data/models/register_model.dart';
import 'package:home_serviece/feature/auth/data/models/upadate_profile_model.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthDatasource {
  Future<Login?> login(String email, String password) async {
    final result = await http.post(
        Uri(
            scheme: 'http',
            host: '10.0.2.2',
            port: 8000,
            path: 'api/auth/login'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'email': email,
          'password': password,
        });

    if (result.statusCode == 200) {
      final loginResult = loginFromJson(result.body);
      final token = loginResult.data?.token;
      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
      }
      // تحويل JSON إلى الموديل AuthModel

      return loginResult;
    }
    return null;
  }

  Future<Register?> register(
    String email,
    String password,
    String phone,
    String fullname,
    String username,
  ) async {
    final result = await http.post(
        Uri(
            scheme: 'http',
            host: '10.0.2.2',
            port: 8000,
            path: 'api/auth/register'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'email': email,
          'password': password,
          'name': fullname, // التأكد من توافق الاسم مع الموديل الموجود
          'phone': phone,
          'username': username,
        });

    if (result.statusCode == 200) {
      final regstResult = registerFromJson(result.body);
      final token = regstResult.data?.token;

      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        return regstResult;
      }
    }

    return null;
  }

  Future<Changepassword?> changepassword(String new_password,
      String current_password, String new_password_confirmation) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is null. User might not be logged in.');
    }

    final result = await http.post(
      Uri(
        scheme: 'http',
        host: '10.0.2.2',
        port: 8000,
        path: 'api/auth/change-password',
      ),
      headers: {
        // 'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'current_password': current_password,
        'new_password': new_password,
        'new_password_confirmation': new_password_confirmation,
      },
    );
    print(token);
    print({
      // 'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(result.statusCode);
    print(result.body);
    print({
      'current_password': current_password,
      'new_password': new_password,
      'new_password_confirmation': new_password_confirmation,
    });
    if (result.statusCode == 200) {
      final password = changepasswordFromJson(result.body);
      return password;
    } else {
      print('Failed to change password: ${result.body}');
    }

    return null;
  }
}
