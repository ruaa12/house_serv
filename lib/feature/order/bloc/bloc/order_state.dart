part of 'order_bloc.dart';

class OrderState {
  final ApiStatus status;
  final Failure? failure;
  final List<UserOrder>? orders;

  final ApiStatus createHouseOrderStatus;
  final Failure? createHouseOrderFailure;

  OrderState({
    this.status = ApiStatus.initial,
    this.failure,
    this.orders,
    this.createHouseOrderStatus = ApiStatus.initial,
    this.createHouseOrderFailure,
  });

  OrderState copyWith({
    ApiStatus? status,
    Failure? failure,
    List<UserOrder>? orders,
    ApiStatus? createHouseOrderStatus,
    Failure? createHouseOrderFailure,
  }) {
    return OrderState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      orders: orders ?? this.orders,
      createHouseOrderStatus:
          createHouseOrderStatus ?? this.createHouseOrderStatus,
      createHouseOrderFailure:
          createHouseOrderFailure ?? this.createHouseOrderFailure,
    );
  }
}
