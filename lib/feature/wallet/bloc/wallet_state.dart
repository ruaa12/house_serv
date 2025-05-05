import 'package:equatable/equatable.dart';
import 'package:home_serviece/feature/wallet/data/modeles/WalletTransaction.dart';

abstract class WalletState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletSuccess extends WalletState {
  final WalletTransaction transaction;

  WalletSuccess(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

class WalletFailure extends WalletState {
  final String error;

  WalletFailure(this.error);

  @override
  List<Object?> get props => [error];
}
