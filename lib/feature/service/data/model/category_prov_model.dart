class ServiceDetailsResponse {
  final bool status;
  final String message;
  final ServiceWithproviderData data;

  ServiceDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ServiceDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ServiceDetailsResponse(
      status: json['status'],
      message: json['message'],
      data: ServiceWithproviderData.fromJson(json['data']),
    );
  }
}

class ServiceWithproviderData {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  List<ServiceProvider> serviceProviders;

  ServiceWithproviderData({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.serviceProviders,
  });

  factory ServiceWithproviderData.fromJson(Map<String, dynamic> json) {
    return ServiceWithproviderData(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      serviceProviders: (json['serviceProviders'] as List)
          .map((e) => ServiceProvider.fromJson(e))
          .toList(),
    );
  }
}

class ServiceProvider {
  final String hourlyRate;
  final int userId;
  final String name;
  final String username;
  final String email;
  final String phone;
  final List<dynamic> works;
  final String? image;
  final String? address;

  ServiceProvider({
    required this.hourlyRate,
    required this.userId,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.works,
    this.image,
    this.address,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
      hourlyRate: json['hourly_rate'],
      userId: json['user_id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      works: json['works'] ?? [],
      image: json['image'],
      address: json['address'],
    );
  }
}
