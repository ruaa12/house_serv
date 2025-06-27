class CategoryResponse {
  final bool status;
  final String message;
  final List<CategoryData> data;

  CategoryResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      status: json["status"],
      message: json["message"],
      data: List<CategoryData>.from(
        json["data"].map((x) => CategoryData.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryData {
  final int id;
  final String name;
  final String mediaUrls;

  CategoryData({
    required this.id,
    required this.name,
    required this.mediaUrls,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json["id"],
      name: json["name"],
      mediaUrls: json["media_urls"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "media_urls": mediaUrls,
      };
}
