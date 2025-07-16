class GetBalance {
  final bool? status;
  final String? message;
  final GetBalanceData? data;

  GetBalance({
    this.status,
    this.message,
    this.data,
  });

  factory GetBalance.fromJson(Map<String, dynamic> json) {
    return GetBalance(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? GetBalanceData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class GetBalanceData {
  final int? id;
  final int? userId;
  final String? balance;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GetBalanceData({
    this.id,
    this.userId,
    this.balance,
    this.createdAt,
    this.updatedAt,
  });

  factory GetBalanceData.fromJson(Map<String, dynamic> json) {
    return GetBalanceData(
      id: json['id'],
      userId: json['user_id'],
      balance: json['balance'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'balance': balance,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
