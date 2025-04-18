// To parse this JSON data, do
//
//     final validate = validateFromJson(jsonString);

import 'dart:convert';

Validate validateFromJson(String str) => Validate.fromJson(json.decode(str));

String validateToJson(Validate data) => json.encode(data.toJson());

class Validate {
  final bool? status;
  final String? message;
  final dynamic data;

  Validate({
    this.status,
    this.message,
    this.data,
  });

  factory Validate.fromJson(Map<String, dynamic> json) => Validate(
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
