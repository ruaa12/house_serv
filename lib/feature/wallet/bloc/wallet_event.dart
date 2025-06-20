abstract class WalletEvent {}

class GetBalanceEvent extends WalletEvent {}

class MakeTransactionEvent extends WalletEvent {
  final String type;
  final String amount;

  MakeTransactionEvent(this.type, this.amount);
}
