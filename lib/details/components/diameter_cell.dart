import 'package:flutter/material.dart';
import 'package:ora_app/Models/diameters_model.dart';
import 'package:ora_app/Models/implant_response.dart';

class DiameterCell extends StatelessWidget {
  Diameter diameter;

  DiameterCell({this.diameter});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: Text(
          diameter.diameter.toString(),
          textScaleFactor: 2,
          style: TextStyle(color: Colors.black),
        ),
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border(
          right:  BorderSide(
            color: Colors.black87,
            width: 3,
          ),
          top: BorderSide(
            color: Colors.black87,
            width: 3,
          ),
          bottom: BorderSide(
            color: Colors.black87,
            width: 3,
          ) ,
          left: BorderSide(
            color: Colors.black87,
            width: 3,
          ),
        ),
      ),
      height: 50,
      width: 50,
    );
  }
}
