import 'dart:convert';
import 'package:home_serviece/core/unified_api/api_variabels.dart';
import 'package:home_serviece/core/unified_api/failures.dart';
import 'package:home_serviece/feature/order/data/model/show_order.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderDataSource {
  final ApiVariabels apiVariabels;
  OrderDataSource({required this.apiVariabels});

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<UserOrdersResponse> getUserOrders({int page = 1}) async {
    final token = await getToken();
    if (token == null) throw Exception('Token is null');

    try {
      final uri = apiVariabels.getUserorder();
      final response = await http.get(
        uri,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return UserOrdersResponse.fromJson(json);
      } else {
        throw ServerFailure(message: 'Server error ${response.statusCode}');
      }
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  Future<bool> createHouseOrder(
      {required int houseId, required String notes}) async {
    final token = await getToken();
    if (token == null) throw ServerFailure(message: 'No token found');

    final uri = apiVariabels.createHouseOrder(houseId);
    final response = await http.post(
      uri,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'notes': notes,
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['status'] == true) {
        return true;
      } else {
        throw ServerFailure(message: json['message'] ?? 'Request failed');
      }
    } else {
      throw ServerFailure(message: 'Server error ${response.statusCode}');
    }
  }
}
