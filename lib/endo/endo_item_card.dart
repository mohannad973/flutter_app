import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ora_app/Models/endo_products_response.dart';
import 'package:ora_app/Utils/app_url.dart';


class EndoItemCard extends StatelessWidget {
  final String name, desc, image;
  final Function press;
  final EndoProduct endoProduct;
  const EndoItemCard({
    Key key,
    this.name,
    this.desc,
    this.image,
    this.press,
    this.endoProduct
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("endo image "+image);
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 0, top: 10, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Stack(
              children: [
                Container(
                  width: 175,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      FadeInImage.assetNetwork(
                        placeholder: 'assets/loading.gif',
                        image:  AppUrl.imageUrl+image,
                        width: 175,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      )
                      // Image.network(
                      //   AppUrl.imageUrl+image,
                      //   width: 175,
                      //   height: 200,
                      //   fit: BoxFit.fitHeight,
                      // ),
                    ),
                  ),
                ),
                Container(
                  width: 175,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black26.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: 175,
                  height: 200,
                  child: Center(
                    child: Text(
                      name,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
