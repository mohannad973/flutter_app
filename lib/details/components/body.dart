import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ora_app/Models/Product.dart';
import 'package:ora_app/Models/ProductsResponse.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Utils/Constants.dart';
import 'package:ora_app/details/components/diameter_list.dart';

import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final Cat cat;

  const Body({Key key, this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: size.height,
        child: ListView(
          physics:  NeverScrollableScrollPhysics(),
         shrinkWrap: true,
          primary: false,

         // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.black87,
              height: size.height * 0.45,
              width: double.infinity,
              child: ProductTitleWithImage(cat: cat,hasColorCode: false,),
            ),
            // SizedBox(height: kDefaultPaddin / 2),
            Container(
              height: MediaQuery.of(context).size.height*0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                physics:  NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,

                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: kTextColor),
                              children: [
                                TextSpan(
                                  text: "Diameters",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: kDefaultPaddin),
                  //Description(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: DiameterList(
                        cat: cat,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            // SizedBox(height: kDefaultPaddin / 2),
            // CounterWithFavBtn(),
            // SizedBox(height: kDefaultPaddin / 2),
            // AddToCart(product: product)
          ],
        ),
      ),
    );
  }
}
