// To parse this JSON data, do
//
//     final countryResponse = countryResponseFromJson(jsonString);

import 'dart:convert';

CountryResponse countryResponseFromJson(String str) => CountryResponse.fromJson(json.decode(str));

String countryResponseToJson(CountryResponse data) => json.encode(data.toJson());

class CountryResponse {
  CountryResponse({
    this.countries,
  });

  List<Map<String, Country>> countries;

  factory CountryResponse.fromJson(Map<String, dynamic> json) => CountryResponse(
    countries: List<Map<String, Country>>.from(json["countries"].map((x) => Map.from(x).map((k, v) => MapEntry<String, Country>(k, Country.fromJson(v))))),
  );

  Map<String, dynamic> toJson() => {
    "countries": List<dynamic>.from(countries.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
  };

  @override
  String toString() {
    return 'CountryResponse{countries: $countries}';
  }
}

class Country {
  Country({
    this.common,
    this.official,
  });

  String common;
  String official;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    common: json["common"],
    official: json["official"],
  );

  Map<String, dynamic> toJson() => {
    "common": common,
    "official": official,
  };

  @override
  String toString() {
    return 'Country{common: $common, official: $official}';
  }
}
