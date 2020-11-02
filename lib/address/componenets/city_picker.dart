import 'package:flutter/material.dart';
import 'package:ora_app/Models/CountryResponseModel.dart';
import 'package:ora_app/Providers/citiesProvider.dart';
import 'package:ora_app/Providers/countries_providers.dart';
import 'package:provider/provider.dart';

class CityPicker extends StatefulWidget {
  List<String> cities;
  Function cityLift;
  String _salutation = "Mr."; //This is the selection value. It is also present in my array.
  final _salutations = ["Mr.", "Mrs.", "Master", "Mistress"];

  CityPicker({this.cities,this.cityLift});

  @override
  _CityPickerState createState() => _CityPickerState();
}

class _CityPickerState extends State<CityPicker> {
  String _selected;
  List<String> cityList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if (Provider.of<CitiesProvider>(context).cities != null) {

      setState(() {
        cityList = Provider.of<CitiesProvider>(context).cities;
      });
    } else {
      setState(() {
        cityList = ["value"];
      });
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
                    hint: new Text("Select City"),
                    value: _selected,
                    onChanged: (String newValue) {

                      setState(() {
                        widget.cityLift(newValue);

                        _selected = newValue;

                      });
                    },
                    items: Provider.of<CitiesProvider>(context)
                        .cities.sublist(0,(Provider.of<CitiesProvider>(context).cities.length/2).round())
                        .map((String map) {
                      return new DropdownMenuItem<String>(
                         value: map.toString(),
                        // value: _selected,
                        child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  map,
                                  overflow: TextOverflow.ellipsis,
                                ))),
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
//
// return Center(
// child: Container(
// padding: EdgeInsets.all(15),
// decoration: BoxDecoration(
// border: Border.all(width: 1, color: Colors.grey),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// Expanded(
// child: DropdownButtonHideUnderline(
// child: ButtonTheme(
// alignedDropdown: true,
// child: DropdownButton<String>(
// isDense: true,
// hint: new Text("Select City"),
// value:_selected,
// onChanged: (String newValue) {
// Provider.of<CitiesProvider>(context, listen: false)
//     .setSelectedCity(newValue);
// // Provider.of<CountryProvider>(context,listen: false).setSelectedCountry(newValue);
//
// // Provider.of<CitiesProvider>(context,listen: false).getCities(newValue);
//
// setState(() {
// // Provider.of<CitiesProvider>(context,listen: false).getCities(newValue);
// _selected = newValue;
// });
// },
// // items: Provider.of<CitiesProvider>(context, listen: false)
// //     .cities
// items:cityList
//     .map((String map) {
// return new DropdownMenuItem<String>(
// value: map.toString(),
// //  value: Provider.of<CitiesProvider>(context,listen: true).getSelectedCity(),
// child: Container(
// margin: EdgeInsets.only(left: 10),
// child: Container(
// width: MediaQuery.of(context).size.width / 2,
// child: Text(
// map,
// overflow: TextOverflow.ellipsis,
// ))),
// );
// }).toList(),
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// );
