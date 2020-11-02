import 'package:flutter/material.dart';
import 'package:ora_app/app_bar.dart';
import 'package:ora_app/bottom_navigation_bar.dart';
import 'package:ora_app/endo_systems/body.dart';

class EndoSystems extends StatefulWidget {
  @override
  _EndoSystemsState createState() => _EndoSystemsState();
}

class _EndoSystemsState extends State<EndoSystems> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context, barWithBack(context), Text ('Endo Systems'),barWithSearch(context)),
      body: EndoSystemsBody(),
    );
  }
}
