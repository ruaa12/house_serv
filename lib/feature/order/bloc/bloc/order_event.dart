part of 'order_bloc.dart';

abstract class OrderEvent {}

class GetUserOrdersEvent extends OrderEvent {
  final int page; // لو بدك تدعم الـ pagination
  GetUserOrdersEvent({required this.page});
}

class CreateHouseOrderEvent extends OrderEvent {
  final int houseId;
  final String notes;

  CreateHouseOrderEvent({required this.houseId, required this.notes});
}
