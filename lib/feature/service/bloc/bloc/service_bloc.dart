import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/failures.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/service/bloc/bloc/service_event.dart';
import 'package:home_serviece/feature/service/bloc/bloc/service_state.dart';
import 'package:home_serviece/feature/service/data/data_source/service_datasource.dart';
import 'package:home_serviece/feature/service/data/model/categories_ser_model.dart';
import 'package:home_serviece/feature/service/data/model/category_prov_model.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final ServiceDataSource dataSource;

  ServiceBloc({required this.dataSource}) : super(ServiceState()) {
    on<GetCategoriesEvent>(_getCategories);
    on<GetCategoryDetailsEvent>(_getCategoryDetails);
    on<GetServiceWithProvEvent>(_getServWithProv);
    on<GetPopularServicesEvent>(_onGetPopularServices);
    on<SearchServiceEvent>(_searchService);
    on<SearchProviders>(_searchProviders);
    on<GetPopularServicesProvidersEvent>(_onGetPopularServicesProviders);
    //on<GetServiceWithProvEvent>(
  }

  List<ServiceProvider> originalProviders = [];
  List<ServiceData> originalServices = [];

  Future<void> _getCategories(GetCategoriesEvent event, Emitter<ServiceState> emit) async {
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

  Future<void> _getCategoryDetails(GetCategoryDetailsEvent event, Emitter<ServiceState> emit) async {
    emit(state.copyWith(categoryDetailsStatus: ApiStatus.loading));
    try {
      final response = await dataSource.getCategoryDetails(event.categoryId);
      if (response.status) {
        originalServices = response.data.services;
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

  Future<void> _getServWithProv(GetServiceWithProvEvent event, Emitter<ServiceState> emit) async {
    emit(state.copyWith(categoryStatus: ApiStatus.loading));
    try {
      final response = await dataSource.getServiceWithProviders(event.serviceId);
      if (response.status) {
        originalProviders = response.data.serviceProviders;
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

  Future<void> _onGetPopularServices(GetPopularServicesEvent event, Emitter<ServiceState> emit) async {
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

  FutureOr<void> _searchService(SearchServiceEvent event, Emitter emit) {
    if(event.query == ''){
      state.categoryDetails!.services = originalServices;
      emit(state.copyWith(categoryDetails: state.categoryDetails));
    }
    else{
      List<ServiceData> searchedService =
      state.categoryDetails!.services.where((element) => element.name.toLowerCase().contains(event.query.toLowerCase())).toList();
      state.categoryDetails!.services = searchedService;
      emit(state.copyWith(categoryDetails: state.categoryDetails));
    }
  }

  FutureOr<void> _searchProviders(SearchProviders event, Emitter emit) {
    if(event.query == ''){
      state.serviceWithProv!.serviceProviders = originalProviders;
      emit(state.copyWith(serviceWithProv: state.serviceWithProv,));
    }
    else{
      List<ServiceProvider> searchProvider =
      state.serviceWithProv!.serviceProviders.where((element) => element.name.toLowerCase().contains(event.query.toLowerCase())).toList();
      state.serviceWithProv!.serviceProviders = searchProvider;
      emit(state.copyWith(serviceWithProv: state.serviceWithProv,));
    }
  }

/*Future<void> _getproviders(
    GetServiceProvidersEvent event,
    Emitter<ServiceState> emit,
  ) async {
    emit(state.copyWith(serviceWithProvStatus: ApiStatus.loading));
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
  }*/
}
