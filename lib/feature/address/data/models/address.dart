class AddressData {
  final String? city;
  final String? region;
  final String? street;
  final String? building;
  final int? addressableId;
  final String? addressableType;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  AddressData({
    this.city,
    this.region,
    this.street,
    this.building,
    this.addressableId,
    this.addressableType,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) => AddressData(
        city: json["city"] as String?,
        region: json["region"] as String?,
        street: json["street"] as String?,
        building: json["building"] as String?,
        addressableId: json["addressable_id"] as int?,
        addressableType: json["addressable_type"] as String?,
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "region": region,
        "street": street,
        "building": building,
        "addressable_id": addressableId,
        "addressable_type": addressableType,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
