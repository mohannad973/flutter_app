import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ora_app/filter.dart';

Widget homeBar() {
  return Builder(
    builder: (BuildContext context) {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      );
    },
  );
}

Widget barWithBack(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),

  );
}

Widget barWithAdd(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: IconButton(
      icon: Icon(Icons.add, color: Colors.white),
      iconSize: 35,
    ),
  );
}

Widget barWithSearch(BuildContext context){
  return   IconButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Filter(
            )),
      );
    },
    icon: Icon(
      Icons.search,
      color: Colors.white,
    ),
  );
}


Widget topBar(BuildContext context, Widget leading, Widget title,Widget action) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: ClipRRect(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(20) , bottomLeft: Radius.circular(20)),
      child: GradientAppBar(
        title: title ,
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor,
          ],
        ),
        actions: <Widget>[
         action,
        ],
        leading: leading,
      ),
    ),
  );
}
