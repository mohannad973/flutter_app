import 'package:flutter/material.dart';

import 'category_item.dart';

class EndoBody extends StatefulWidget {
  List<String> cats =["endo 1","endo 2" , "endo 3","endo 2" , "endo 3","endo 2" , "endo 3","endo 2" , "endo 3"];
  int selectedIndex = 0;


  @override
  _EndoBodyState createState() => _EndoBodyState();
}

class _EndoBodyState extends State<EndoBody> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: 5,),
        Center(
          child: Container(
            width:size.width*0.9 ,
            height: size.height*0.1,
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
            child: Center(child: Text("ENDO SYSTEM",style: TextStyle(fontSize: 20),)),
          ),
        ),


        Container(
          width: size.width,
            height: 100,
            child: Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Input Text. The text language must match the selected voice language: Mixing language (English text with a Spanish male voice) does not produce valid results."),
            ))),
        Container(
          height: 39,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.cats.length,
            itemBuilder: (context, index) => CategoryItem(
              title: widget.cats[index],
              selectedIndex: widget.selectedIndex,
              index: index,
              press: () {
                setState(() {
                  widget.selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
