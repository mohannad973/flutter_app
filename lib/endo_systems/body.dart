import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class EndoSystemsBody extends StatefulWidget {

  @override
  _EndoSystemsBodyState createState() => _EndoSystemsBodyState();
}

class _EndoSystemsBodyState extends State<EndoSystemsBody> {
  List<String> imagesArray = [] ;
  double currentPage = 0;

  @override
  Widget build(BuildContext context) {
    for (int i = 0 ; i <= 17 ; i ++){
      imagesArray.add('assets/OraES$i.png');
    }
    return SafeArea(
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
                children: imagesArray.map ( (String value) {
                  return Container (
                    child: Image (
                      height: MediaQuery.of(context).size.height * 0.6,
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
          ],
        ),
      ),
    );
  }
}
