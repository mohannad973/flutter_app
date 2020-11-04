import 'package:flutter/material.dart';
import 'package:ora_app/Models/endo_category_response.dart';
import 'package:ora_app/Providers/endo_cats_provider.dart';
import 'package:ora_app/Providers/endo_products_provider.dart';
import 'package:ora_app/endo/endo_list.dart';
import 'package:provider/provider.dart';

import 'category_item.dart';

class EndoBody extends StatefulWidget {
  List<String> cats = [
    "endo 1",
    "endo 2",
    "endo 3",
    "endo 2",
    "endo 3",
    "endo 2",
    "endo 3",
    "endo 2",
    "endo 3"
  ];
  int selectedIndex = 0;

  @override
  _EndoBodyState createState() => _EndoBodyState();
}

class _EndoBodyState extends State<EndoBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<EndoProductsProvider>(context, listen: false)
        .getEndoProducts(widget.selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    List<EndoCat> categories =
        Provider.of<EndoCatsProvider>(context, listen: false).endoCats;
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Center(
            child: Container(
              width: size.width * 0.9,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1),
                        spreadRadius: 2.0,
                        blurRadius: 1.0,
                        color: Colors.grey.withOpacity(0.4)),
                  ]),
              child: Center(
                  child: Text(
                "ENDO SYSTEM",
                style: TextStyle(fontSize: 20),
              )),
            ),
          ),
          Container(
              width: size.width,
              height: 100,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Input Text. The text language must match the selected voice language: Mixing language (English text with a Spanish male voice) does not produce valid results."),
              ))),
          Container(
            height: 39,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => CategoryItem(
                title: categories[index].engName,
                selectedIndex: widget.selectedIndex,
                index: index,
                press: () {
                  setState(() {
                    widget.selectedIndex = index;
                    Provider.of<EndoProductsProvider>(context, listen: false)
                        .getEndoProducts(widget.selectedIndex);

                  });
                },
              ),
            ),
          ),
          EndoItemList(endoProductList: Provider.of<EndoProductsProvider>(context).endoProducts,),
        ],
      ),
    );
  }
}
