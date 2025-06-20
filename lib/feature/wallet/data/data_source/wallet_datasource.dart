import 'dart:convert';
import 'package:home_serviece/feature/auth/bloc/bloc/auth_bloc.dart';
import 'package:home_serviece/feature/auth/data/data_source/auth_datasource.dart';
import 'package:home_serviece/feature/wallet/data/modeles/WalletTransaction.dart';
import 'package:home_serviece/feature/wallet/data/modeles/get_balance.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class WalletDataSource {
  // ignore: non_constant_identifier_names
  Future<WalletTransaction?> makeTransaction(String type, String amount) async {
    final token = await AuthDatasource().getToken;
    final result = await http.post(
        Uri(
            scheme: 'http',
            host: '10.0.2.2',
            port: 8000,
            path: 'api/wallet-transaction'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        body: {
          'amount': amount,
          'type': type,
        });
    if (result.statusCode == 200) {
      final make = walletTransactionFromJson(result.body);
      return make;
    } else {
      print('Failed to make transaction : ${result.body}');
    }
    return null;
  }

  Future<GetBalance?> getBalance() async {
    try {
      final token = await AuthDatasource().getToken; // جلب التوكن من التخزين
      final result = await http.get(
        Uri(
          scheme: 'http',
          host: '10.0.2.2',
          port: 8000,
          path: 'api/get-balance',
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (result.statusCode == 200) {
        final balance = getBalanceFromJson(result.body);
        return balance;
      } else {
        print('فشل في جلب الرصيد: ${result.body}');
      }
    } catch (e) {
      print('حدث خطأ أثناء جلب الرصيد: $e');
    }

    return null;
  }
}
