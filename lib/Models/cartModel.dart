import 'dart:convert';

import 'package:provider/provider.dart';

CartModel cartFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartToJson(CartModel data) => json.encode(data.toJson());

class CartModel  {
  CartModel({
    this.carts,
  });

  List<Cart> carts;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    carts: List<Cart>.from(json["carts"].map((x) => Cart.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "carts": List<dynamic>.from(carts.map((x) => x.toJson())),
  };

  @override
  String toString() {

    return 'CartModel '+ carts.toString();
  }
}

class Cart {
  Cart({
    this.id,
    this.imageUrl,
    this.engName,
    this.gerName,
    this.quantity,
    this.price,
    this.count

  });

  int id;
  String imageUrl;
  String engName;
  String gerName;
  int quantity;
  int price;
  int count;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    imageUrl: json["image_url"],
    engName: json["eng_name"],
    gerName: json["ger_name"],
    quantity: json["quantity"],
    price: json["price"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_url": imageUrl,
    "eng_name": engName,
    "ger_name": gerName,
    "quantity": quantity,
    "price": price,
    "count":count
  };

  @override
  String toString() {
    return 'Cart{id: $id, imageUrl: $imageUrl, engName: $engName, gerName: $gerName, quantity: $quantity, price: $price,count: $count}';
  }
}
