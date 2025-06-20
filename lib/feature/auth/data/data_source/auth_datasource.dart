import 'dart:convert';
import 'dart:io';
import 'package:home_serviece/feature/auth/data/models/changepass.dart';
import 'package:home_serviece/feature/auth/data/models/get_profile.dart';
import 'package:home_serviece/feature/auth/data/models/login_model.dart';
import 'package:home_serviece/feature/auth/data/models/register_model.dart';
import 'package:home_serviece/feature/auth/data/models/upadate_profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthDatasource {
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<Login?> login(String email, String password) async {
    final result = await http.post(
      Uri(
        scheme: 'http',
        host: '10.0.2.2',
        port: 8000,
        path: 'api/auth/login',
      ),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'email': email,
        'password': password,
      },
    );

    if (result.statusCode == 200) {
      final loginResult = loginFromJson(result.body);
      final token = loginResult.data?.token;
      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
      }
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
        path: 'api/auth/register',
      ),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'email': email,
        'password': password,
        'name': fullname,
        'phone': phone,
        'username': username,
      },
    );

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

  Future<Changepassword?> changepassword(
    String new_password,
    String current_password,
    String new_password_confirmation,
  ) async {
    final token = await getToken();
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
        'Authorization': 'Bearer $token',
      },
      body: {
        'current_password': current_password,
        'new_password': new_password,
        'new_password_confirmation': new_password_confirmation,
      },
    );

    if (result.statusCode == 200) {
      final password = changepasswordFromJson(result.body);
      return password;
    } else {
      print('Failed to change password: ${result.body}');
    }
    return null;
  }

  Future<UpdateProfile> updateProfile({
    required String name,
    required String phone,
    required String email,
    required String username,
    File? image,
  }) async {
    final token = await getToken();
    if (token == null) {
      throw Exception('Token is null');
    }

    var request = http.MultipartRequest(
      'POST',
      Uri(
        scheme: 'http',
        host: '10.0.2.2',
        port: 8000,
        path: 'api/auth/update-profile',
      ),
    );

    request.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    request.fields.addAll({
      'name': name,
      'phone': phone,
      'email': email,
      'username': username,
    });

    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return UpdateProfile.fromJson(decoded);
    } else {
      throw Exception('فشل في تحديث الملف الشخصي: ${response.body}');
    }
  }

  Future<UserProfileResponse?> getProfile(String token) async {
    final token = await getToken();
    if (token == null) {
      throw Exception('Token is null');
    }

    final response = await http.get(
      Uri(
        scheme: 'http',
        host: '10.0.2.2',
        port: 8000,
        path: 'api/profile',
      ),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final profileResponse = userProfileResponseFromJson(response.body);
      return profileResponse;
    } else {
      print("status code :${response.statusCode}");
      print("response body :${response.body}");
      throw Exception(
          'فشل في جلب بيانات المستخدم - الكود: ${response.statusCode}');
    }
  }
}
