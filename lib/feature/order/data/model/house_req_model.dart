class OrderHouseResponse {
  final bool status;
  final String message;
  final OrderHouseData data;

  OrderHouseResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OrderHouseResponse.fromJson(Map<String, dynamic> json) {
    return OrderHouseResponse(
      status: json['status'],
      message: json['message'],
      data: OrderHouseData.fromJson(json['data']),
    );
  }
}

class OrderHouseData {
  final int id;
  final String notes;
  final String status;
  final String paymentStatus;
  final int userId;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String? imageUrl;
  final House house;
  final String createdAt;

  OrderHouseData({
    required this.id,
    required this.notes,
    required this.status,
    required this.paymentStatus,
    required this.userId,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    this.imageUrl,
    required this.house,
    required this.createdAt,
  });

  factory OrderHouseData.fromJson(Map<String, dynamic> json) {
    return OrderHouseData(
      id: json['id'],
      notes: json['notes'],
      status: json['status'],
      paymentStatus: json['payment_status'],
      userId: json['user_id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      imageUrl: json['image_url'],
      house: House.fromJson(json['house']),
      createdAt: json['created_at'],
    );
  }
}

class House {
  final int id;
  final String title;
  final String description;
  final String price;
  final String status;
  final List<String> images;
  final Owner owner;

  House({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.status,
    required this.images,
    required this.owner,
  });

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      status: json['status'],
      images: List<String>.from(json['images']),
      owner: Owner.fromJson(json['owner']),
    );
  }
}

class Owner {
  final int id;
  final String name;
  final String email;
  final String imageUrl;
  final String phone;

  Owner({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.phone,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      imageUrl: json['image_url'] ?? '',
      phone: json['phone'],
    );
  }
}
