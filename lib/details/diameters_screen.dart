import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ora_app/Models/Product.dart';
import 'package:ora_app/Models/ProductsResponse.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Utils/Constants.dart';
import 'package:ora_app/cart/cart_page.dart';
import 'package:ora_app/details/components/body.dart';


class DiametersScreen extends StatelessWidget {

  final Cat cat;

  const DiametersScreen({Key key, this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // each product have a color
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(cat: cat,),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[

        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {    Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(

              ),
            ),
          );},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
