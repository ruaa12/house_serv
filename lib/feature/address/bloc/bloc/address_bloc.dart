import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/address/bloc/bloc/address_event.dart';
import 'package:home_serviece/feature/address/data/data_source/address_datasource.dart';

import 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressDataSource dataSource;

  AddressBloc({required this.dataSource}) : super(const AddressState()) {
    on<CreateAddressEvent>((event, emit) async {
      emit(state.copyWith(status: ApiStatus.loading));

      try {
        final address = await dataSource.createAddress(
          city: event.city,
          region: event.region,
          street: event.street,
          building: event.building,
        );

        if (address != null) {
          emit(state.copyWith(status: ApiStatus.success, address: address));
        } else {
          emit(state.copyWith(
              status: ApiStatus.failed, errorMessage: 'Creation failed'));
        }
      } catch (e) {
        emit(state.copyWith(
            status: ApiStatus.failed, errorMessage: e.toString()));
      }
    });
  }
}
