// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'estate_bloc.dart';

class EstateState {
  final List<HouseModel> estates;
  final ApiStatus allEstatesStatus;

  final ApiStatus detailsEstateStatus;
  final List<EstateDetails> detEstate;
  final EstateDetails? estatedetails;
  final String? message;

  EstateState({
    this.estates = const [],
    this.allEstatesStatus = ApiStatus.initial,
    this.detailsEstateStatus = ApiStatus.initial,
    this.detEstate = const [],
     this.estatedetails,
    this.message,
  });

  

  EstateState copyWith({
    List<HouseModel>? estates,
    ApiStatus? allEstatesStatus,
    ApiStatus? detailsEstateStatus,
    List<EstateDetails>? detEstate,
    EstateDetails? estatedetails,
    String? message,
  }) {
    return EstateState(
      estates: estates ?? this.estates,
      allEstatesStatus: allEstatesStatus ?? this.allEstatesStatus,
      detailsEstateStatus: detailsEstateStatus ?? this.detailsEstateStatus,
      detEstate: detEstate ?? this.detEstate,
      estatedetails: estatedetails ?? this.estatedetails,
      message: message ?? this.message,
    );
  }
}
