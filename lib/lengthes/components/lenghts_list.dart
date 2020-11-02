import 'package:flutter/material.dart';
import 'package:ora_app/Models/diameters_model.dart';
import 'package:ora_app/Models/dias_info.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Providers/diameters_provider.dart';
import 'package:ora_app/Providers/dias_info_provider.dart';
import 'package:ora_app/details/components/diameter_cell.dart';
import 'package:ora_app/lengthes/components/lengths_cell.dart';
import 'package:ora_app/lengthes/lengthes_screen.dart';
import 'package:provider/provider.dart';

class LenghthsList extends StatefulWidget {
  Cat cat;
  Diameter diameter ;
  Function diameterCallBack;
  String surgColorCode , prosColorCode;
  double diam;
  List<Length> lengthsList;
  LenghthsList({this.cat,this.diameter,this.diameterCallBack,this.diam,this.prosColorCode,this.surgColorCode,this.lengthsList});

  @override
  _LenghthsListState createState() => _LenghthsListState();
}

class _LenghthsListState extends State<LenghthsList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return   GridView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
      itemCount: widget.lengthsList.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child:

          LengthsCell(
            length: widget.lengthsList[i],
            cat: widget.cat,

          ),
        );
      },
    );
  }
}



// return FutureBuilder(
// future: Provider.of<DiasInfoProvider>(context, listen: false)
// .getDiasInfo(widget.diameter.id),
// builder: (BuildContext context, AsyncSnapshot snapshot) {
// if (snapshot.connectionState == ConnectionState.done) {
// if (snapshot.hasError) {
// return Container(
// child: Text('something went wrong'),
// );
// }
// lengths = snapshot.data.dia.lengths;
// diameter = snapshot.data.dia.diameter;
// surgColorCode = snapshot.data.dia.surgicalColorCode;
// prosthColorCode = snapshot.data.dia.prostheticColorCode;
// widget.diameterCallBack(diameter,surgColorCode,prosthColorCode);
//
// return Container(
// height: MediaQuery.of(context).size.height * 0.4,
// child: GridView.builder(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 3),
// itemCount: lengths.length,
// itemBuilder: (context, i) {
// return Padding(
// padding: const EdgeInsets.all(8.0),
// child:
//
// LengthsCell(
// length: lengths[i],
// cat: widget.cat,
//
// ),
// );
// },
// ),
// );
// } else {
// return Center(
// child: CircularProgressIndicator(
// backgroundColor: Colors.teal,
// ),
// );
// }
// },
// );