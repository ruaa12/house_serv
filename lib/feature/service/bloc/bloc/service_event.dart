abstract class ServiceEvent {}

class GetCategoriesEvent extends ServiceEvent {}

class GetCategoriesWithServicesEvent extends ServiceEvent {}

class GetCategoryDetailsEvent extends ServiceEvent {
  final int categoryId;
  GetCategoryDetailsEvent({required this.categoryId});
}

class GetServiceWithProvEvent extends ServiceEvent {
  final int serviceId;
  GetServiceWithProvEvent({required this.serviceId});
}

class GetPopularServicesEvent extends ServiceEvent {}

class GetPopularServicesProvidersEvent extends ServiceEvent {}
