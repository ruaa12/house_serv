part of 'order_bloc.dart';

class OrderState {
  final ApiStatus status;
  final Failure? failure;
  final List<UserOrder>? orders;

  final ApiStatus createHouseOrderStatus;
  final Failure? createHouseOrderFailure;
  final ApiStatus createServOrderStatus;
  final Failure? createServOrderFailure;

  OrderState({
    this.status = ApiStatus.initial,
    this.failure,
    this.orders,
    this.createHouseOrderStatus = ApiStatus.initial,
    this.createHouseOrderFailure,
    this.createServOrderStatus = ApiStatus.initial,
    this.createServOrderFailure,
  });

  OrderState copyWith(
      {ApiStatus? status,
      Failure? failure,
      List<UserOrder>? orders,
      ApiStatus? createHouseOrderStatus,
      Failure? createHouseOrderFailure,
      ApiStatus? createServOrderStatus,
      Failure? createServOrderFailure}) {
    return OrderState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      orders: orders ?? this.orders,
      createHouseOrderStatus:
          createHouseOrderStatus ?? this.createHouseOrderStatus,
      createHouseOrderFailure:
          createHouseOrderFailure ?? this.createHouseOrderFailure,
      createServOrderStatus:
          createServOrderStatus ?? this.createServOrderStatus,
      createServOrderFailure:
          createServOrderFailure ?? this.createServOrderFailure,
    );
  }
}
