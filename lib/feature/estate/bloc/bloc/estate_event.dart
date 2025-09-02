part of 'estate_bloc.dart';

abstract class EstateEvent {}

class GetAllEstatesEvent extends EstateEvent {}

class GetAllCategoriesEvent extends EstateEvent {}

class GetAllServiceInCategoryEvent extends EstateEvent {
  final int categoryId;

  GetAllServiceInCategoryEvent({required this.categoryId});
}

class GetAllProvidersInServiceEvent extends EstateEvent {
  final int serviceId;

  GetAllProvidersInServiceEvent({required this.serviceId});
}

class GetEstateDetailsEvent extends EstateEvent {
  final int estateId;

  GetEstateDetailsEvent(this.estateId);
}
