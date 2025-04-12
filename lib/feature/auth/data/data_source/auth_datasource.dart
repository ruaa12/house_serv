import 'package:home_serviece/feature/auth/data/models/login_model.dart';
import 'package:http/http.dart' as http;

class AuthDatasource {
  Future<Login?> login(String email, String password) async {
    final result = await http
        .post(Uri.parse('http://localhost:8000/api/auth/login'), body: {
      'email': email,
      'password': password,
    });

    if (result.statusCode == 200) {
      return loginFromJson(result.body); // تحويل JSON إلى الموديل AuthModel
    }
    return null;
  }

  Future<Login?> register(
    String email,
    String password,
    String phone,
    String name,
  ) async {
    final result = await http
        .post(Uri.parse('http://localhost:8000/api/auth/register'), body: {
      'email': email,
      'password': password,
      'Name': name, // التأكد من توافق الاسم مع الموديل الموجود
      'phone': phone,
    });
    if (result.statusCode == 200) {
      return loginFromJson(result.body); // تحويل JSON إلى الموديل AuthModel
    }
    return null;
  }
}
