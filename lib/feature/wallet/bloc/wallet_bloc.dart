import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/wallet/data/data_source/wallet_datasource.dart';
import 'wallet_event.dart';
import 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletDataSource walletDataSource;
  WalletBloc({required this.walletDataSource}) : super(WalletInitial()) {
    on<MakeWalletTransactionEvent>((event, emit) async {
      emit(WalletLoading());
      final wallet = await walletDataSource.makeTransaction(
          event.amount.toString(), event.type);

      if (wallet != null) {
        emit(WalletSuccess(wallet));
      } else {
        emit(WalletFailure('failed'));
      }
    });
  }
}
