import 'dart:convert';

EstateDetailsResponseModel estateDetailsResponseModelFromJson(String str) =>
    EstateDetailsResponseModel.fromJson(json.decode(str));

String estateDetailsResponseModelToJson(EstateDetailsResponseModel data) =>
    json.encode(data.toJson());

class EstateDetailsResponseModel {
  final bool? status;
  final String? message;
  final EstateDetails? data;

  EstateDetailsResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory EstateDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      EstateDetailsResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : EstateDetails.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class EstateDetails {
  final int? id;
  final String? title;
  final String? description;
  final String? price;
  final String? status;
  final String? period;
  final List<String>? images;
  final Address? address;
  final Owner? owner;

  EstateDetails({
    this.id,
    this.title,
    this.description,
    this.price,
    this.status,
    this.period,
    this.images,
    this.address,
    this.owner,
  });

  factory EstateDetails.fromJson(Map<String, dynamic> json) => EstateDetails(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        status: json["status"],
        period: json["period"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"].map((x) => x)),
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "status": status,
        "period": period,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x)),
        "address": address?.toJson(),
        "owner": owner?.toJson(),
      };
}

class Address {
  final int? id;
  final String? city;
  final String? region;
  final String? street;
  final String? building;

  Address({
    this.id,
    this.city,
    this.region,
    this.street,
    this.building,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        city: json["city"],
        region: json["region"],
        street: json["street"],
        building: json["building"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "region": region,
        "street": street,
        "building": building,
      };
}

class Owner {
  final int? id;
  final String? name;
  final String? email;
  final String? imageUrl;
  final String? phone;

  Owner({
    this.id,
    this.name,
    this.email,
    this.imageUrl,
    this.phone,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        imageUrl: json["image_url"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image_url": imageUrl,
        "phone": phone,
      };
}
