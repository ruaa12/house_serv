// To parse this JSON data, do
//
//     final updateprofile = updateprofileFromJson(jsonString);

import 'dart:convert';

Updateprofile updateprofileFromJson(String str) =>
    Updateprofile.fromJson(json.decode(str));

String updateprofileToJson(Updateprofile data) => json.encode(data.toJson());

class Updateprofile {
  final bool? status;
  final String? message;
  final Data? data;

  Updateprofile({
    this.status,
    this.message,
    this.data,
  });

  factory Updateprofile.fromJson(Map<String, dynamic> json) => Updateprofile(
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
  final String? token;
  final dynamic image;
  final dynamic address;

  Data({
    this.id,
    this.userName,
    this.fullName,
    this.phone,
    this.email,
    this.token,
    this.image,
    this.address,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userName: json["user_name"],
        fullName: json["full_name"],
        phone: json["phone"],
        email: json["email"],
        token: json["token"],
        image: json["image"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "full_name": fullName,
        "phone": phone,
        "email": email,
        "token": token,
        "image": image,
        "address": address,
      };
}
