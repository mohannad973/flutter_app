import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ora_app/app_bar.dart';
import 'package:ora_app/bottom_navigation_bar.dart';
import 'dart:math';

class Catalogue extends StatefulWidget {
  @override
  _CatalogueState createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  List<String> catalogueImages = [];
  double currentPage = 0;

  @override
  Widget build(BuildContext context) {
//    catalogueImages.clear();
    for (int i = 1 ; i <= 36 ; i ++){
      catalogueImages.add('assets/ORA Catalogue-$i.png');
    }
    return Scaffold(
      appBar: topBar(context, barWithBack(context), Text ('Catalogue'),barWithSearch(context)),

      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView (
                  controller: new PageController(
                    initialPage: 0
                  ),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int page){
                    setState(() {
                      currentPage = page.toDouble();
                    });
                  },
                  children: catalogueImages.map ( (String value) {
                    return Container (
                      child: Image (
                        height: 200,
                        image: AssetImage(value),
                      ),
                    );
                }).toList(),
                ),
              ),
              Center(child: Text (currentPage.toInt().toString())),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                child: DotsIndicator(
                  dotsCount: 10,
                position: currentPage.remainder(10) ,
                  decorator: DotsDecorator (
                    activeColor: Theme.of(context).primaryColor,
                    size: Size.square(5.0),
                    activeSize: Size.square(10.0),
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom : 10.0),
                child: FlatButton (
                  onPressed: (){},
                  child: Text ('Download Pdf',
                  style: TextStyle (
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
