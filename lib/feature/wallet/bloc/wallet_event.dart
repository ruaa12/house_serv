import 'package:equatable/equatable.dart';

abstract class WalletEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MakeWalletTransactionEvent extends WalletEvent {
  final String amount;
  final String type;

  MakeWalletTransactionEvent({required this.amount, required this.type});

  @override
  List<Object?> get props => [amount, type];
}
