import 'package:flutter/material.dart';
import 'package:ora_app/Models/endo_products_response.dart';
import 'package:ora_app/Providers/endo_products_provider.dart';
import 'package:ora_app/endo/endo_item_card.dart';
import 'package:ora_app/endo/endo_page/endo_product_page.dart';
import 'package:provider/provider.dart';

class EndoItemList extends StatelessWidget {
  List<EndoProduct> endoProductList;

  EndoItemList({this.endoProductList});

  @override
  Widget build(BuildContext context) {
    List<EndoProduct> endoProducts = Provider.of<EndoProductsProvider>(context,listen: false).endoProducts;
    return Container(
      color: Colors.white,
      child: GridView.builder(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0, mainAxisSpacing: 0, crossAxisCount: 2),
        itemCount: endoProducts.length,
        itemBuilder: (context, index) =>
            EndoItemCard(
              image: endoProducts[index].image,
              name:endoProducts[index].engName,
              desc: endoProducts[index].engDescription,
              endoProduct: endoProducts[index],
              press: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)=> EndoProductPage(endoProduct: endoProducts[index],)));

              },
            ),
      ),
    );
  }
}
