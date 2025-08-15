import 'dart:convert';

OrderServResponse orderServResponseFromJson(String str) =>
    OrderServResponse.fromJson(json.decode(str));

String orderServResponseToJson(OrderServResponse data) =>
    json.encode(data.toJson());

class OrderServResponse {
  bool status;
  String message;
  List<OrderData> data;

  OrderServResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OrderServResponse.fromJson(Map<String, dynamic> json) =>
      OrderServResponse(
        status: json["status"],
        message: json["message"],
        data: List<OrderData>.from(
            json["data"].map((x) => OrderData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class OrderData {
  int id;
  String notes;
  String status;
  String paymentStatus;
  int userId;
  String name;
  String username;
  String email;
  String phone;
  DateTime serviceDate;
  dynamic imageUrl;
  DateTime createdAt;

  OrderData({
    required this.id,
    required this.notes,
    required this.status,
    required this.paymentStatus,
    required this.userId,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.serviceDate,
    required this.imageUrl,
    required this.createdAt,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json["id"],
        notes: json["notes"],
        status: json["status"],
        paymentStatus: json["payment_status"],
        userId: json["user_id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        serviceDate: DateTime.parse(json["service_date"]),
        imageUrl: json["image_url"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "notes": notes,
        "status": status,
        "payment_status": paymentStatus,
        "user_id": userId,
        "name": name,
        "username": username,
        "email": email,
        "phone": phone,
        "service_date": serviceDate.toIso8601String(),
        "image_url": imageUrl,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}
