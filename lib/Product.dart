import 'package:flutter/material.dart';
import 'package:ora_app/Models/ProductsResponse.dart';
import 'package:ora_app/Models/cartModel.dart';
import 'package:ora_app/Providers/Cart_Provider.dart';
import 'package:ora_app/filter.dart';
import 'package:ora_app/modules.dart';
import 'package:ora_app/styles.dart';
import 'package:ora_app/widget/quantity_selector.dart';
import 'package:provider/provider.dart';

import 'Util/session_manager.dart';
import 'bottom_navigation_bar.dart';

class ProductModulPage extends StatefulWidget {
  Product productDetail;
  String subCatName;


  ProductModulPage({this.productDetail,this.subCatName});

  @override
  _ProductModulPageState createState() => _ProductModulPageState();
}

class _ProductModulPageState extends State<ProductModulPage> {
  SessionManager sessionManager = SessionManager();
  CartModel cart = CartModel();

  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 350.0,
              floating: true,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // print('constraints=' + constraints.toString());
                  top = constraints.biggest.height;
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor,
                        ],
                      ),
                    ),
                    child: FlexibleSpaceBar(
                      centerTitle: true,
                      title: top == 100
                          ? Text(
                              widget.productDetail.engName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(

                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(''),
                      titlePadding: EdgeInsets.only(left: 60 , right: 30,bottom: 15),
                      background: Stack(
                        children: [
                          Container(
                            height: 375,
                            decoration: BoxDecoration(
                              color: Colors.white,
//                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20) , bottomLeft:Radius.circular(20), ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 50.0, bottom: 30.0 ),
                              child: Hero(
                                tag: widget.productDetail.id,
                                child: Image(

                                  height: 150,
                                  fit: BoxFit.fill,
                                  image: NetworkImage(

                                      'http://ora.hashtagweb.online' +
                                          widget.productDetail.imageUrl),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5),
                                child: Text(
                                  widget.productDetail.engName,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 2.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    const SizedBox(width: 10.0),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 16.0,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Text(
                                        widget.subCatName,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0, left: 12),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ];
        },
        body: Container(
          margin: EdgeInsets.only(top: 0),
          child: Stack(
            children: [
              SingleChildScrollView(
//                padding: const EdgeInsets.only(top: 0.0, bottom: 10.0),
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(13, 128, 133,0.8),
                            Color.fromRGBO(13, 128, 133,0.8),
                          ],
                        ),
//            border: Border.all(color: Theme.of(context).primaryColor, width: 3),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          widget.productDetail.price.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                        Text(
                                          "/per Unit",
                                          style: TextStyle(
                                              fontSize: 12.0, color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                color: Colors.white,
                                textColor: Theme.of(context).primaryColor,
                                child: Text(
                                  "Purchase",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 20.0,
                                ),
                                onPressed: () {
                                  List<Cart> carts = Provider.of<CartProvider>(context,listen: false).basketCarts;
                                  print("purchase"+Provider.of<CartProvider>(context,listen: false).basketCarts.toString());

                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top : 80),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description".toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14.0),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                           widget.productDetail.descriptionEn,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14.0),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0, right: 20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      Cart cartItem = Cart(id: widget.productDetail.id,imageUrl: widget.productDetail.imageUrl
                      ,engName: widget.productDetail.engName,gerName: widget.productDetail.gerName,quantity: widget.productDetail.quantity,
                      price: widget.productDetail.price,count: 1);

                        Provider.of<CartProvider>(context,listen: false).add(cartItem);

                      CartModel cartModel = CartModel();
                      cartModel.carts=[];
                      cartModel.carts.add(cartItem);
                      print("cartModelToBeAdded"+cartModel.toString());
                      Provider.of<CartProvider>(context,listen: false).saveCart();

                    },
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
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




