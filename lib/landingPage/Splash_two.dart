import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ora_app/Utils/custom_route.dart';
import 'package:ora_app/home_page.dart';


class SecondSplash extends StatefulWidget {
  @override
  _SecondSplashState createState() => _SecondSplashState();
}

class _SecondSplashState extends State<SecondSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children:<Widget> [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/splash.png',fit: BoxFit.fill,),
          ),
          Positioned(
            left: 300,
            right: 0.0,
            bottom:0.0,
            child: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, SlideRightRoute(page: HomePage()));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                child: DotsIndicator(
                  dotsCount: 2,
                  position: 1 ,
                  decorator: DotsDecorator (
                    activeColor: Color(0xFF1A5E61),
                    size: Size.square(5.0),
                    activeSize: Size.square(10.0),
                    color: Color(0xFFC4C4C4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
