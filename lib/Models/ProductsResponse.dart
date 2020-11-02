import 'dart:convert';

ProductsResponse productsResponseFromJson(String str) => ProductsResponse.fromJson(json.decode(str));

String productsResponseToJson(ProductsResponse data) => json.encode(data.toJson());

class ProductsResponse {
  ProductsResponse({
    this.products,
  });

  List<Product> products;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) => ProductsResponse(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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

List<Product> productList = [
  Product(
      id: 1,
      engName: "parallel implant",
      descriptionEn: dummyText,
      imageUrl: "assets/images/tetanium.png",
      price: 350,
      quantity: 5),
  Product(
      id: 2,
      engName: "parallel implant",
      descriptionEn: dummyText,
      imageUrl: "assets/images/tetanium.png",
      price: 350,
      quantity: 5),
  Product(
      id: 3,
      engName: "parallel implant",
      descriptionEn: dummyText,
      imageUrl: "assets/images/tetanium.png",
      price: 350,
      quantity: 5),
  Product(
      id: 4,
      engName: "parallel implant",
      descriptionEn: dummyText,
      imageUrl: "assets/images/tetanium.png",
      price: 350,
      quantity: 5),
  Product(
      id: 5,
      engName: "parallel implant",
      descriptionEn: dummyText,
      imageUrl: "assets/images/tetanium.png",
      price: 350,
      quantity: 5),
  Product(
    id: 6,
    engName: "parallel implant",
    descriptionEn: dummyText,
    imageUrl: "assets/images/tetanium.png",
    price: 350,
    quantity: 5

  ),
];

String dummyText =
    "Despite improvements in dental care, millions of Americans suffer tooth loss -- mostly due to tooth decay, periodontal disease, or injury. For many years, the only treatment options available for people with missing teeth were bridges and dentures , Dental implants look and feel like your own teeth. And because they are designed to fuse with bone, they become permanent.";

