import 'package:flutter/material.dart';
import 'package:ora_app/Models/Product.dart';
import 'package:ora_app/Models/ProductsResponse.dart';
import 'package:ora_app/Utils/Constants.dart';
import 'package:ora_app/details/diameters_screen.dart';


import '../../Product.dart';
import '../../Product.dart';
import '../../Product.dart';
import 'categorries.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) => ItemCard(

                      product: productList[index],
                      // press: () => Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => DiametersScreen(
                      //         product: Product(
                      //             id: productList[index].id,
                      //             price:
                      //             productList[index].price,
                      //             imageUrl: productList[index].imageUrl,
                      //             engName:
                      //             productList[index].engName,
                      //             descriptionEn: productList[index].descriptionEn,
                      //             quantity: productList[index].quantity),
                      //
                      //       ),
                      //     )),
                    )),
          ),
        ),
      ],
    );
  }
}
