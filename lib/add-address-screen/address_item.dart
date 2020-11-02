import 'package:flutter/material.dart';
import 'package:ora_app/Models/profile_response_model.dart';

class AddressItem extends StatefulWidget {
  Address addressItem;
  final Function ()  delete;

  AddressItem({this.addressItem,this.delete});

  @override
  _AddressItemState createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * .9,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(1, 1),
                spreadRadius: 2.0,
                blurRadius: 1.0,
                color: Colors.grey.withOpacity(0.4)),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.addressItem.country,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black54),
          ),
          Text(
            widget.addressItem.city,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black54),
          ),
          Text(
            widget.addressItem.addressLine1,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () {
                    print("test5");
                    widget.delete();
                    // _showLanguageAlertDialog(context,);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black54,
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context){
                    //   return EditAddress (address: widget.address,);
                    // }));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black54,
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showLanguageAlertDialog(context) {

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Row(
              children: [
                Icon(Icons.delete),
                SizedBox(
                  width: 8,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "Are You sure you want to delete this item",
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            letterSpacing: 1,
                          ),
                        ))),
              ],
            ),
          ),
          actions: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {

                  Navigator.pop(context);
                },
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black54,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red[900],
              ),
            ),
          ],
        );
      });
}
