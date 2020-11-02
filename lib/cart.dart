import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ora_app/My_Addresses.dart';
import 'package:ora_app/app_bar.dart';
import 'package:ora_app/bottom_navigation_bar.dart';
import 'package:ora_app/modules.dart';
import 'cards/cart_card.dart';





List <CartItem> cartArray = [
  CartItem( 'Parallel Implant' ,  'Implants'  ,  '150.30' ,'Implants' ,  14 ,2),
  CartItem( 'Parallel Implant' ,  'Implants'  ,  '150.30' ,'Implants' ,  14 ,2),

];

// ignore: must_be_immutable
class MyCart extends StatefulWidget {


  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {

  deleteItem (int index){
    setState(() {
      cartArray.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar:AppBar(
        //   elevation: 0.0,
        //   title: Text("Cart List"),
        // ),
        // backgroundColor: Colors.white,
        // body:Container(
        //   decoration: BoxDecoration(
        //       border: Border(
        //           top: BorderSide(
        //               color: Colors.grey[300],
        //               width: 1.0
        //           )
        //       )
        //   ),
        //   child: ScopedModelDescendant<AppModel>(
        //     builder: (context,child,model){
        //       return ListView(
        //         shrinkWrap: true,
        //         children: model.cartListing.map((d)=>generateCart(d)).toList(),
        //       );
        //     },
        //   ),
        // )
    );
  }
}

