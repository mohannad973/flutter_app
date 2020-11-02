import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ora_app/Util/session_manager.dart';
import 'package:ora_app/Utils/custom_route.dart';
import 'package:ora_app/home_page.dart';
import 'package:ora_app/landingPage/Splash_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}
SessionManager sessionManager = SessionManager();
class _SplashScreen1State extends State<SplashScreen1> {

  _getFirstTime() async{

    Future<bool> firstTime = sessionManager.getFirstTime();
    firstTime.then((data) {
      print("firstTime " + data.toString());
      if(data == null || data ==true){
        sessionManager.setFirstTime(false);
      }else if(data == false){

      }
    },onError: (e) {
      print(e);
    });

    bool isFirst = await firstTime;

    print("firstTimetwo*** " + isFirst.toString());


    //print(categories[0].engName);
  }

  _checkFirstTime()async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    if(sp.getBool("FIRST") == true || sp.getBool("FIRST")== null){
      sp.setBool("FIRST", true);
    }

  }


  @override
  void initState() {
    super.initState();
// _getFirstTime();
  _checkFirstTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/ora_splash.png',fit: BoxFit.fill,),
          ),

          Positioned(
            left: 300,
            right: 0.0,
            bottom:0.0,
            child: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, SlideRightRoute(page: SecondSplash()));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                child: DotsIndicator(
                  dotsCount: 2,
                  position: 0 ,
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
