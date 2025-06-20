part of 'estate_bloc.dart';

class EstateState {
  final List<HouseModel> estates;
  final ApiStatus allEstatesStatus;

  EstateState({
    this.estates = const [],
    this.allEstatesStatus = ApiStatus.initial,
  });

  EstateState copyWith({
    List<HouseModel>? estates,
    ApiStatus? allEstatesStatus,
  }) {
    return EstateState(
      estates: estates ?? this.estates,
      allEstatesStatus: allEstatesStatus ?? this.allEstatesStatus,
    );
  }
}
