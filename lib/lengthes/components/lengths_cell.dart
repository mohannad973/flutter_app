import 'package:flutter/material.dart';
import 'package:ora_app/Models/cartModel.dart';
import 'package:ora_app/Models/diameters_model.dart';
import 'package:ora_app/Models/dias_info.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Providers/Cart_Provider.dart';
import 'package:provider/provider.dart';

class LengthsCell extends StatelessWidget {
  Length length;
  Cat cat;

  LengthsCell({this.length,this.cat});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Center(
            child: Text(
              length.length.toString(),
              textScaleFactor: 2,
              style: TextStyle(color: Colors.black),
            ),
          ),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            border: Border(
              right:  BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
              top: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
              bottom: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ) ,
              left: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
            ),
          ),
          height: 100,
          width: 150,
        ),
        Positioned(
          bottom:4,
          left: 0,
          child: Container(
            height: 30,
            width:150,
            decoration: BoxDecoration (
                color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10,),bottomRight: Radius.circular(10))

            ),
            child: InkWell(
              onTap: (){
                Cart cartItem = Cart(id: length.id,imageUrl: cat.image
                    ,engName: cat.engName,gerName: cat.gerName,quantity: 1,
                    price:cat.price,count: 1);

                Provider.of<CartProvider>(context,listen: false).add(cartItem);

                CartModel cartModel = CartModel();
                cartModel.carts=[];
                cartModel.carts.add(cartItem);
                print("cartModelToBeAdded"+cartModel.toString());
                Provider.of<CartProvider>(context,listen: false).saveCart();

                Scaffold.of(context).showSnackBar(SnackBar(content: Text('Added To Cart'),));

              },
              child: Center(
                child: Row(

                  children: [

                    Text(
                     " add to cart",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.add_shopping_cart,color: Colors.white,size: 20),
                  ],
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}

//
// Container(
//
//
// child: Center(
// child: Text(
// length.length.toString(),
// textScaleFactor: 2,
// style: TextStyle(color: Colors.black),
// ),
// ),
//
// decoration: BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(10)),
// color: Colors.white,
// border: Border(
// right:  BorderSide(
// color: Theme.of(context).primaryColor,
// width: 3,
// ),
// top: BorderSide(
// color: Theme.of(context).primaryColor,
// width: 3,
// ),
// bottom: BorderSide(
// color: Theme.of(context).primaryColor,
// width: 3,
// ) ,
// left: BorderSide(
// color: Theme.of(context).primaryColor,
// width: 3,
// ),
// ),
// ),
// height: 100,
// width: 100,
// ),
// Positioned(
// bottom: 0,
// child: Container(
// decoration:BoxDecoration(
//
// borderRadius: BorderRadius.all(Radius.circular(10)),
// ),
// height: 20,
// width: 20,
//
// ),
// )