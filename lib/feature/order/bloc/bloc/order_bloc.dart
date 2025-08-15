import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/failures.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/order/data/data_source/order_datasource.dart';
import 'package:home_serviece/feature/order/data/model/show_order.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderDataSource dataSource;
  OrderBloc({required this.dataSource}) : super(OrderState()) {
    on<GetUserOrdersEvent>(_getUserOrders);
    on<CreateHouseOrderEvent>(_createHouseOrder);
    on<CreateServOrderEvent>(_createServOrder);
  }

  Future<void> _getUserOrders(
      GetUserOrdersEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));
    try {
      final response = await dataSource.getUserOrders(page: event.page);
      emit(state.copyWith(
        status: ApiStatus.success,
        orders: response.data,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ApiStatus.failed,
        failure: ServerFailure(message: e.toString()),
      ));
    }
  }

  Future<void> _createHouseOrder(
    CreateHouseOrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(createHouseOrderStatus: ApiStatus.loading));
    try {
      final result = await dataSource.createHouseOrder(
        houseId: event.houseId,
        notes: event.notes,
      );
      if (result) {
        emit(state.copyWith(createHouseOrderStatus: ApiStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(
        createHouseOrderStatus: ApiStatus.failed,
        createHouseOrderFailure: ServerFailure(message: e.toString()),
      ));
    }
  }

  Future<void> _createServOrder(
    CreateServOrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(createServOrderStatus: ApiStatus.loading));
    try {
      final result = await dataSource.createServOrder(
        serviceId: event.serviceId,
        notes: event.notes,
        serviceDate: event.serviceDate,
      );
      if (result) {
        emit(state.copyWith(createServOrderStatus: ApiStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(
        createServOrderStatus: ApiStatus.failed,
        createServOrderFailure: ServerFailure(message: e.toString()),
      ));
    }
  }
}
