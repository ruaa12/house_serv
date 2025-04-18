import 'package:home_serviece/feature/auth/data/models/changepass.dart';
import 'package:home_serviece/feature/auth/data/models/login_model.dart';
import 'package:home_serviece/feature/auth/data/models/register_model.dart';
import 'package:home_serviece/feature/auth/data/models/changepass.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthDatasource {
  Future<Login?> login(String email, String password) async {
    final result = await http
        .post(Uri.parse('http://10.0.2.2:8000/api/auth/login'), body: {
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
    final result = await http
        .post(Uri.parse('http://10.0.2.2:8000/api/auth/register'), body: {
      'email': email,
      'password': password,
      'Name': fullname, // التأكد من توافق الاسم مع الموديل الموجود
      'phone': phone,
      'username': username,
    });
    if (result.statusCode == 200) {
      print("Response Body:${result.body}");
      final regstResult = registerFromJson(result.body);
      final token = regstResult?.data?.token;
      print("Token:${token}");
      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        regstResult;
      }
    }
    print("failed:${result.statusCode}");
    return null;
  }
} /*Future<Changepassword?> changepassword(String currentpassword,String newpassword, String token ) async{
    final url = await http
        .post(Uri.parse('http://10.0.2.2:8000/api/auth/change-password'),
        body:{'currentpassword' : currentpassword,
        'newpassword':newpassword,
        'token':token}
        );
  
  if (url.statusCode == 200) {
      final url = changepasswordFromJson(url.);
      final token = url.data?.length;
      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
      }
  }}*/
