import 'package:flutter/material.dart';
import 'package:ora_app/Models/cartModel.dart';
import 'package:ora_app/Models/endo_products_response.dart';
import 'package:ora_app/Providers/Cart_Provider.dart';
import 'package:ora_app/Utils/app_url.dart';
import 'package:provider/provider.dart';

class EndoPageBody extends StatefulWidget {
  EndoProduct endoProduct;

  EndoPageBody({this.endoProduct});

  @override
  _EndoPageBodyState createState() => _EndoPageBodyState();
}

class _EndoPageBodyState extends State<EndoPageBody> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: size.height * 0.4,
              width: size.width,
              color: Colors.black54,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        ExactAssetImage("assets/photo5843754424906921069.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  child: Image.network(
                    AppUrl.imageUrl + widget.endoProduct.image,
                  ),
                ),
              )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.endoProduct.engName,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\$' + widget.endoProduct.price.toString(),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                widget.endoProduct.engDescription +
                    " Lorem Ipsum is simply dummy text of therem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printin.",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Cart cartItem = Cart(
                    id: widget.endoProduct.id,
                    imageUrl: widget.endoProduct.image,
                    engName: widget.endoProduct.engName,
                    gerName: widget.endoProduct.gerName,
                    price: widget.endoProduct.price,
                    count: 1);

                Provider.of<CartProvider>(context, listen: false).add(cartItem);

                CartModel cartModel = CartModel();
                cartModel.carts = [];
                cartModel.carts.add(cartItem);

                Provider.of<CartProvider>(context, listen: false).saveCart();
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Product Added To cart"),
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                // color: Colors.black,
                width: size.width * 0.6,
                height: 40,
                margin: EdgeInsets.only(bottom: 20),
                child: Center(
                    child: Text(
                  "Add To Cart",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
