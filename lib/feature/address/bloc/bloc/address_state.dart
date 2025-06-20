import 'package:home_serviece/feature/address/data/models/address.dart';

enum ApiStatus { initial, success, failed, loading }

class AddressState {
  final ApiStatus status;
  final AddressData? address;
  final String? errorMessage;

  const AddressState({
    this.status = ApiStatus.initial,
    this.address,
    this.errorMessage,
  });

  AddressState copyWith({
    ApiStatus? status,
    AddressData? address,
    String? errorMessage,
  }) {
    return AddressState(
      status: status ?? this.status,
      address: address ?? this.address,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
