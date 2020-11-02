import 'package:flutter/material.dart';
import 'package:ora_app/Models/Product.dart';
import 'package:ora_app/Models/ProductsResponse.dart';
import 'package:ora_app/Utils/Constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(

              color: Colors.white,
              height: 130,
              width: (MediaQuery.of(context).size.width/2)-20,
              child: Stack (
                children: [
                  Hero(
                    tag: "${product.id}",
                    child: Image.asset(product.imageUrl,
                    width: (MediaQuery.of(context).size.width/2)-20,
                    height: 130,),
                  ),
                  Positioned(
                    bottom:0,
                    left: 0,
                    child: Container(
                      height: 30,
                      width:( MediaQuery.of(context).size.width / 3.5 ),
                      decoration: BoxDecoration (
                        color: Theme.of(context).primaryColor,
                        borderRadius : BorderRadius.only(topRight: Radius.circular(16),bottomLeft: Radius.circular(16))
                      ),
                      child: Center(
                        child: Text(
// products is out demo list
                          product.engName,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top:0,
                    right: 0,
                    child: Container(
                      height: 20,
                      width:( MediaQuery.of(context).size.width / 7 ),
                      decoration: BoxDecoration (
                          color: Theme.of(context).primaryColor,
                          borderRadius : BorderRadius.only(topRight: Radius.circular(16),bottomLeft: Radius.circular(16))
                      ),
                      child: Center(
                        child: Text(
// products is out demo list
                          product.price.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
      );
  }
 }


// Positioned(
// bottom:0,
// left: 0,
// child: Text(
// // products is out demo list
// product.engName,
// style: TextStyle(color: kTextLightColor),
// ),
// ),
