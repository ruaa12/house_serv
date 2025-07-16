import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/failures.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/service/bloc/bloc/service_event.dart';
import 'package:home_serviece/feature/service/bloc/bloc/service_state.dart';
import 'package:home_serviece/feature/service/data/data_source/service_datasource.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServiceDataSource dataSource;

  ServiceBloc({required this.dataSource}) : super(ServiceState()) {
    on<GetCategoriesEvent>(_getCategories);
    on<GetCategoryDetailsEvent>(_getCategoryDetails);
    on<GetServiceWithProvEvent>(_getServWithProv);
    on<GetPopularServicesEvent>(_onGetPopularServices);
    on<GetPopularServicesProvidersEvent>(_onGetPopularServicesProviders);
  }

  Future<void> _getCategories(
      GetCategoriesEvent event, Emitter<ServiceState> emit) async {
    emit(state.copyWith(categoryStatus: ApiStatus.loading));
    try {
      final response = await dataSource.getCategories();
      if (response.status) {
        emit(state.copyWith(
          categoryStatus: ApiStatus.success,
          categories: response.data,
        ));
      } else {
        emit(state.copyWith(
          categoryStatus: ApiStatus.failed,
          categoryFailure: ServerFailure(message: response.message),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        categoryStatus: ApiStatus.failed,
        categoryFailure: ServerFailure(message: e.toString()),
      ));
    }
  }

  Future<void> _getCategoryDetails(
      GetCategoryDetailsEvent event, Emitter<ServiceState> emit) async {
    emit(state.copyWith(categoryDetailsStatus: ApiStatus.loading));
    try {
      final response = await dataSource.getCategoryDetails(event.categoryId);
      if (response.status) {
        emit(state.copyWith(
          categoryDetailsStatus: ApiStatus.success,
          categoryDetails: response.data,
        ));
      } else {
        emit(state.copyWith(
          categoryDetailsStatus: ApiStatus.failed,
          categoryDetailsFailure: ServerFailure(message: response.message),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        categoryDetailsStatus: ApiStatus.failed,
        categoryDetailsFailure: ServerFailure(message: e.toString()),
      ));
    }
  }

  Future<void> _getServWithProv(
      GetServiceWithProvEvent event, Emitter<ServiceState> emit) async {
    emit(state.copyWith(categoryStatus: ApiStatus.loading));
    try {
      final response =
          await dataSource.getServiceWithProviders(event.serviceId);
      if (response.status) {
        emit(state.copyWith(
          serviceWithProvStatus: ApiStatus.success,
          serviceWithProv: response.data,
        ));
      } else {
        emit(state.copyWith(
          serviceWithProvStatus: ApiStatus.failed,
          serviceWithProvFailure: ServerFailure(message: response.message),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        serviceWithProvStatus: ApiStatus.failed,
        serviceWithProvFailure: ServerFailure(message: e.toString()),
      ));
    }
  }

  Future<void> _onGetPopularServices(
      GetPopularServicesEvent event, Emitter<ServiceState> emit) async {
    emit(state.copyWith(popularServicesStatus: ApiStatus.loading));

    try {
      final response = await dataSource.getPopularServices();
      emit(state.copyWith(
        popularServicesStatus: ApiStatus.success,
        popularServices: response.data,
      ));
    } catch (e) {
      emit(state.copyWith(
        popularServicesStatus: ApiStatus.failed,
        popularServicesError: e.toString(),
      ));
    }
  }

  Future<void> _onGetPopularServicesProviders(
    GetPopularServicesProvidersEvent event,
    Emitter<ServiceState> emit,
  ) async {
    emit(state.copyWith(popularServicesProvidersStatus: ApiStatus.loading));

    try {
      final response = await dataSource.getPopularServicesProviders();
      emit(state.copyWith(
        popularServicesProvidersStatus: ApiStatus.success,
        popularServicesProviders: response.data,
      ));
    } catch (e) {
      emit(state.copyWith(
        popularServicesProvidersStatus: ApiStatus.failed,
      ));
    }
  }
}
