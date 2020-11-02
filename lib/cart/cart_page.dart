import 'package:flutter/material.dart';
import 'package:ora_app/Providers/Cart_Provider.dart';
import 'package:ora_app/Utils/Constants.dart';
import 'package:ora_app/Utils/custom_route.dart';
import 'package:provider/provider.dart';
import '../app_bar.dart';
import '../bottom_navigation_bar.dart';
import '../proceed_payment.dart';
import 'appbar_cart.dart';
import 'cart_bg.dart';
import 'cart_item_detail.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {


  deleteItem(int index) {

    setState(() {
      Provider.of<CartProvider>(context,listen: false).removeAtIndex(index);
    });

  }

  _getCartFromCash() async{
    await Provider.of<CartProvider>(context,listen: false).getCart();
  }

  @override
  void initState()  {
    super.initState();

     _getCartFromCash();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(),

      backgroundColor: Color.fromRGBO(220, 220, 220, 1.0),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      height: 470,
                      width: screenWidth.width * 1.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0),
                                spreadRadius: 1,
                                blurRadius: 8)
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Cart Items',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.shopping_cart,
                                  color: Colors.black,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Divider(
                                thickness: 2,
                              )),
                          Expanded(
                            child: ListView.builder(
                              itemCount: Provider.of<CartProvider>(context).count,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: CartItemDetail(
                                        cartItem: Provider.of<CartProvider>(context)
                                            .basketCarts[index],
                                        detectListItem: () => deleteItem(index),
                                      ),


                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 20,right: 20),
                                        child: Divider(
                                          thickness:2,
                                        )
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5,right: 5,left: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          child: Center(child: Text("Total : "+Provider.of<CartProvider>(context).totalPrice.toString()+" \$",style: TextStyle(fontSize: 20,color: Colors.black),)),
                          color: Colors.white,
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.45,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, SlideRightRoute(page: ProceedPayment()));
                          },
                          child: Container(
                            child: Center(child: Text("Check Out",style: TextStyle(fontSize: 20,color: Colors.white),)),
                            color: Theme.of(context).primaryColor.withOpacity(0.7),
                            height: 50,
                            width: MediaQuery.of(context).size.width*0.48,
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
