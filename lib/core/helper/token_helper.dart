import 'package:shared_preferences/shared_preferences.dart';

class TokenHelper {
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token'); // غيري الاسم إذا لقيتيه مختلف
  }
}
