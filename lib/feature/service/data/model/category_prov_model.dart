class ServWithProvResponse {
  final bool status;
  final String message;
  final ServWithProv data;

  ServWithProvResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ServWithProvResponse.fromJson(Map<String, dynamic> json) {
    return ServWithProvResponse(
      status: json['status'],
      message: json['message'],
      data: ServWithProv.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data.toJson(),
      };
}

class ServWithProv {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final List<ProviderData> serviceProviders;

  ServWithProv({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.serviceProviders,
  });

  factory ServWithProv.fromJson(Map<String, dynamic> json) {
    return ServWithProv(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      serviceProviders: (json['serviceProviders'] as List)
          .map((e) => ProviderData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image_url': imageUrl,
        'serviceProviders': serviceProviders.map((e) => e.toJson()).toList(),
      };
}

class ProviderData {
  final int id;
  final String name;
  final String? description;
  final String imageUrl;

  ProviderData({
    required this.id,
    required this.name,
    this.description,
    required this.imageUrl,
  });

  factory ProviderData.fromJson(Map<String, dynamic> json) {
    return ProviderData(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
    );
  }

  get hourlyRate => null;

  get location => null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image_url': imageUrl,
      };
}
