part of 'wallet_bloc.dart';

class WalletState {
  final ApiStatus balanceStatus;
  final double? balance;
  final String? errorMessage;

  WalletState({
    this.balanceStatus = ApiStatus.initial,
    this.balance,
    this.errorMessage,
  });

  WalletState copyWith({
    ApiStatus? balanceStatus,
    double? balance,
    String? errorMessage,
  }) {
    return WalletState(
      balanceStatus: balanceStatus ?? this.balanceStatus,
      balance: balance ?? this.balance,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
