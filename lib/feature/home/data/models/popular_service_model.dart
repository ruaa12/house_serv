import 'dart:convert';

PopularServiceResponseModel popularServiceResponseModelFromJson(String str) =>
    PopularServiceResponseModel.fromJson(json.decode(str));

String popularServiceResponseModelToJson(PopularServiceResponseModel data) =>
    json.encode(data.toJson());

class PopularServiceResponseModel {
  final bool? status;
  final String? message;
  final List<ServiceModel>? data;

  PopularServiceResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory PopularServiceResponseModel.fromJson(Map<String, dynamic> json) =>
      PopularServiceResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ServiceModel>.from(
                json["data"]!.map((x) => ServiceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ServiceModel {
  final int? id;
  final String? name;
  final String? description;
  final String? imageUrl;

  ServiceModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image_url": imageUrl,
      };
}