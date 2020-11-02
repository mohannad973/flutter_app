import 'package:flutter/material.dart';
import 'package:ora_app/Models/diameters_model.dart';
import 'package:ora_app/Models/dias_info.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Providers/dias_info_provider.dart';
import 'package:ora_app/Utils/Constants.dart';
import 'package:ora_app/Utils/app_url.dart';
import 'package:ora_app/details/components/product_title_with_image.dart';

import 'package:ora_app/lengthes/components/lenghts_list.dart';
import 'package:ora_app/lengthes/components/surgical_list.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  Diameter diameter;
  Cat cat;
  String surgColorCode , prosColorCode;
  double diam;
  List<Length> lengthsList;
  List<SurgicalSeq> surgicalSequenceList;

  Body({this.diameter,this.cat,this.prosColorCode,this.surgColorCode,this.diam,this.lengthsList,this.surgicalSequenceList});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  SingleChildScrollView(
      child: SizedBox(
        height: size.height,

        child: ListView(
          shrinkWrap: true,

          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
           Container(
              color: Colors.black87,
              height: size.height * 0.45,
              width: double.infinity,
              child: ProductTitleWithImage(cat: widget.cat,hasColorCode: true,surgColorCode: widget.surgColorCode, prosColorCode: widget.prosColorCode, diamValue: widget.diam ,),
            ),
            // SizedBox(height: kDefaultPaddin / 2),
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
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
                      ),
                    ],
                  ),
                  SizedBox(height: kDefaultPaddin),
                  //Description(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: LenghthsList(
                        diameter: widget.diameter,
                        cat: widget.cat,
                        prosColorCode: widget.prosColorCode,
                        surgColorCode: widget.surgColorCode,
                        diam: widget.diam,
                        lengthsList: widget.lengthsList,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
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
                      ),
                    ],
                  ),
                  SizedBox(height: kDefaultPaddin),
                  //Description(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: SurgicalList(
                        diameter: widget.diameter,
                        cat: widget.cat,
                        prosColorCode: widget.prosColorCode,
                        surgColorCode: widget.surgColorCode,
                        diam: widget.diam,
                        lengthsList: widget.lengthsList,
                        surgicalSequenceList: widget.surgicalSequenceList,
                      ),
                    ),
                  ),

                ],
              ),
            ),

            // SizedBox(height: kDefaultPaddin / 2),
            // CounterWithFavBtn(),
            // SizedBox(height: kDefaultPaddin / 2),
            // AddToCart(product: product)
          ],
        ),
      ),
    );
  }
}
// Expanded(
// child: Center(
// child: Container(
// width: 200,
// height: 200,
// child: Image.network(AppUrl.imageUrl+widget.cat.image),
// ),
// ),
// ),










//
//
//
//
//
// Size size = MediaQuery.of(context).size;
// return SingleChildScrollView(
// child: Column(
// mainAxisSize: MainAxisSize.max,
// children: [
// Container(
// // margin: EdgeInsets.only(top: size.height ),
// // padding: EdgeInsets.only(
// //   top: size.height * 0.03,
// //   left: kDefaultPaddin,
// //   right: kDefaultPaddin,
// // ),
// height: MediaQuery.of(context).size.height,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// // topLeft: Radius.circular(24),
// // topRight: Radius.circular(24),
// ),
// ),
// child: Column(
// mainAxisSize: MainAxisSize.max,
// children: <Widget>[
// // SizedBox(height: kDefaultPaddin / 2),
// Container(
//
// color: Colors.black87,
// height: size.height * 0.4,
// width: double.infinity,
// child:
// Expanded(
// child: Center(
// child: Container(
// width: 200,
// height: 200,
// child: Image.network(
// AppUrl.imageUrl + widget.cat.image),
// ),
// ),
// ),
// ),
// Row(
// children: <Widget>[
// Expanded(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: RichText(
// text: TextSpan(
// style: TextStyle(color: kTextColor),
// children: [
// TextSpan(
// text: "Lengths",
// style: Theme.of(context)
// .textTheme
//     .headline5
//     .copyWith(fontWeight: FontWeight.bold),
// )
// ],
// ),
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: kDefaultPaddin),
// Expanded(
// child: Container(
// height: MediaQuery.of(context).size.height ,
// child: Wrap(children: [
// LenghthsList(diameter: widget.diameter,cat: widget.cat,)
// ],)),
// )
// ],
// ),
// ),
// ],
// ),
// );