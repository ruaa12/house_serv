import 'dart:convert';

CategoryServiceModel categoryServiceModelFromJson(String str) => CategoryServiceModel.formJson(json.decode(str));

class CategoryServiceModel {
  bool? status;
  String? message;
  List<Category>? data;

  CategoryServiceModel({
    this.message,
    this.data,
    this.status,
  });

  factory CategoryServiceModel.formJson(Map<String, dynamic> json) => CategoryServiceModel(
        message: json["message"],
        status: json["status"],
        data: json["data"] == null ? [] : List<Category>.from(json["data"].map((e) => Category.fromJson(e))),
      );
}

class Category {
  int? id;
  String? name;
  String? media;

  Category({
    this.name,
    this.id,
    this.media,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        media: json["media_urls"],
      );
}
