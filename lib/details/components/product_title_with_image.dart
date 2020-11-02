import 'package:flutter/material.dart';
import 'package:ora_app/Models/Product.dart';
import 'package:ora_app/Models/ProductsResponse.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Providers/dias_info_provider.dart';
import 'package:ora_app/Utils/Constants.dart';
import 'package:ora_app/Utils/app_url.dart';
import 'package:provider/provider.dart';

class ProductTitleWithImage extends StatelessWidget {
  // const ProductTitleWithImage({
  //   Key key,
  //   @required this.cat,
  //   this.hasColorCode
  // }) : super(key: key);

  ProductTitleWithImage(
      {this.cat, this.hasColorCode, this.prosColorCode, this.surgColorCode, this.diamValue});

  final Cat cat;
  bool hasColorCode = false;
  String prosColorCode, surgColorCode;
  double diamValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: "${cat.id}",
                  child: Container(
                    width: 100,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.2,
                    child: Image.network(AppUrl.imageUrl + cat.image),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cat.engName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          hasColorCode
              ? Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffffffff)),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "3.25",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:hexToColor(surgColorCode)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "surgical color code ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1.0,
                        width: 130.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 4,),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: hexToColor(
                                  prosColorCode)),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Prosthetic Color Code ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
              : Container()
        ],
      ),
    );
  }
}

Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
  return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
}
