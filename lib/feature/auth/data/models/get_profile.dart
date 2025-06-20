import 'dart:convert';

UserProfileResponse userProfileResponseFromJson(String str) =>
    UserProfileResponse.fromJson(json.decode(str));

String userProfileResponseToJson(UserProfileResponse data) =>
    json.encode(data.toJson());

class UserProfileResponse {
  final bool? status;
  final String? message;
  final UserData? data;

  UserProfileResponse({
    this.status,
    this.message,
    this.data,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      UserProfileResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class UserData {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final dynamic emailVerifiedAt;
  final dynamic twoFactorConfirmedAt;
  final dynamic serviceId;
  final String? token;
  final dynamic profilePhotoPath;
  final dynamic currentTeamId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? profilePhotoUrl;

  UserData({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.twoFactorConfirmedAt,
    this.serviceId,
    this.token,
    this.profilePhotoPath,
    this.currentTeamId,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        emailVerifiedAt: json["email_verified_at"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        serviceId: json["service_id"],
        token: json["token"],
        profilePhotoPath: json["profile_photo_path"],
        currentTeamId: json["current_team_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "phone": phone,
        "email_verified_at": emailVerifiedAt,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "service_id": serviceId,
        "token": token,
        "profile_photo_path": profilePhotoPath,
        "current_team_id": currentTeamId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "profile_photo_url": profilePhotoUrl,
      };
}
