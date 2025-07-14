import 'dart:convert';
import 'package:home_serviece/core/unified_api/api_variabels.dart';
import 'package:home_serviece/core/unified_api/failures.dart';
import 'package:home_serviece/feature/service/data/model/categories.dart';
import 'package:home_serviece/feature/service/data/model/categories_ser_model.dart';
import 'package:home_serviece/feature/service/data/model/category_prov_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ServiceDataSource {
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  final ApiVariabels apiVariabels;

  ServiceDataSource({required this.apiVariabels});

  Future<CategoryResponse> getCategories() async {
    final token = await getToken();
    if (token == null) {
      throw Exception('Token is null');
    }
    try {
      final uri = apiVariabels.getCategories();
      final response = await http.get(
        uri,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return CategoryResponse.fromJson(json);
      } else {
        throw ServerFailure(message: 'Server Error: ${response.statusCode}');
      }
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  Future<CategoryDetailsResponse> getCategoryDetails(int categoryId) async {
    final token = await getToken();
    if (token == null) {
      throw Exception('Token is null');
    }
    try {
      final uri = apiVariabels.getCategoryById(categoryId);
      final response = await http.get(
        uri,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return CategoryDetailsResponse.fromJson(json);
      } else {
        throw ServerFailure(message: 'Server Error: ${response.statusCode}');
      }
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  Future<ServWithProvResponse> getServiceWithProviders(int serviceId) async {
    final token = await getToken();
    if (token == null) {
      throw Exception('Token is null');
    }

    try {
      final uri = apiVariabels.getServiceById(serviceId);
      final response = await http.get(uri, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        return ServWithProvResponse.fromJson(json);
      } else {
        throw ServerFailure(message: 'Server Error: ${response.statusCode}');
      }
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }
}
