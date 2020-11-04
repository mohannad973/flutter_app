import 'package:flutter/material.dart';
import 'package:ora_app/Models/endo_products_response.dart';
import 'endo_page_body.dart';
class EndoProductPage extends StatefulWidget {
  EndoProduct endoProduct;

  EndoProductPage({this.endoProduct});

  @override
  _EndoProductPageState createState() => _EndoProductPageState();
}

class _EndoProductPageState extends State<EndoProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EndoPageBody(endoProduct: widget.endoProduct,),
    );
  }
}
