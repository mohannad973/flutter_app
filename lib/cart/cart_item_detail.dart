import 'package:flutter/material.dart';
import 'package:ora_app/Models/cartModel.dart';
import 'package:ora_app/Providers/Cart_Provider.dart';
import 'package:ora_app/Utils/app_url.dart';
import 'package:provider/provider.dart';

class CartItemDetail extends StatefulWidget {

  Cart cartItem;
  final Function () detectListItem;


  CartItemDetail({this.cartItem,@required this.detectListItem });

  @override
  _CartItemDetailState createState() => _CartItemDetailState();
}

class _CartItemDetailState extends State<CartItemDetail> {
  int counter = 1;
  int price;


  void incrementCounter() {
    setState(() {
      if (counter == 99) {
        return null;
      }

      setState(() {
        counter++;
        price = widget.cartItem.price*counter;
      });
       Provider.of<CartProvider>(context,listen: false).modifyIncrease(widget.cartItem,counter);

    });
  }

  void decrementCounter() {
    setState(() {
      if (counter == 0) {
        return null;
      }

      setState(() {
        counter--;
        price = widget.cartItem.price*counter;
      });
       Provider.of<CartProvider>(context,listen: false).modifyDecrease(widget.cartItem,counter);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price = widget.cartItem.price;
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      (AppUrl.imageUrl+  widget.cartItem.imageUrl)  ))),
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(widget.cartItem.engName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                price.toString()+'\$',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: GestureDetector(
                        onTap: decrementCounter,
                        child: Icon(
                          Icons.remove_circle,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 6, right: 6),
                      child: Text(
                        '${counter}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: GestureDetector(
                        onTap: incrementCounter,
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.white,
                          size: 30,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 15,),
          child: GestureDetector(
            onTap: widget.detectListItem,
            child: Icon(
              Icons.delete,
              color: Color(0xFFc90225),
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
        ),
      ],
    );
  }
}
