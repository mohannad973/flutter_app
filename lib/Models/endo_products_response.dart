// To parse this JSON data, do
//
//     final endoProductResponse = endoProductResponseFromJson(jsonString);

import 'dart:convert';

EndoProductResponse endoProductResponseFromJson(String str) => EndoProductResponse.fromJson(json.decode(str));

String endoProductResponseToJson(EndoProductResponse data) => json.encode(data.toJson());

class EndoProductResponse {
  EndoProductResponse({
    this.success,
    this.endoProducts,
  });

  bool success;
  List<EndoProduct> endoProducts;

  factory EndoProductResponse.fromJson(Map<String, dynamic> json) => EndoProductResponse(
    success: json["success"],
    endoProducts: List<EndoProduct>.from(json["products"].map((x) => EndoProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "products": List<dynamic>.from(endoProducts.map((x) => x.toJson())),
  };
}

class EndoProduct {
  EndoProduct({
    this.id,
    this.endCatId,
    this.engName,
    this.gerName,
    this.image,
    this.price,
    this.engDescription,
    this.gerDescription,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int endCatId;
  String engName;
  String gerName;
  String image;
  int price;
  String engDescription;
  String gerDescription;
  DateTime createdAt;
  DateTime updatedAt;

  factory EndoProduct.fromJson(Map<String, dynamic> json) => EndoProduct(
    id: json["id"],
    endCatId: json["end_cat_id"],
    engName: json["eng_name"],
    gerName: json["ger_name"],
    image: json["image"],
    price: json["price"],
    engDescription: json["eng_description"],
    gerDescription: json["ger_description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "end_cat_id": endCatId,
    "eng_name": engName,
    "ger_name": gerName,
    "image": image,
    "price": price,
    "eng_description": engDescription,
    "ger_description": gerDescription,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
