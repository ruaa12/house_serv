// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  final bool? status;
  final String? message;
  final Data? data;

  Login({
    this.status,
    this.message,
    this.data,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
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
  final String? userName;
  final String? fullName;
  final String? phone;
  final String? email;

  Data({
    this.userName,
    this.fullName,
    this.phone,
    this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userName: json["user_name"],
        fullName: json["full_name"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "full_name": fullName,
        "phone": phone,
        "email": email,
      };
}
