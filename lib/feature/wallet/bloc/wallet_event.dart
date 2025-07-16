part of 'wallet_bloc.dart';

abstract class WalletEvent {}

class GetBalanceEvent extends WalletEvent {}

class MakeTransactionEvent extends WalletEvent {
  final double amount;

  MakeTransactionEvent(this.amount);
}
