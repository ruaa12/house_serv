class GetBalance {
  final bool? status;
  final String? message;
  final BalanceData? data;

  GetBalance({
    this.status,
    this.message,
    this.data,
  });

  factory GetBalance.fromJson(Map<String, dynamic> json) => GetBalance(
        status: json["status"],
        message: json["message"],
        data: json["data"] != null ? BalanceData.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class BalanceData {
  final int? balance;
  final String? currency;

  BalanceData({
    this.balance,
    this.currency,
  });

  factory BalanceData.fromJson(Map<String, dynamic> json) => BalanceData(
        balance: json["balance"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
        "currency": currency,
      };
}
