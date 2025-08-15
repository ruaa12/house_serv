part of 'wallet_bloc.dart';

abstract class WalletEvent {}

class GetBalanceEvent extends WalletEvent {}

class MakeTransactionEvent extends WalletEvent {
  final double amount;
  final String type;

  MakeTransactionEvent({required this.amount, required this.type});
}
