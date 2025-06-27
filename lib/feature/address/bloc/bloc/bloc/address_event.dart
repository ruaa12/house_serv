part of 'address_bloc.dart';

abstract class AddressEvent {}

class CreateAddressEvent extends AddressEvent {
  final AddressData addressData;

  CreateAddressEvent({required this.addressData});
}
