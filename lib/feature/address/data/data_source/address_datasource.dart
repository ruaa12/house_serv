import 'dart:convert';
import 'package:home_serviece/core/unified_api/api_variabels.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/address.dart';

class AddressDataSource {
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  final ApiVariabels api = ApiVariabels();

  Future<void> createAddress(AddressData address) async {
    final token = await getToken();
    if (token == null) {
      throw Exception('Token is null');
    }
    final uri = api.getAddres();
    final response = await http.post(
      uri,
      body: jsonEncode(address.toJson()),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('فشل في إنشاء العنوان');
    }
  }
}
