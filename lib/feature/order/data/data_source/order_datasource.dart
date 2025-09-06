import 'dart:convert';
import 'dart:io';
import 'package:home_serviece/core/unified_api/api_variabels.dart';
import 'package:home_serviece/core/unified_api/failures.dart';
import 'package:home_serviece/feature/order/data/model/show_order.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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

  /*Future<Register?> joinRequest({
    required String service,
    String? address,
    String? name,
    required File cv,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: 'home.mustafafares.com',
      path: 'api/auth/register',
    );

    // Create multipart request
    var request = http.MultipartRequest('POST', uri);
    request.headers['Accept'] = 'application/json';

    // Add text fields
    if (name != null) request.fields['full_name'] = name;
    if (address != null) request.fields['address'] = address;
    request.fields['field'] = service;

    // Attach the file
    request.files.add(await http.MultipartFile.fromPath('cv', cv.path));

    // Send request
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final regstResult = registerFromJson(response.body);
      return regstResult;
    }
    return null;
  }*/

  Future<bool> createHouseOrder({required int houseId, required File image}) async {
    final token = await getToken();
    if (token == null) throw ServerFailure(message: 'No token found');

    final uri = apiVariabels.createHouseOrder(houseId);

    var request = http.MultipartRequest('POST', uri);

    request.headers['Accept'] = 'application/json';
    print('Bearer ${await getToken()}');
    request.headers['Authorization'] = 'Bearer ${await getToken()}';

    // Attach the file
    request.files.add(await http.MultipartFile.fromPath('buyer_signature', image.path));

    // Send request
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    print(response.body);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      launchUrl(Uri.parse('${json['file_url']}'));
      return true;
    } else {
      throw ServerFailure(message: 'Server error ${response.statusCode}');
    }
  }

  Future<bool> createServOrder({
    required int serviceId,
    required String notes,
    required File image, // "YYYY-MM-DD HH:mm:ss"
  }) async {
    final token = await getToken();
    if (token == null) throw ServerFailure(message: 'No token found');

    final uri = apiVariabels.createServOrder(serviceId);

    var request = http.MultipartRequest('POST', uri);

    request.headers['Accept'] = 'application/json';
    print('Bearer ${await getToken()}');
    request.headers['Authorization'] = 'Bearer ${await getToken()}';

    // Attach the file
    request.files.add(await http.MultipartFile.fromPath('buyer_signature', image.path));

    // Send request
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    print(response.body);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      launchUrl(Uri.parse('${json['file_url']}'));
      return true;
    } else {
      throw ServerFailure(message: 'Server error ${response.statusCode}');
    }
  }
}
