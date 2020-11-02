import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ora_app/Models/Product.dart';
import 'package:ora_app/Models/ProductsResponse.dart';
import 'package:ora_app/Models/diameters_model.dart';
import 'package:ora_app/Models/dias_info.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Providers/dias_info_provider.dart';
import 'package:ora_app/Utils/Constants.dart';
import 'package:ora_app/cart/cart_page.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';



class LengthesScreen extends StatelessWidget {

  final Cat cat;
  final Diameter diameter;

  const LengthesScreen({Key key, this.cat,this.diameter}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<Length> lengths = [];
    List<SurgicalSeq> surgicalSequenceList=[];
    double diameterValue;
    String surgColorCode;
    String prosthColorCode;
    return Scaffold(

      // each product have a color
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: FutureBuilder(
        future: Provider.of<DiasInfoProvider>(context, listen: false)
            .getDiasInfo(diameter.id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Container(
                child: Text('something went wrong'),
              );
            }
            lengths = snapshot.data.dia.lengths;
            diameterValue = snapshot.data.dia.diameter;
            surgColorCode = snapshot.data.dia.surgicalColorCode;
            prosthColorCode = snapshot.data.dia.prostheticColorCode;
            surgicalSequenceList = snapshot.data.dia.surgicalSeq;


            return Body(diameter: diameter, cat: cat,diam: diameterValue,prosColorCode: prosthColorCode, surgColorCode: surgColorCode,lengthsList: lengths,surgicalSequenceList: surgicalSequenceList,);
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black87,
              ),
            );
          }
        },
      )
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[

        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(

              ),
            ),
          );},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
