// To parse this JSON data, do
//
//     final trendingHousesResponseModel = trendingHousesResponseModelFromJson(jsonString);

import 'dart:convert';
import 'package:home_serviece/feature/estate/data/models/get_houses.dart';


TrendingHousesResponseModel trendingHousesResponseModelFromJson(String str) => TrendingHousesResponseModel.fromJson(json.decode(str));

String trendingHousesResponseModelToJson(TrendingHousesResponseModel data) => json.encode(data.toJson());

class TrendingHousesResponseModel {
    final bool? status;
    final String? message;
    final List<HouseModel>? data;

    TrendingHousesResponseModel({
        this.status,
        this.message,
        this.data,
    });

    factory TrendingHousesResponseModel.fromJson(Map<String, dynamic> json) => TrendingHousesResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<HouseModel>.from(json["data"]!.map((x) => HouseModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

