import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';


import 'body.dart';

class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white54.withOpacity(0.9),
      appBar:  GradientAppBar(
        title: Text(
          'Track ordre',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w500,
            fontSize: 22.0,
          ),
        ),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor,
          ],
        ),

        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: TrackOrderBody(),
    );
  }
}
