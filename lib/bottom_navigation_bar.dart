import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:ora_app/cart.dart';
import 'package:ora_app/home_page.dart';
import 'package:ora_app/profile.dart';

import 'app_bar.dart';
import 'cart/cart_page.dart';
import 'drawer.dart';

int _currentIndex = 0;

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}
class _BottomBarState extends State<BottomBar> {
  String token;
  int page = 0;
  final HomePage _homePage = new HomePage();
  final CartPage _cartPage = new CartPage();
  final Profile _profile = new Profile();

  Widget _showPage = HomePage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _homePage;
        break;
      case 1:
        return _cartPage;
        break;
      case 2:
        return _profile;
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerView(),
      appBar: topBar (context , homeBar() , Text ('Ora'),barWithSearch(context)),

      bottomNavigationBar: CurvedNavigationBar(
        index: page,
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.black87,
        items: <Widget>[
          Icon(
            Icons.home,
            color: Colors.white,

          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _showPage=_pageChooser(index);
          });
        },
        height: 55.0,
      ),
      body: Container(

        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
