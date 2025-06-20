import 'package:home_serviece/feature/wallet/data/modeles/get_balance.dart';

abstract class WalletState {}

class WalletInitialState extends WalletState {}

class WalletLoadingState extends WalletState {}

class WalletLoadedState extends WalletState {
  final GetBalance? balance;
  WalletLoadedState(this.balance);
}

class WalletErrorState extends WalletState {
  final String error;
  WalletErrorState({required this.error});
}
