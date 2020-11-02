import 'package:flutter/material.dart';
import 'package:ora_app/modules.dart';


// ignore: must_be_immutable
class CartCard extends StatefulWidget {
  final CartItem item;
  final Function () detectListItem;
  CartCard ({ this.item , @required this.detectListItem });

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(UniqueKey().toString()),
      background: Container(
        color: Colors.red,
        child:  IconButton (
          icon: Icon (Icons.delete),
          color: Colors.white,
          iconSize: 35.0,
          onPressed: (){
            widget.detectListItem();
          },
        ),
      ),
      onDismissed: (direction){
        setState(() {
          widget.detectListItem();
        });
        Scaffold
            .of(context)
            .showSnackBar(SnackBar(content: Text(widget.item.name+" dismissed")));
      },
      child: Container (
        margin: EdgeInsets.only( bottom: 10),
        height: 100,
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container (
              width: 140,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset('assets/' + widget.item.image + '.png',
                ),
              ),
              decoration: BoxDecoration (
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Theme.of(context).primaryColor,
                    width: 1.0,)
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top : 8.0 , bottom: 8.0 ),
                child: Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text (widget.item.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
                    Text (widget.item.subCategory,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.left,),
                    Text ("\$ "+widget.item.price,
                      textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.green),),

                  ],
                ),
              ),
            ),
            Column (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector (
                  onTap: (){
                    // TODO quantity should be smaller than item quantity
                    setState(() {
                      widget.item.quantity ++ ;
                    });
                  },
                  child: SizedBox (
                    width: 25.0,
                    height: 25.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color:  Theme.of(context).primaryColor,
                          shape: BoxShape.circle
                      ),
                        child: Center(
                          child: Text(
                            '+',
                            style: TextStyle
                              (
                                fontSize: 20,color: Colors.white),
                          ),
                        ),
                    ),
                  ),
                ),
                Container(

                    child: Text ('${widget.item.quantity}',)),
                GestureDetector (
                  onTap: (){
                    setState(() {
                      if (widget.item.quantity > 1) {
                        widget.item.quantity -- ;
                      }
                    });
                  },
                  child: SizedBox (
                    width: 25.0,
                    height: 25.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Text(
                          '-',
                          style: TextStyle
                            (
                              fontSize: 20,color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

