import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_svg/svg.dart';

import '../app_bar.dart';

class EventDetail extends StatefulWidget {
  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousal = new Container(
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [

          Image.asset(
            'assets/event1.jpg',
            height: MediaQuery.of(context).size.height * 0.45,
            fit: BoxFit.fill,
          ),
          Image.asset(
            'assets/event2.jpg',
            height: MediaQuery.of(context).size.height * 0.45,
            fit: BoxFit.fill,
          ),
          Image.asset(
            'assets/event3.jpg',
            height: MediaQuery.of(context).size.height * 0.45,
            fit: BoxFit.fill,
          ),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotBgColor: Colors.transparent,
        dotColor: Theme.of(context).primaryColor,
        dotIncreasedColor: Colors.blueGrey,
        showIndicator: false,
      ),
      height: MediaQuery.of(context).size.height * 0.5,
    );

    return Scaffold(
        body: Stack(
      children: <Widget>[

        ListView(
          children: <Widget>[image_carousal],
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(top:25.0,left: 0),
            child: Container(

              color: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: new BoxDecoration(
                color: Color(0xFF599DA0),
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(15.0),
                  topRight: const Radius.circular(15.0),
                )),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Event Name",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "15/10/2020",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white60,
                    indent: 35,
                    endIndent: 35,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 30, bottom: 5),
                        child: Text(
                          "Event Details",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, right: 30, left: 30, bottom: 30),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley,",
                      style: TextStyle(color: Colors.white, height: 1.5),
                    ),
                  ),
                  Divider(
                    color: Colors.white60,
                    indent: 35,
                    endIndent: 35,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 30, bottom: 5),
                        child: Text(
                          "Location",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, right: 30, left: 30, bottom: 30),
                    child: Text(
                      " Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley,",
                      style: TextStyle(color: Colors.white, height: 1.5),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
