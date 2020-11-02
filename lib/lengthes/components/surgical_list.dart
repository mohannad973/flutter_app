import 'package:flutter/material.dart';
import 'package:ora_app/Models/diameters_model.dart';
import 'package:ora_app/Models/dias_info.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/lengthes/components/surgical_sequence_item.dart';

class SurgicalList extends StatefulWidget {
  Cat cat;
  Diameter diameter;

  Function diameterCallBack;
  String surgColorCode, prosColorCode;
  double diam;
  List<Length> lengthsList;
  List<SurgicalSeq> surgicalSequenceList;

  SurgicalList(
      {this.cat,
      this.diameter,
      this.diameterCallBack,
      this.surgColorCode,
      this.prosColorCode,
      this.diam,
      this.lengthsList,
      this.surgicalSequenceList});

  @override
  _SurgicalListState createState() => _SurgicalListState();
}

class _SurgicalListState extends State<SurgicalList> {
  @override
  Widget build(BuildContext context) {
    return   GridView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 0,
        childAspectRatio: 0.5,),
      itemCount: widget.surgicalSequenceList.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child:

          SurgicalSequenceItem(
            surgicalSeq: widget.surgicalSequenceList[i],

          ),
        );
      },
    );
  }
}
