abstract class AddressEvent {}

class CreateAddressEvent extends AddressEvent {
  final String city;
  final String region;
  final String street;
  final String building;

  CreateAddressEvent({
    required this.city,
    required this.region,
    required this.street,
    required this.building,
  });
}
