// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/wallet/data/data_source/wallet_datasource.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletDataSource dataSource;
  WalletBloc({required this.dataSource}) : super(WalletState()) {
    on<GetBalanceEvent>(_onGetBalance);
  }

  Future<void> _onGetBalance(
      GetBalanceEvent event, Emitter<WalletState> emit) async {
    emit(state.copyWith(balanceStatus: ApiStatus.loading));

    try {
      final response = await dataSource.getBalance();
      emit(state.copyWith(
        balanceStatus: ApiStatus.success,
        balance: response.data?.balance?.toDouble(),
      ));
    } catch (e) {
      emit(state.copyWith(
        balanceStatus: ApiStatus.failed,
        errorMessage: e.toString(),
      ));
    }
  }
}
