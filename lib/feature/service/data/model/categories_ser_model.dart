class CategoryDetailsResponse {
  final bool status;
  final String message;
  final CategoryDetailsData data;

  CategoryDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CategoryDetailsResponse.fromJson(Map<String, dynamic> json) {
    return CategoryDetailsResponse(
      status: json["status"],
      message: json["message"],
      data: CategoryDetailsData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class CategoryDetailsData {
  final int id;
  final String name;
  final String mediaUrls;
  List<ServiceData> services;

  CategoryDetailsData({
    required this.id,
    required this.name,
    required this.mediaUrls,
    required this.services,
  });

  factory CategoryDetailsData.fromJson(Map<String, dynamic> json) {
    return CategoryDetailsData(
      id: json["id"],
      name: json["name"],
      mediaUrls: json["media_urls"],
      services: List<ServiceData>.from(
        json["services"].map((x) => ServiceData.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "media_urls": mediaUrls,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
      };
}

class ServiceData {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  ServiceData({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) {
    return ServiceData(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      imageUrl: json["image_url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image_url": imageUrl,
      };
}
