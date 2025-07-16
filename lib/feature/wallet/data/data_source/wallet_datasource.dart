import 'dart:convert';
import 'package:home_serviece/core/unified_api/api_variabels.dart';
import 'package:home_serviece/core/unified_api/failures.dart';
import 'package:home_serviece/feature/wallet/data/modeles/WalletTransaction.dart';
import 'package:home_serviece/feature/wallet/data/modeles/get_balance.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WalletDataSource {
  final ApiVariabels apiVariabels;
  WalletDataSource({required this.apiVariabels});

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<GetBalance> getBalance() async {
    final token = await getToken();
    if (token == null) throw Exception('Token is null');

    try {
      final uri = apiVariabels.getBalance();
      final response = await http.get(
        uri,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return GetBalance.fromJson(json);
      } else {
        throw ServerFailure(message: 'Server error ${response.statusCode}');
      }
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  Future<MakeTransaction> makeTransaction(double amount) async {
    final token = await getToken();
    if (token == null) throw Exception('Token is null');

    try {
      final uri = apiVariabels.makeTransaction(); // تأكد أنها موجودة
      final response = await http.post(
        uri,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'amount': amount}),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return MakeTransaction.fromJson(json);
      } else {
        throw ServerFailure(message: 'Transaction failed');
      }
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }
}
