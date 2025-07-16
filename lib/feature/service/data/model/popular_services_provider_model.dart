class PopularServicesProvider {
  final bool? status;
  final String? message;
  final List<PopularServiceProviderData>? data;

  PopularServicesProvider({
    this.status,
    this.message,
    this.data,
  });

  factory PopularServicesProvider.fromJson(Map<String, dynamic> json) {
    return PopularServicesProvider(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List<PopularServiceProviderData>.from(
              json['data'].map((x) => PopularServiceProviderData.fromJson(x)),
            )
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((x) => x.toJson()).toList(),
      };
}

class PopularServiceProviderData {
  final int? id;
  final String? name;
  final String? imageUrl;

  PopularServiceProviderData({
    this.id,
    this.name,
    this.imageUrl,
  });

  factory PopularServiceProviderData.fromJson(Map<String, dynamic> json) {
    return PopularServiceProviderData(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image_url': imageUrl,
      };
}
