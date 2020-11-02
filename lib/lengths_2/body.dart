import 'package:flutter/material.dart';
import 'package:ora_app/Models/diameters_model.dart';
import 'package:ora_app/Models/dias_info.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Utils/Constants.dart';
import 'package:ora_app/details/components/product_title_with_image.dart';
import 'package:ora_app/lengthes/components/lenghts_list.dart';
import 'package:ora_app/lengthes/components/surgical_list.dart';

class LengthsBody extends StatefulWidget {
  Diameter diameter;
  Cat cat;
  String surgColorCode , prosColorCode;
  double diam;
  List<Length> lengthsList;
  List<SurgicalSeq> surgicalSequenceList;

  LengthsBody({this.diameter, this.cat, this.surgColorCode, this.prosColorCode,
      this.diam, this.lengthsList, this.surgicalSequenceList});

  @override
  _LengthsBodyState createState() => _LengthsBodyState();
}

class _LengthsBodyState extends State<LengthsBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.black87,
            height: size.height * 0.45,
            width: double.infinity,
            child: ProductTitleWithImage(cat: widget.cat,hasColorCode: true,surgColorCode: widget.surgColorCode, prosColorCode: widget.prosColorCode, diamValue: widget.diam ,),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: kTextColor),
                children: [
                  TextSpan(
                    text: "Lengths",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          LenghthsList(
            diameter: widget.diameter,
            cat: widget.cat,
            prosColorCode: widget.prosColorCode,
            surgColorCode: widget.surgColorCode,
            diam: widget.diam,
            lengthsList: widget.lengthsList,
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: kTextColor),
                children: [
                  TextSpan(
                    text: "Surgical Sequence",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          SurgicalList(
            diameter: widget.diameter,
            cat: widget.cat,
            prosColorCode: widget.prosColorCode,
            surgColorCode: widget.surgColorCode,
            diam: widget.diam,
            lengthsList: widget.lengthsList,
            surgicalSequenceList: widget.surgicalSequenceList,
          ),

        ],
      ),
    );
  }
}
