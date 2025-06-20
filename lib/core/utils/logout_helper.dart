import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home_serviece/feature/auth/presentation/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> performLogout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token'); // احذف التوكن أو غيره حسب مفتاحك

  Navigator.of(context).pop(); // أغلق الـ dialog

  // اذهب لشاشة تسجيل الدخول (استبدل بـ LoginScreen الخاصة بك)
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => LoginScreen()),
  );
}
