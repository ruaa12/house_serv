class MakeTransaction {
  final bool? status;
  final String? message;
  final MakeTransactionData? data;

  MakeTransaction({
    this.status,
    this.message,
    this.data,
  });

  factory MakeTransaction.fromJson(Map<String, dynamic> json) {
    return MakeTransaction(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? MakeTransactionData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}

class MakeTransactionData {
  final int? walletId;
  final String? type;
  final String? amount;
  final String? reference;
  final String? status;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  MakeTransactionData({
    this.walletId,
    this.type,
    this.amount,
    this.reference,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory MakeTransactionData.fromJson(Map<String, dynamic> json) {
    return MakeTransactionData(
      walletId: json['wallet_id'],
      type: json['type'],
      amount: json['amount'],
      reference: json['reference'],
      status: json['status'],
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'wallet_id': walletId,
        'type': type,
        'amount': amount,
        'reference': reference,
        'status': status,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };
}
