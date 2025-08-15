import 'package:home_serviece/core/unified_api/failures.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/service/data/model/categories.dart';
import 'package:home_serviece/feature/service/data/model/categories_ser_model.dart';
import 'package:home_serviece/feature/service/data/model/category_prov_model.dart'
    as prov;
import 'package:home_serviece/feature/service/data/model/popular_services_provider_model.dart';
import 'package:home_serviece/feature/service/data/model/populer_services_model.dart';

class ServiceState {
  // الحاجات القديمة
  final ApiStatus categoryStatus;
  final Failure? categoryFailure;
  final List<CategoryData>? categories;

  // الحالة الجديدة الخاصة بتفاصيل الكاتيغوري
  final ApiStatus categoryDetailsStatus;
  final Failure? categoryDetailsFailure;
  final CategoryDetailsData? categoryDetails;

  // حالة الخدمة مع المزودين (service with providers)
  final ApiStatus serviceWithProvStatus;
  final Failure? serviceWithProvFailure;
  final prov.ServiceWithproviderData? serviceWithProv;

  final ApiStatus popularServicesStatus;
  final List<PopularServiceData>? popularServices;
  final String? popularServicesError;

  final ApiStatus popularServicesProvidersStatus;
  final List<PopularServiceProviderData>? popularServicesProviders;

  ServiceState({
    this.categoryStatus = ApiStatus.initial,
    this.categoryFailure,
    this.categories,
    this.categoryDetailsStatus = ApiStatus.initial,
    this.categoryDetailsFailure,
    this.categoryDetails,
    this.serviceWithProvStatus = ApiStatus.initial,
    this.serviceWithProvFailure,
    this.serviceWithProv,
    this.popularServicesStatus = ApiStatus.initial,
    this.popularServices,
    this.popularServicesError,
    this.popularServicesProvidersStatus = ApiStatus.initial,
    this.popularServicesProviders,
  });

  ServiceState copyWith({
    ApiStatus? categoryStatus,
    Failure? categoryFailure,
    List<CategoryData>? categories,
    ApiStatus? categoryDetailsStatus,
    Failure? categoryDetailsFailure,
    CategoryDetailsData? categoryDetails,
    ApiStatus? serviceWithProvStatus,
    Failure? serviceWithProvFailure,
    prov.ServiceWithproviderData? serviceWithProv,
    ApiStatus? popularServicesStatus,
    List<PopularServiceData>? popularServices,
    String? popularServicesError,
    ApiStatus? popularServicesProvidersStatus,
    List<PopularServiceProviderData>? popularServicesProviders,
  }) {
    return ServiceState(
      categoryStatus: categoryStatus ?? this.categoryStatus,
      categoryFailure: categoryFailure ?? this.categoryFailure,
      categories: categories ?? this.categories,
      categoryDetailsStatus:
          categoryDetailsStatus ?? this.categoryDetailsStatus,
      categoryDetailsFailure:
          categoryDetailsFailure ?? this.categoryDetailsFailure,
      categoryDetails: categoryDetails ?? this.categoryDetails,
      serviceWithProvStatus:
          serviceWithProvStatus ?? this.serviceWithProvStatus,
      serviceWithProvFailure:
          serviceWithProvFailure ?? this.serviceWithProvFailure,
      serviceWithProv: serviceWithProv ?? this.serviceWithProv,
      popularServicesStatus:
          popularServicesStatus ?? this.popularServicesStatus,
      popularServices: popularServices ?? this.popularServices,
      popularServicesError: popularServicesError ?? this.popularServicesError,
      popularServicesProvidersStatus:
          popularServicesProvidersStatus ?? this.popularServicesProvidersStatus,
      popularServicesProviders:
          popularServicesProviders ?? this.popularServicesProviders,
    );
  }
}
