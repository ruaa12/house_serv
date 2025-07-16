part of 'wallet_bloc.dart';

class WalletState {
  final ApiStatus balanceStatus;
  final double? balance;
  final String? errorMessage;
  final ApiStatus transactionStatus;
  final String? transactionErrorMessage;

  WalletState({
    this.balanceStatus = ApiStatus.initial,
    this.balance,
    this.errorMessage,
    this.transactionStatus = ApiStatus.initial,
    this.transactionErrorMessage,
  });

  WalletState copyWith({
    ApiStatus? balanceStatus,
    double? balance,
    String? errorMessage,
    ApiStatus? transactionStatus,
    String? transactionErrorMessage,
  }) {
    return WalletState(
      balanceStatus: balanceStatus ?? this.balanceStatus,
      balance: balance ?? this.balance,
      errorMessage: errorMessage ?? this.errorMessage,
      transactionStatus: transactionStatus ?? this.transactionStatus,
      transactionErrorMessage:
          transactionErrorMessage ?? this.transactionErrorMessage,
    );
  }
}
