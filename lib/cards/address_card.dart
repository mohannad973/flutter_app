import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:ora_app/Models/AddressResponseModel.dart';
import 'package:ora_app/Models/profile_response_model.dart';
import 'package:ora_app/modules.dart';

import '../app_bar.dart';

// ignore: must_be_immutable
class AddressCard extends StatefulWidget {
  final Address item;
  final Function() detectListItem;

  AddressCard({this.item, @required this.detectListItem});

  @override
  _AddressCardState createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      key: UniqueKey(),
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
         // color: Colors.black12,
        decoration: BoxDecoration(
          color: Colors.grey,
          boxShadow: <BoxShadow>[
            // BoxShadow(
            //   offset: Offset(1.0, 1.0),
            //   blurRadius: 4.0,
            //   color: Colors.white,
            // ),
          ],
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: //Icon(Icons.location_city, color: Colors.white),
                  Flag('sy', height: 50, width: 50)),
          title: Text(
            widget.item.addressLine1,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Icon(Icons.linear_scale, color: Colors.yellowAccent),
              Text(widget.item.addressLine2,
                  style: TextStyle(color: Colors.white))
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.white,
            iconSize: 25.0,
            onPressed: () {
              widget.detectListItem();
            },
          ),
        ),
      ),
    );
  }
}
