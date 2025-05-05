import 'dart:convert';
import 'package:home_serviece/feature/wallet/data/modeles/WalletTransaction.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class WalletDataSource {
  // ignore: non_constant_identifier_names
  Future<WalletTransaction?> makeTransaction(String type, String amount) async {
    final res = await http.post(
        Uri(
            scheme: 'http',
            host: '10.0.2.2',
            port: 8000,
            path: 'api/wallet-transaction'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'amount': amount,
          'type': type,
        });
    if (res.statusCode == 200) {
      final make = walletTransactionFromJson(res.body);
    } else {
      print('Failed to make transaction : ${res.body}');
    }
    return null;
  }
}
