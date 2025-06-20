// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState {
  final List<HouseModel> trendingHouses;
  final List<ServiceModel> popularService;
  final ApiStatus trendingHousesStatus;
  final ApiStatus papularServicesStatus;
  final ApiStatus papularProvidersStatus;
  HomeState({
     this.trendingHouses= const[],
     this.popularService= const[],
     this.trendingHousesStatus = ApiStatus.initial,
     this.papularServicesStatus = ApiStatus.initial,
     this.papularProvidersStatus = ApiStatus.initial,
  });


  HomeState copyWith({
    List<HouseModel>? trendingHouses,
    List<ServiceModel>? popularService,
    ApiStatus? trendingHousesStatus,
    ApiStatus? papularServicesStatus,
    ApiStatus? papularProvidersStatus,
  }) {
    return HomeState(
      trendingHouses: trendingHouses ?? this.trendingHouses,
      popularService: popularService ?? this.popularService,
      trendingHousesStatus: trendingHousesStatus ?? this.trendingHousesStatus,
      papularServicesStatus: papularServicesStatus ?? this.papularServicesStatus,
      papularProvidersStatus: papularProvidersStatus ?? this.papularProvidersStatus,
    );
  }
 }
