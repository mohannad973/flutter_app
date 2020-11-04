import 'package:flutter/material.dart';
import 'package:ora_app/Models/endo_products_response.dart';
import 'package:ora_app/Utils/app_url.dart';

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.endoProduct.engName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
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
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
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
          )
        ],
      ),
    );
  }
}
