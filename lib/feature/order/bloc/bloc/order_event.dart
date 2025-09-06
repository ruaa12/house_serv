part of 'order_bloc.dart';

abstract class OrderEvent {}

class GetUserOrdersEvent extends OrderEvent {
  final int page; // لو بدك تدعم الـ pagination
  GetUserOrdersEvent({required this.page});
}

class CreateHouseOrderEvent extends OrderEvent {
  final int houseId;
  final File image;
  final BuildContext context;

  CreateHouseOrderEvent({required this.houseId, required this.image, required this.context,});
}

class CreateServOrderEvent extends OrderEvent {
  final int serviceId;
  final String notes;
  final String serviceDate;
  final File image;
  final BuildContext context;

  CreateServOrderEvent({
    required this.serviceId,
    required this.notes,
    required this.serviceDate,
    required this.image,
    required this.context,
  });
}
