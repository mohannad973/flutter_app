import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ora_app/Models/Product.dart';
import 'package:ora_app/Models/ProductsResponse.dart';
import 'package:ora_app/Models/cartModel.dart';
import 'package:ora_app/Providers/Cart_Provider.dart';
import 'package:ora_app/Utils/Constants.dart';
import 'package:provider/provider.dart';


class AddToCart extends StatefulWidget {
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _showSnackBar(){
    final snackBar = new SnackBar(content: new Text("The Code Has Been Sent"),duration: new Duration(seconds: 3),);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
            ),
            child: GestureDetector(
              onTap: (){

              },
              child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/add_to_cart.svg",
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Cart cartItem = Cart(id: widget.product.id,imageUrl: widget.product.imageUrl
                      ,engName: widget.product.engName,gerName: widget.product.gerName,quantity: widget.product.quantity,
                      price: widget.product.price,count: 1);

                  Provider.of<CartProvider>(context,listen: false).add(cartItem);

                  CartModel cartModel = CartModel();
                  cartModel.carts=[];
                  cartModel.carts.add(cartItem);
                  print("cartModelToBeAdded"+cartModel.toString());
                  Provider.of<CartProvider>(context,listen: false).saveCart();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Product Added To cart"),
                  ));
                },
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Theme.of(context).primaryColor,
                onPressed: () {},
                child: Text(
                  "Buy  Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
