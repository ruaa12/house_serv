import 'package:home_serviece/feature/auth/data/models/login_model.dart';
import 'package:http/http.dart' as http;

class AuthDatasource {
  Future<Login?> login(String email, String password) async {
    final result =
        await http.post(Uri.parse('http://reqres.in/api/auth/login'), body: {
      'email': email,
      'password': password,
    });
   
    if (result.statusCode == 200) {
      return loginFromJson(result.body); // تحويل JSON إلى الموديل AuthModel
    }
    return null;
  }

  Future<Login?> signup(
      String email, String password, String phone, String fullname) async {
    final result =
        await http.post(Uri.parse('http://reqres.in/api/auth/register'), body: {
      'email': email,
      'password': password,
      'full_name': fullname, // التأكد من توافق الاسم مع الموديل الموجود
      'phone': phone,
    });
    if (result.statusCode == 200) {
      return loginFromJson(result.body); // تحويل JSON إلى الموديل AuthModel
    }
    return null;
  }
}
