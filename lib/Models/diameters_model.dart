// To parse this JSON data, do
//
//     final diametersResponse = diametersResponseFromJson(jsonString);

import 'dart:convert';

DiametersResponse diametersResponseFromJson(String str) => DiametersResponse.fromJson(json.decode(str));

String diametersResponseToJson(DiametersResponse data) => json.encode(data.toJson());

class DiametersResponse {
  DiametersResponse({
    this.success,
    this.dias,
  });

  bool success;
  Dias dias;

  factory DiametersResponse.fromJson(Map<String, dynamic> json) => DiametersResponse(
    success: json["success"],
    dias: Dias.fromJson(json["dias"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "dias": dias.toJson(),
  };

  @override
  String toString() {
    return 'DiametersResponse{success: $success, dias: $dias}';
  }
}

class Dias {
  Dias({
    this.id,
    this.engName,
    this.gerName,
    this.price,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.diameters,
    this.tray,
  });

  int id;
  String engName;
  String gerName;
  int price;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  List<Diameter> diameters;
  Tray tray;

  factory Dias.fromJson(Map<String, dynamic> json) => Dias(
    id: json["id"],
    engName: json["eng_name"],
    gerName: json["ger_name"],
    price: json["price"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    diameters: List<Diameter>.from(json["diameters"].map((x) => Diameter.fromJson(x))),
    tray: Tray.fromJson(json["tray"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "eng_name": engName,
    "ger_name": gerName,
    "price": price,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "diameters": List<dynamic>.from(diameters.map((x) => x.toJson())),
    "tray": tray.toJson(),
  };

  @override
  String toString() {
    return 'Dias{id: $id, engName: $engName, gerName: $gerName, price: $price, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, diameters: $diameters, tray: $tray}';
  }
}

class Diameter {
  Diameter({
    this.id,
    this.impCatId,
    this.diameter,
  });

  int id;
  int impCatId;
  double diameter;

  factory Diameter.fromJson(Map<String, dynamic> json) => Diameter(
    id: json["id"],
    impCatId: json["imp_cat_id"],
    diameter: json["diameter"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imp_cat_id": impCatId,
    "diameter": diameter,
  };

  @override
  String toString() {
    return 'Diameter{id: $id, impCatId: $impCatId, diameter: $diameter}';
  }
}

class Tray {
  Tray({
    this.id,
    this.impCatId,
    this.image,
  });

  int id;
  int impCatId;
  String image;

  factory Tray.fromJson(Map<String, dynamic> json) => Tray(
    id: json["id"],
    impCatId: json["imp_cat_id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "imp_cat_id": impCatId,
    "image": image,
  };
}