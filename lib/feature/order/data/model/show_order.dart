class UserOrdersResponse {
  final String status;
  final List<UserOrder> data;
  final Meta meta;

  UserOrdersResponse({
    required this.status,
    required this.data,
    required this.meta,
  });

  factory UserOrdersResponse.fromJson(Map<String, dynamic> json) {
    return UserOrdersResponse(
      status: json['status'],
      data:
          List<UserOrder>.from(json['data'].map((x) => UserOrder.fromJson(x))),
      meta: Meta.fromJson(json['meta']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
        'meta': meta.toJson(),
      };
}

class UserOrder {
  // بناءً على البيانات ناقصة، هون منضيف الحقول الفعلية يلي بترجع بالـ data
  // فرضاً id فقط حالياً
  final int id;

  UserOrder({
    required this.id,
  });

  factory UserOrder.fromJson(Map<String, dynamic> json) {
    return UserOrder(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}

class Meta {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  Meta({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['current_page'],
      lastPage: json['last_page'],
      perPage: json['per_page'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'last_page': lastPage,
        'per_page': perPage,
        'total': total,
      };
}
