part of 'estate_bloc.dart';

abstract class EstateEvent {}

class GetAllEstatesEvent extends EstateEvent {}

class GetEstateDetailsEvent extends EstateEvent {
  final int estateId;
  GetEstateDetailsEvent( this.estateId);
}
