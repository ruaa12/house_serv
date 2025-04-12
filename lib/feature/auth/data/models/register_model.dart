// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  final bool? status;
  final String? message;
  final Data? data;

  Register({
    this.status,
    this.message,
    this.data,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
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
  final int? id;
  final String? userName;
  final String? fullName;
  final String? phone;
  final String? email;

  Data({
    this.id,
    this.userName,
    this.fullName,
    this.phone,
    this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userName: json["user_name"],
        fullName: json["full_name"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "full_name": fullName,
        "phone": phone,
        "email": email,
      };
}
