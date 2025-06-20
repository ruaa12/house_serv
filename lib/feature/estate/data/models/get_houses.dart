// To parse this JSON data, do
//
//     final estateData = estateDataFromJson(jsonString);

import 'dart:convert';

EstateData estateDataFromJson(String str) => EstateData.fromJson(json.decode(str));

String estateDataToJson(EstateData data) => json.encode(data.toJson());

class EstateData {
    final String? status;
    final List<HouseModel>? data;
    final Meta? meta;

    EstateData({
        this.status,
        this.data,
        this.meta,
    });

    factory EstateData.fromJson(Map<String, dynamic> json) => EstateData(
        status: json["status"],
        data: json["data"] == null ? [] : List<HouseModel>.from(json["data"]!.map((x) => HouseModel.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
    };
}

class HouseModel {
    final int? id;
    final String? title;
    final String? description;
    final String? price;
    final Status? status;
    final List<String>? images;

    HouseModel({
        this.id,
        this.title,
        this.description,
        this.price,
        this.status,
        this.images,
    });

    factory HouseModel.fromJson(Map<String, dynamic> json) => HouseModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        status: statusValues.map[json["status"]]!,
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "status": statusValues.reverse[status],
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    };
}

enum Status {
    RENT,
    SALE
}

final statusValues = EnumValues({
    "rent": Status.RENT,
    "sale": Status.SALE
});

class Meta {
    final int? currentPage;
    final int? lastPage;
    final int? perPage;
    final int? total;

    Meta({
        this.currentPage,
        this.lastPage,
        this.perPage,
        this.total,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        lastPage: json["last_page"],
        perPage: json["per_page"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "last_page": lastPage,
        "per_page": perPage,
        "total": total,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
