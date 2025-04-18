// To parse this JSON data, do
//
//     final changepassword = changepasswordFromJson(jsonString);

import 'dart:convert';

Changepassword changepasswordFromJson(String str) =>
    Changepassword.fromJson(json.decode(str));

String changepasswordToJson(Changepassword data) => json.encode(data.toJson());

class Changepassword {
  final bool? status;
  final String? message;
  final String? data;

  Changepassword({
    this.status,
    this.message,
    this.data,
  });

  factory Changepassword.fromJson(Map<String, dynamic> json) => Changepassword(
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
