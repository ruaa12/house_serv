import 'dart:convert';
import 'package:home_serviece/core/api_var.dart';
import 'package:home_serviece/feature/address/data/models/address.dart';
import 'package:http/http.dart' as http;

class AddressDataSource {
  Future<AddressData?> createAddress({
    required String city,
    required String region,
    required String street,
    required String building,
  }) async {
    final url = ApiVariabels.createAddressesUri();

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer YOUR_TOKEN', لو بدك تضيف توكن
      },
      body: jsonEncode({
        "city": city,
        "region": region,
        "street": street,
        "building": building,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      return AddressData.fromJson(json['data'] ?? json);
      // اذا الـ API بيرجع { data: { ... } } خليها هيك
      // اذا بيرجع { ... } بدون data, خليه AddressData.fromJson(json)
    } else {
      // ممكن ترجع null أو ترمي استثناء حسب كيف بدك تستخدمها بالـ bloc
      throw Exception('Failed to create address: ${response.body}');
    }
  }
}
