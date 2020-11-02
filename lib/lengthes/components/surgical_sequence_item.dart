import 'package:flutter/material.dart';
import 'package:ora_app/Models/dias_info.dart';
import 'package:ora_app/Utils/app_url.dart';
class SurgicalSequenceItem extends StatefulWidget {
  SurgicalSeq surgicalSeq;

  SurgicalSequenceItem({this.surgicalSeq});

  @override
  _SurgicalSequenceItemState createState() => _SurgicalSequenceItemState();
}

class _SurgicalSequenceItemState extends State<SurgicalSequenceItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          width: MediaQuery.of(context).size.width /1.8,
          height: MediaQuery.of(context).size.height / 4,
          child: Padding(
            padding: EdgeInsets.only(
              top: 0,
              bottom: 0,
            ),
            child: Image.network(
              AppUrl.imageUrl+widget.surgicalSeq.prostheticCom.image,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width / 1.8,
              height: MediaQuery.of(context).size.height / 3.4,
            ),
          ),
        ),
        Container(
          color: Colors.black87,
          width: MediaQuery.of(context).size.width / 1.8,
          height: MediaQuery.of(context).size.height / 9,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3, left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Text(
                        widget.surgicalSeq.prostheticCom.ref,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Text(
                      '\$'+widget.surgicalSeq.prostheticCom.price.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xff599DA0),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          width: MediaQuery.of(context).size.width / 1.8,
          height: MediaQuery.of(context).size.height / 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // print("proslistitem " + prosList[index].toString());
                        // setState(() {
                        //   countValues[index]++;
                        // });
                      },
                    ),
                  ),
                  Text(
                  "0",
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                      padding: EdgeInsets.all(2),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // setState(() {
                          //   if(countValues[index] == 0){
                          //
                          //   }else{
                          //     countValues[index]--;
                          //   }
                          //
                          // });
                        },
                      )),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
