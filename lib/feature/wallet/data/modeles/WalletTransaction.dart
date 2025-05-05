// To parse this JSON data, do
//
//     final walletTransaction = walletTransactionFromJson(jsonString);

import 'dart:convert';

WalletTransaction walletTransactionFromJson(String str) =>
    WalletTransaction.fromJson(json.decode(str));

String walletTransactionToJson(WalletTransaction data) =>
    json.encode(data.toJson());

class WalletTransaction {
  final bool? status;
  final String? message;
  final Data? data;

  WalletTransaction({
    this.status,
    this.message,
    this.data,
  });

  factory WalletTransaction.fromJson(Map<String, dynamic> json) =>
      WalletTransaction(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final int? walletId;
  final String? type;
  final String? amount;
  final dynamic reference;
  final String? status;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Data({
    this.walletId,
    this.type,
    this.amount,
    this.reference,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        walletId: json["wallet_id"],
        type: json["type"],
        amount: json["amount"],
        reference: json["reference"],
        status: json["status"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "wallet_id": walletId,
        "type": type,
        "amount": amount,
        "reference": reference,
        "status": status,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
