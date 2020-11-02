import 'package:flutter/material.dart';
import 'package:ora_app/Models/CountryResponseModel.dart';
import 'package:ora_app/Providers/citiesProvider.dart';
import 'package:ora_app/Providers/countries_providers.dart';
import 'package:provider/provider.dart';

class CountryPicker extends StatefulWidget {
  CountryResponse countries;
  Function loadCities;

  CountryPicker({this.countries, this.loadCities});

  @override
  _CountryPickerState createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String _selected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    hint: new Text("Select Country"),
                    value: _selected,
                    onChanged: (String newValue) {
                      Provider.of<CountryProvider>(context, listen: false)
                          .setSelectedCountry(newValue);

                      Provider.of<CitiesProvider>(context, listen: false)
                          .getCities(newValue);

                      setState(() {
                        widget.loadCities(newValue);
                        Provider.of<CitiesProvider>(context, listen: false)
                            .getCities(newValue);
                        _selected = newValue;
                      });
                    },
                    items: Provider.of<CountryProvider>(context)
                        .myCountries
                        .map((String map) {
                      return new DropdownMenuItem<String>(
                        value: map.toString(),
                        //+value: _selected,
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
