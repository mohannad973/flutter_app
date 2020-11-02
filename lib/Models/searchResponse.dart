import 'dart:convert';

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  SearchResponse({
    this.products,
  });

  List<searchProduct> products;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
    products: List<searchProduct>.from(json["products"].map((x) => searchProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class searchProduct {
  searchProduct({
    this.id,
    this.userId,
    this.subCategoryId,
    this.imageUrl,
    this.descriptionEn,
    this.descriptionGer,
    this.engName,
    this.gerName,
    this.quantity,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  int subCategoryId;
  String imageUrl;
  String descriptionEn;
  String descriptionGer;
  String engName;
  String gerName;
  int quantity;
  int price;
  DateTime createdAt;
  DateTime updatedAt;

  factory searchProduct.fromJson(Map<String, dynamic> json) => searchProduct(
    id: json["id"],
    userId: json["user_id"],
    subCategoryId: json["subCategory_id"],
    imageUrl: json["image_url"],
    descriptionEn: json["description_en"],
    descriptionGer: json["description_ger"],
    engName: json["eng_name"],
    gerName: json["ger_name"],
    quantity: json["quantity"],
    price: json["price"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "subCategory_id": subCategoryId,
    "image_url": imageUrl,
    "description_en": descriptionEn,
    "description_ger": descriptionGer,
    "eng_name": engName,
    "ger_name": gerName,
    "quantity": quantity,
    "price": price,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}