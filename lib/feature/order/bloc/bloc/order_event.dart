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

class CreateServOrderEvent extends OrderEvent {
  final int serviceId;
  final String notes;
  final String serviceDate;

  CreateServOrderEvent({
    required this.serviceId,
    required this.notes,
    required this.serviceDate,
  });
}
