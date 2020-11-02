import 'package:flutter/material.dart';
import 'package:ora_app/details/components/body.dart';
import 'package:ora_app/endo/endo_body.dart';

class EndoHome extends StatefulWidget {
  @override
  _EndoHomeState createState() => _EndoHomeState();
}

class _EndoHomeState extends State<EndoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EndoBody(),

    );
  }
}
