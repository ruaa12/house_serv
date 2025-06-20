import 'dart:io';

import 'package:http/http.dart' as http;

import 'handling_exeption_request.dart';
import 'package:home_serviece/core/helper/token_helper.dart'; 


typedef FromJson<T> = T Function(String body);

class GetApi<T> with HandlingExceptionRequest {
  final Uri uri;
  final FromJson fromJson;
  final Map? body;
  final bool getFCMToken;

  GetApi({
    required this.uri,
    required this.fromJson,
    this.body = const {},
    this.getFCMToken = false,
  });

  Future<T> callRequest() async {
    try {
       print("📡 عنوان الطلب هو: $uri");
        final token = await TokenHelper.getToken();
        print("🪪 التوكن المسترجع: $token");

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
         if (token != null) 'Authorization': 'Bearer $token',
      };
      print(uri);
      var request = http.Request('GET', uri);
      
      // request.body = jsonEncode(body);
      request.headers.addAll(headers);
      http.StreamedResponse streamedResponse =
          await request.send().timeout(const Duration(seconds: 20));
      http.Response response = await http.Response.fromStream(streamedResponse);
      print("📬 Status Code: ${response.statusCode}");
      print("📦 Body: ${response.body}");
      if (response.statusCode == 200) {
         print("🧩 قبل فك JSON");
         final parsed = fromJson(response.body);
         print("✅ تم فك JSON بنجاح");
        return parsed;
      } else {
        Exception exception = getException(response: response);

        throw exception;
      }
    } on HttpException {
      rethrow;
    } on FormatException {
      rethrow;
    } on SocketException {
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}