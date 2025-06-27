part of 'address_bloc.dart';

class AddressState {
  final ApiStatus status;
  final Failure? failure;
  final AddressData? address;

  AddressState({this.status = ApiStatus.initial, this.failure, this.address});

  AddressState copyWith({
    ApiStatus? status,
    Failure? failure,
  }) {
    return AddressState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      address: address ?? this.address,
    );
  }
}
