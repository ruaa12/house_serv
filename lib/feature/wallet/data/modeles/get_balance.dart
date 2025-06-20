// To parse this JSON data, do
//
//     final getBalance = getBalanceFromJson(jsonString);

import 'dart:convert';

GetBalance getBalanceFromJson(String str) =>
    GetBalance.fromJson(json.decode(str));

String getBalanceToJson(GetBalance data) => json.encode(data.toJson());

class GetBalance {
  final bool? status;
  final String? message;
  final dynamic data;

  GetBalance({
    this.status,
    this.message,
    this.data,
  });

  factory GetBalance.fromJson(Map<String, dynamic> json) => GetBalance(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
