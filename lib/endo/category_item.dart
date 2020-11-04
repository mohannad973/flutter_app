import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CategoryItem extends StatefulWidget {
  final String title;
  int selectedIndex;
  final Function press;
  int index;

  CategoryItem(
      {Key key, this.title, this.selectedIndex, this.press, this.index})
      : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    // if(widget.selectedIndex == null){
    //   widget.selectedIndex =0;
    // }
    return GestureDetector(
      onTap: widget.press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: <Widget>[
            Text(
              widget.title,
              style: widget.selectedIndex == widget.index
                  ? TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              )
                  : TextStyle(fontSize: 12),
            ),
            if (widget.selectedIndex == widget.index)
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 3,
                width: 22,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
