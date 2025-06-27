import 'package:home_serviece/core/unified_api/failures.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/service/data/model/categories.dart';
import 'package:home_serviece/feature/service/data/model/categories_ser_model.dart';
import 'package:home_serviece/feature/service/data/model/category_prov_model.dart';

class ServiceState {
  // الحاجات القديمة
  final ApiStatus categoryStatus;
  final Failure? categoryFailure;
  final List<CategoryData>? categories;

  // للحالة الجديدة
  final ApiStatus categoryDetailsStatus;
  final Failure? categoryDetailsFailure;
  final CategoryDetailsData? categoryDetails;

  final ApiStatus serviceWithProvStatus;
  final Failure? serviceWithProvFailure;
  final ServWithProv? serviceWithProv;

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
    ServWithProv? serviceWithProv,
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
    );
  }
}
