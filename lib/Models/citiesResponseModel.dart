// To parse this JSON data, do
//
//     final citiesResponseModel = citiesResponseModelFromJson(jsonString);

import 'dart:convert';

CitiesResponseModel citiesResponseModelFromJson(String str) =>
    CitiesResponseModel.fromJson(json.decode(str));

String citiesResponseModelToJson(CitiesResponseModel data) =>
    json.encode(data.toJson());

class CitiesResponseModel {
  CitiesResponseModel({
    this.cities,
  });

  List<String> cities;

  factory CitiesResponseModel.fromJson(Map<String, dynamic> json) =>
      CitiesResponseModel(
        cities: List<String>.from(json["cities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities.map((x) => x)),
      };
}
