import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paginator/flutter_paginator.dart';
import 'package:ora_app/Models/prosthetic_by_cat_response.dart';
import 'package:ora_app/Models/prosthetic_cat_response.dart';
import 'package:ora_app/Providers/pros_cat_provider.dart';
import 'package:ora_app/Providers/pros_data_provider.dart';
import 'package:ora_app/Utils/app_url.dart';
import 'package:ora_app/list_products/Products_list.dart';
import 'package:ora_app/prosthetic/components/type_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Prosthetic extends StatefulWidget {
  String typeId="1";

  Prosthetic({this.typeId});

  @override
  _ProstheticState createState() => _ProstheticState();
}

class _ProstheticState extends State<Prosthetic> {
   String catId;
  Future<ProstheticCategoryResponse> future;
  int _value = 0;
  List<int> countValues = [];
  int selectedIndex = 0;
  List<Datum> prosList = [];
  GlobalKey<PaginatorState> paginatorGlobalKey = GlobalKey();
  String prosTypeId;

 List<Datum> list1;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    future = Provider.of<ProsProvider>(context, listen: false).getProsCat();
    prosTypeId = Provider.of<ProsProvider>(context,listen: false).getSelectedId().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ProstheticTypePicker(
                    prosthseticCat: snapshot.data,
                    updateId: (int id){
                      setState(() {
                        prosTypeId = id.toString();
                        print("////// :"+prosTypeId);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Prosthetic(typeId: prosTypeId,)));
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(

                    height: MediaQuery.of(context).size.height-100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Paginator.gridView(
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.5,
                        ),

                        key: paginatorGlobalKey,
                        pageLoadFuture: sendCountriesDataRequest,
                        pageItemsGetter: listItemsGetter,
                        listItemBuilder: listItemBuilder,
                        loadingWidgetBuilder: loadingWidgetMaker,
                        errorWidgetBuilder: errorWidgetMaker,
                        emptyListWidgetBuilder: emptyListWidgetMaker,
                        totalItemsGetter: totalPagesGetter,
                        pageErrorChecker: pageErrorChecker,
                        scrollPhysics: ClampingScrollPhysics(),
                        shrinkWrap: false,
                      ),
                    ),

                  ),

                ],
              ),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            ));
          }
        },
      ),
    );
  }

  Future<ProstheticByCatResponse> sendCountriesDataRequest(int page) async {

    print("111111");
    // "http://test-ora.hashtagweb.online/api/prosthetic/getByCat/$catId?page=$page"
    try {
       String id = Provider.of<ProsProvider>(context).getSelectedId().toString();
      // String id = prosTypeId;
      // print("id is" + id);
      // Provider.of<ProsDataProvider>(context).getProsData(id, page);
      String url = Uri.encodeFull(
          'http://test-ora.hashtagweb.online/api/prosthetic/getByCat/${widget.typeId}?page=$page');
      http.Response response = await http.get(url);
      print("data" + prostheticByCatResponseFromJson(response.body).toString());
      return prostheticByCatResponseFromJson(response.body);

      // return Provider.of<ProsDataProvider>(context).getProsByCatData();
    } catch (e) {
      if (e is IOException) {
        return ProstheticByCatResponse.withError(
            'Please check your internet connection.');
      } else {
        print(e.toString());
        return ProstheticByCatResponse.withError('Something went wrong.');
      }
    }
  }

  List<dynamic> listItemsGetter(
      ProstheticByCatResponse prostheticByCatResponse) {
    print("222222");


    List<Datum> list = [];
    prostheticByCatResponse.components.data.forEach((value) {
      list.add(value);
      prosList.add(value);
      countValues.add(0);
    });

    print("proslistinsidegetter "+ prosList.toString());
    return list;
  }

  Widget listItemBuilder(value, int index,) {
    print("value of item + :"+value.toString());
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          width: MediaQuery.of(context).size.width / 1.8,
          height: MediaQuery.of(context).size.height / 4,
          child: Padding(
            padding: EdgeInsets.only(
              top: 0,
              bottom: 0,
            ),
            child: Image.network(
              AppUrl.imageUrl+value.image,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width / 1.8,
              height: MediaQuery.of(context).size.height / 3.4,
            ),
          ),
        ),
        Container(
          color: Colors.black87,
          width: MediaQuery.of(context).size.width / 1.8,
          height: MediaQuery.of(context).size.height / 9,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3, left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        value.engName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Text(
                      '\$'+value.price.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Diameter',
                      style: TextStyle(color: Colors.white),
                    ),
                    value.diameter == null ? Text("-",style: TextStyle(color: Colors.white),):
                    Text(
                      value.diameter.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      'Hight',
                      style: TextStyle(color: Colors.white),
                    ),
                    value.height == null ? Text("-",style: TextStyle(color: Colors.white),):
                    Text(
                      value.height.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ML',
                      style: TextStyle(color: Colors.white),
                    ),
                    value.ml == null ? Text("-",style: TextStyle(color: Colors.white),):
                    Text(
                      value.ml.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xff599DA0),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          width: MediaQuery.of(context).size.width / 1.8,
          height: MediaQuery.of(context).size.height / 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                         print("proslistitem " + prosList[index].toString());
                        setState(() {
                         countValues[index]++;
                        });
                      },
                    ),
                  ),
                  Text(
                    countValues[index].toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                      padding: EdgeInsets.all(2),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if(countValues[index] == 0){

                            }else{
                              countValues[index]--;
                            }

                          });
                        },
                      )),
                ],
              )
            ],
          ),
        )
      ],
    );
    // print("333333");
    // return ListTile(
    //   leading: Text(index.toString()),
    //   title: Text(value),
    // );
  }

  Widget loadingWidgetMaker() {
    print("444444"+Provider.of<ProsDataProvider>(context).getProsByCatData().toString());
    return Container(
      alignment: Alignment.center,
      height: 160.0,
      child: CircularProgressIndicator(
        backgroundColor: Colors.teal,
      ),
    );
  }

  Widget errorWidgetMaker(
      ProstheticByCatResponse countriesData, retryListener) {
    print("555555");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(countriesData.errorMessage),
        ),
        FlatButton(
          onPressed: retryListener,
          child: Text('Retry'),
        )
      ],
    );
  }

  Widget emptyListWidgetMaker(ProstheticByCatResponse countriesData) {
    print("666666");
    return Center(
      child: Text('No Prosthetic found'),
    );
  }

  int totalPagesGetter(ProstheticByCatResponse countriesData) {
    print("7777777"+Provider.of<ProsDataProvider>(context,listen: false).getProsByCatData().toString());

    return countriesData.components.data.length;
  }

  bool pageErrorChecker(ProstheticByCatResponse countriesData) {
    print("888888");
    print("9999" + countriesData.success.toString());
    return countriesData.success = false;
  }
}

// class CountriesData {
//   List<dynamic> countries;
//   int statusCode;
//   String errorMessage;
//   int total;
//   int nItems;
//
//   CountriesData.fromResponse(http.Response response) {
//     this.statusCode = response.statusCode;
//     List jsonData = json.decode(response.body);
//     countries = jsonData[1];
//     total = jsonData[0]['total'];
//     nItems = countries.length;
//   }
//
//   CountriesData.withError(String errorMessage) {
//     this.errorMessage = errorMessage;
//   }
// }
