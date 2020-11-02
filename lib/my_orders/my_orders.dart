import 'package:flutter/material.dart';



import 'body.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: a(context, false , 'MY ORDER' , false),
      body: MyOrdersBody(),
    );
  }
}
