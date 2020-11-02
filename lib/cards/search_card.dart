import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:ora_app/Models/AddressResponseModel.dart';
import 'package:ora_app/Models/searchResponse.dart';
import 'package:ora_app/modules.dart';

import '../app_bar.dart';


// ignore: must_be_immutable
class SearchCard extends StatefulWidget {
  final searchProduct item;
  final Function () detectListItem;
  SearchCard ({ this.item , @required this.detectListItem });

  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.detectListItem,
      child: Container(
        height: 130,
        child: Card(

          key: UniqueKey(),
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(

            decoration:BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 4.0,
                  color: Color.fromARGB(200, 0, 0, 0),
                ),
              ],

            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                height: 80,
                  width: 80,
                  padding: EdgeInsets.only(right: 22.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(width: 1.0, color: Colors.white24))),
                  child: //Icon(Icons.location_city, color: Colors.white),
                   Container(
                     decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(50.0),
                       boxShadow: [
                         BoxShadow(
                           offset: Offset(1.0,1.0),
                           blurRadius: 2.0,
                           color: Colors.black.withOpacity(0.5)
                         ),
                       ]
                     ),
                     child: CircleAvatar(
                       backgroundColor: Colors.white,

                  backgroundImage: NetworkImage("http://ora.hashtagweb.online"+widget.item.imageUrl),
            ),
                   ),
              ),
              title: Padding(
                padding: EdgeInsets.only(bottom: 10) ,
                child: Text(
                  widget.item.engName,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

              subtitle: Row(
                children: <Widget>[

                  Text(widget.item.engName, style: TextStyle(color: Colors.black,),maxLines: 3,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

