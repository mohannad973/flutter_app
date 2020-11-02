import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ora_app/Utils/custom_route.dart';
import 'package:ora_app/contact_us/contact_us.dart';
import 'package:ora_app/data/data.dart';

import '../bottom_navigation_bar.dart';
import '../home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height -61,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: <Widget>[
              SlideTile2(),
              SlideTile(
                image1: "assets/ora1.png",
                image2: "assets/landing-text.png",
                image3: "assets/1-1.png",
                imageBg: "assets/bg.jpg",
              ),

            ],
          ),
        ),
        bottomSheet: slideIndex != 1
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        controller.animateToPage(1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      splashColor: Colors.blue[50],
                      child: Text(
                        "",
                        style: TextStyle(
                            color: Color(0xFF0074E4),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          for (int i = 0; i < 2; i++)
                            i == slideIndex
                                ? _buildPageIndicator(true)
                                : _buildPageIndicator(false),
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        print("this is slideIndex: $slideIndex");
                        controller.animateToPage(slideIndex + 1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      splashColor: Colors.blue[50],
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              )
            : InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context, SlideRightRoute(page: BottomBar()));
                },
                child: Container(
                  height: Platform.isIOS ? 70 : 60,
                  color: Theme.of(context).primaryColor,
                  alignment: Alignment.center,
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String image1, image2, image3, imageBg;

  SlideTile({this.image1, this.image2, this.image3, this.imageBg});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  imageBg,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          image1,
                        ),
                        width: 150,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Flexible(
                      flex: 1,
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            image2,
                          ),
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5,
                          alignment: Alignment.center,
                          child: Image.asset(
                            image3,
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.5,
                            fit: BoxFit.fill,
                          )),
                    ),
                  )
                ],
              )
            ],
          )
          // padding: EdgeInsets.symmetric(horizontal: 20),

          ),
    );
  }
}

class SlideTile2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Color.fromRGBO(54, 122, 125,0.9),
                Color.fromRGBO(57, 125, 128,0.9),
                Color.fromRGBO(85, 153, 156,0.99),
                Color.fromRGBO(103, 173, 175,0.9),
              ],
            ),
          ),
          height: MediaQuery.of(context).size.height,

          // padding: EdgeInsets.symmetric(horizontal: 20),

          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  "assets/b2.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fill,
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100,),
                  Flexible(
                    flex: 3,
                    child: Center(
                      child: Container(


                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/Untitled-2 (1).png",
                         height: 257,
                          width: 141,
                          color: Colors.white,
                          fit: BoxFit.fill,
                        ),
                        width: 505,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/oraText.png",
                        ),
                        width: 505,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}



class SlideTile1 extends StatelessWidget {
  String image1, image2, image3, imageBg;

  SlideTile1({this.image1, this.image2, this.image3, this.imageBg});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  imageBg,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          image1,
                        ),
                        width: 150,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Flexible(
                      flex: 1,
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            image2,
                          ),
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                    ),
                  ),

                ],
              )
            ],
          )
        // padding: EdgeInsets.symmetric(horizontal: 20),

      ),
    );
  }
}