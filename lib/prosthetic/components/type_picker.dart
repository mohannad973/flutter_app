import 'package:flutter/material.dart';
import 'package:ora_app/Models/prosthetic_cat_response.dart';
import 'package:ora_app/Providers/categories_provider.dart';
import 'package:ora_app/Providers/pros_cat_provider.dart';
import 'package:provider/provider.dart';

class ProstheticTypePicker extends StatefulWidget {
  ProstheticCategoryResponse prosthseticCat;
  Function updateId;


  ProstheticTypePicker({this.prosthseticCat,this.updateId});

  @override
  _ProstheticTypePickerState createState() => _ProstheticTypePickerState();
}

class _ProstheticTypePickerState extends State<ProstheticTypePicker> {


String _selected;
  @override
  Widget build(BuildContext context) {
    List<ProsCat> prosCatList = widget.prosthseticCat.prosCat;

    if(_selected != null){
      print("selected :"+_selected);
    }else{
      print("selected : null");
    }

    return Center(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    isDense: true,
                    hint: new Text("Select Type"),
                    value: _selected,
                    onChanged: (String newValue) {
                      _selected = newValue;
                      for(int i =0 ;i<prosCatList.length ; i++){
                        if(prosCatList[i].engName == newValue){
                          Provider.of<ProsProvider>(context,listen: false).setSelectedId(prosCatList[i].id);
                          widget.updateId(prosCatList[i].id);
                        }
                      }

                      // Provider.of<CountryProvider>(context,listen: false).setSelectedCountry(newValue);
                      //
                      // print("cityTest"+Provider.of<CitiesProvider>(context,listen: false).cities.toString());
                      //
                      setState(() {
                        _selected = newValue;
                      });

                    },
                    items:prosCatList.map((ProsCat map) {
                      return new DropdownMenuItem<String>(
                        value: map.engName.toString(),
                        //+value: _selected,
                        child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Container(width:MediaQuery.of(context).size.width/2,child: Text(map.engName,overflow:TextOverflow.ellipsis,))),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
