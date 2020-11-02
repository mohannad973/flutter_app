import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:ora_app/Models/AddressResponseModel.dart';
import 'package:ora_app/Models/StringSuccessResponse.dart';
import 'package:ora_app/Models/profile_response_model.dart';
import 'package:ora_app/Providers/profile_provider.dart';
import 'package:ora_app/add-address-screen/add_address_home.dart';
import 'package:ora_app/add-address-screen/address_item.dart';
import 'package:ora_app/address/add_address.dart';

import 'package:ora_app/app_bar.dart';
import 'package:ora_app/modules.dart';
import 'package:provider/provider.dart';

import 'Network/API.dart';
import 'Providers/countries_providers.dart';
import 'Util/session_manager.dart';
import 'cards/address_card.dart';
import 'cards/cart_card.dart';
import 'cart.dart';
import 'package:http/http.dart' as http;

// List<AddressResponseModel> addressesList=[];

class MyAddresses extends StatefulWidget {
  var addressList = new List<Address>();


  MyAddresses({this.addressList});

  @override
  _MyAddressesState createState() => _MyAddressesState();
}
// SessionManager sessionManager = SessionManager();




class _MyAddressesState extends State<MyAddresses> {




  // Future<List<AddressResponseModel>> getAddress() async{
  //
  //   Future<String> authToken = sessionManager.getAuthToken();
  //   authToken.then((data) {
  //     print("authToken " + data.toString());
  //   },onError: (e) {
  //     print(e);
  //   });
  //
  //   String token = await authToken;
  //   final String apiUrl = 'http://ora.hashtagweb.online/api/getMyAddresses';
  //
  //   final response = await http.get(apiUrl, headers: {
  //     HttpHeaders.contentTypeHeader: 'application/json',
  //     HttpHeaders.ACCEPT: 'application/json',
  //     HttpHeaders.authorizationHeader: 'Bearer $token',
  //   } );
  //
  //
  //   if(response.statusCode==200){
  //     final String responseString = response.body;
  //     debugPrint('responsetest: ${responseString}');
  //     this.setState(() {
  //       addressList.addAll(addressResponseModelFromJson(responseString));
  //     });
  //
  //     debugPrint('addressListTest: ${addressList[0].city}');
  //     return addressResponseModelFromJson(responseString);
  //
  //   }else{
  //     debugPrint('responsetest: ${response.statusCode.toString()}');
  //     return null;
  //   }
  //
  // }

  _deleteAddress( int id , String token) async {
    API api = API();

    try{ final response = await api.deleteAddress(id, token);
    print("deleeeeeete " + id.toString());
    print("token123 " + token.toString());
    if (response.success = true) {

      final String responseString = response.toString();
      return true;

    } else {

      return false;
    }}catch(e){
      print ("erroe catch "+ e.toString());
    }



  }

  deleteItem (int index) async{
    print("delete 123"+ index.toString());
    SessionManager sessionManager = SessionManager();
    String token = await sessionManager.getAuthToken();
    setState(() {
      widget.addressList.removeAt(index);
      _deleteAddress(widget.addressList[index].id, token);
    });
  }


  _getAddress() async{
    //
    // Future<String> authToken = sessionManager.getAuthToken();
    // authToken.then((data) {
    //   print("authToken " + data.toString());
    // },onError: (e) {
    //   print(e);
    // });

    // String token = await authToken;


    //
    // API.getAddress(token).then((response) {
    //
    //   print(response);
    //   debugPrint('responsetest: ${response}');
    //   final String responseString = response.body;
    //   setState(() {
    //     addressList.addAll(addressResponseModelFromJson(responseString));
    //
    //    // Iterable list = json.decode(response.body);
    //     //addressList = list.map((model) => AddressResponseModel.fromJson(model)).toList();
    //     debugPrint('responsetest: ${addressList[0].city}');
    //   });
    // });
    //print(categories[0].engName);
  }

  @override
  Future<void> initState()  {
    //addressesList.clear();
    _getAddress();



  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("adress info : "+ widget.addressList.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topBar(context, barWithBack(context), Text ('Addresses'),barWithAdd(context)),

      body: Provider.of<ProfileProvider>(context).loading?Center(child: CircularProgressIndicator(backgroundColor: Colors.black12,)):
      SafeArea(
        top: false,
        bottom: false,
        child: ListView.builder (
          itemCount: widget.addressList == null ? 0 : widget.addressList.length,
          itemBuilder: (context , index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              //  child: AddressCard( item: widget.addressList[index], detectListItem: () => deleteItem(index),
               // ),
              child: AddressItem(addressItem: widget.addressList[index],delete: () => deleteItem(index)
              ,),
            );
          },
        ),

      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Address',
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: () => {
        Provider.of<CountryProvider>(context,listen: false).getCountries(),
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AddAddressScreen()))
        },
      ),
    );
  }
}


