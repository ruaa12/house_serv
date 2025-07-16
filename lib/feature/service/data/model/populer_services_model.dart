class PopularServices {
  final bool? status;
  final String? message;
  final List<PopularServiceData>? data;

  PopularServices({
    this.status,
    this.message,
    this.data,
  });

  factory PopularServices.fromJson(Map<String, dynamic> json) {
    return PopularServices(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List<PopularServiceData>.from(
              json['data'].map((x) => PopularServiceData.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((x) => x.toJson()).toList(),
      };
}

class PopularServiceData {
  final int? id;
  final String? name;
  final String? description;
  final String? imageUrl;

  PopularServiceData({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
  });

  factory PopularServiceData.fromJson(Map<String, dynamic> json) {
    return PopularServiceData(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image_url': imageUrl,
      };
}
