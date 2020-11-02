import 'package:flutter/material.dart';
import 'package:ora_app/track_order/track_order.dart';


class MyOrderCard extends StatefulWidget {
  @override
  _MyOrderCardState createState() => _MyOrderCardState(

  );
}

class _MyOrderCardState extends State<MyOrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20 , 20 , 20 , 20),
      height: 300,
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Column (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text (
                    'Osaka Entry Fee Superday',
                style: TextStyle (
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                    fontSize: 17
                ),
                ),
                Text (
                  'ITEM 1 TOTAL PRICE 180.00 SR ',
                  style: TextStyle (
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                    fontSize: 20
                  ),
                ),
                Text (
                  'Placed on feb 26,2020',
                  style: TextStyle (
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 17
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
              child: Row (
                children: [
                  Container(
                    decoration: BoxDecoration (
                      boxShadow: [
                        BoxShadow (
                          offset: Offset (1.0 , 1.0),
                          spreadRadius: 2.0,
                          blurRadius: 5.0,
                          color: Colors.grey,
                        )
                      ]
                    ),
                    child: Image.asset(
                      'assets/images/tetanium.png',
                    height: 110,
                    width: 100,
                    fit: BoxFit.fill,),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                    height: 110,
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text (
                          'Osaka Entry Fee Superday',
                          style: TextStyle (
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                          ),
                        ),
                        RichText (
                          text: TextSpan (
                            text: '118.00 SR    ',
                            style: TextStyle (
                                color:  Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16
                            ),

                          ),
                        ),
                        Text (
                            'Size - S',
                        style: TextStyle (
                          fontSize: 16,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500,
                        ),),
                        Text (
                          'QTY : 1',
                          style: TextStyle (
                            fontSize: 16,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w500,
                          ),),
                      ],
                    ),
                  ),
                ],
              ),),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.teal,
            child: FlatButton (
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return TrackOrder();
                }));

              },
              child: Text (
                'TRACK ORDER',
                style: TextStyle (
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
