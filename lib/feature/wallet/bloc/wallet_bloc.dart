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
    on<MakeTransactionEvent>(_onMakeTransaction);
  }

  Future<void> _onGetBalance(
      GetBalanceEvent event, Emitter<WalletState> emit) async {
    emit(state.copyWith(balanceStatus: ApiStatus.loading));

    try {
      final response = await dataSource.getBalance();
      emit(state.copyWith(
          balanceStatus: ApiStatus.success,
          balance: double.tryParse(response.data?.balance ?? '0.0')));
    } catch (e) {
      emit(state.copyWith(
        balanceStatus: ApiStatus.failed,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onMakeTransaction(
      MakeTransactionEvent event, Emitter<WalletState> emit) async {
    emit(state.copyWith(transactionStatus: ApiStatus.loading));

    try {
      final result = await dataSource.makeTransaction(event.amount);

      emit(state.copyWith(
        transactionStatus: ApiStatus.success,
      ));

      // بعد نجاح العملية، ممكن نحدّث الرصيد مباشرة
      final balance = await dataSource.getBalance();
      emit(state.copyWith(
        balance: double.tryParse(balance.data?.balance ?? '0.0'),
      ));
    } catch (e) {
      emit(state.copyWith(
        transactionStatus: ApiStatus.failed,
        transactionErrorMessage: e.toString(),
      ));
    }
  }
}
