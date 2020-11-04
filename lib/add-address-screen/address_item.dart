import 'package:flutter/material.dart';
import 'package:ora_app/Models/add_addressBody.dart';
import 'package:ora_app/Models/profile_response_model.dart';
import 'package:ora_app/Providers/citiesProvider.dart';
import 'package:ora_app/Providers/countries_providers.dart';
import 'package:ora_app/Providers/editAddressProvider.dart';
import 'package:ora_app/Util/session_manager.dart';
import 'package:ora_app/Utils/decorations.dart';
import 'package:ora_app/address/componenets/city_picker.dart';
import 'package:ora_app/address/componenets/country_picker.dart';
import 'package:provider/provider.dart';

class AddressItem extends StatefulWidget {
  Address addressItem;
  final Function() delete;
  final Function() update;

  AddressItem({this.addressItem, this.delete, this.update});

  @override
  _AddressItemState createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  String country, city;
  SessionManager sessionManager = SessionManager();

  // TextEditingController country;
  // TextEditingController cityName;
  TextEditingController phoneController;
  TextEditingController zipCodeController;
  TextEditingController addressLineController;
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
                    _showDeleteDialog(context);

                    // _showDeleteDialog(
                    //   context,
                    // );
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
                    _showUpdateAddressDialog(context);
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

  void _showDeleteDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.red[900],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        "Are You sure you want to delete this item",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          letterSpacing: 1,
                        ),
                      )),
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
                    widget.delete();
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

  void _showUpdateAddressDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            scrollable: true,
            content: Container(
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 3.0),
                    child: Text(
                      'Country',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CountryPicker(
                      countries:
                          Provider.of<CountryProvider>(context).countryResponse,
                      loadCities: (value) {
                        setState(() {
                          country = value;
                          print("country lift up:" + country);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 3.0),
                    child: Text(
                      'City',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Provider.of<CitiesProvider>(context).isLoading()
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.black87,
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CityPicker(
                            cityLift: (value) {
                              city = value;
                              print("city lift :" + city);
                            },
                          ),
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Phone Number'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  TextFormField(
                    controller: phoneController,
                    decoration:
                        inputDecoration().copyWith(hintText: 'Phone Number'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Zip Code'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  TextFormField(
                    controller: zipCodeController,
                    decoration:
                        inputDecoration().copyWith(hintText: 'Zip Code'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('AdressLine 1'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  TextFormField(
                    controller: addressLineController,
                    decoration:
                        inputDecoration().copyWith(hintText: 'AddressLine 1'),
                  ),
                ],
              )),
            ),
            actions: [
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  widget.update();
                },
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.red[900],
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
            title: Text('Edit Address Information'),
          );
        });
  }
}
