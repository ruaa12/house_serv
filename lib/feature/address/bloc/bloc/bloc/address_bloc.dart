import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/failures.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/address/data/models/address.dart';
import 'package:home_serviece/feature/address/data/data_source/address_datasource.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressDataSource dataSource;

  AddressBloc({required this.dataSource}) : super(AddressState()) {
    on<CreateAddressEvent>(_onCreateAddress);
  }

  Future<void> _onCreateAddress(
      CreateAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));

    try {
      await dataSource.createAddress(event.addressData);
      emit(state.copyWith(status: ApiStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: ApiStatus.failed,
        failure: ServerFailure(message: e.toString()),
      ));
    }
  }
}
