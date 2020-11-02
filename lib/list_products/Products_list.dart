import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ora_app/Utils/Constants.dart';
import 'package:ora_app/list_products/components/body.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();

}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar( context),
      body: Body(),
    );
  }
}




AppBar buildAppBar( context) {
  return AppBar(

    backgroundColor: Theme.of(context).primaryColor,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),

    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
          // By default our  icon color is white
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: SvgPicture.asset(
          "assets/icons/cart.svg",
          // By default our  icon color is white
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      SizedBox(width: kDefaultPaddin / 2)
    ],
  );
}