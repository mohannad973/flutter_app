import 'package:flutter/material.dart';

class ProductModul {
  final String name;
  final String subCategory;
  final String price;
  final String image;

  ProductModul({this.name, this.subCategory, this.price , this.image} );
}

class DrawerItems {
  final String name ;
  final Widget icon ;

  DrawerItems({this.name, this.icon});
}
class CartItem {
  final String name ;
  final String image ;
  final String price ;
  final String subCategory;
  int quantity ;
  int selectedItem ;

  CartItem(this.name, this.image, this.price, this.subCategory, this.quantity,
      this.selectedItem);
}



class AddressModul {
  final String country ;
  final String fullName;
  final String addressLine1;
  final String addressLine2;
  final String city ;
  final String state ;
  final String zipCode ;
  final String phoneNumber ;

  AddressModul(this.country, this.fullName, this.addressLine1, this.addressLine2,
      this.city, this.state, this.zipCode, this.phoneNumber);


}