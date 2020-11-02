import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ora_app/Models/AddressResponseModel.dart';
import 'package:ora_app/Models/ProductsResponse.dart';
import 'package:ora_app/Models/searchResponse.dart';
import 'file:///E:/hashtag%20progects/ora-master/lib/address/add_address.dart';
import 'package:ora_app/app_bar.dart';
import 'package:ora_app/cards/search_card.dart';
import 'package:ora_app/modules.dart';

import 'Network/API.dart';
import 'Product.dart';
import 'Util/session_manager.dart';
import 'cards/address_card.dart';
import 'cards/cart_card.dart';
import 'cart.dart';
import 'package:http/http.dart' as http;
import 'package:ora_app/Models/ProductsResponse.dart';

import 'details/diameters_screen.dart';
// List<AddressResponseModel> addressesList=[];

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

SessionManager sessionManager = SessionManager();

class _FilterState extends State<Filter> {
  TextEditingController searchController;

  var searchList = new SearchResponse();

  deleteItem(int index) {
    Product product = Product(
        id: searchList.products[index].id,
        userId: searchList.products[index].userId,
        subCategoryId: searchList.products[index].subCategoryId,
        imageUrl: searchList.products[index].imageUrl,
        descriptionEn: searchList.products[index].descriptionEn,
        descriptionGer: searchList.products[index].descriptionGer,
        engName: searchList.products[index].engName,
        gerName: searchList.products[index].gerName,
        quantity: searchList.products[index].quantity,
        price: searchList.products[index].price);

    setState(() {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => DiametersScreen(
      //       product: product,
      //     ),
      //   ),
      // );
    });
  }

  _search(String term) async {
    searchList.products.clear();

    API.search(term).then((response) {
      final String responseString = response.body;
      setState(() {
        searchList = searchResponseFromJson(responseString);
      });
    });

    //print(categories[0].engName);
  }

  @override
  Future<void> initState() {
    //addressesList.clear();
    searchList.products = [];
    //_search("");
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(
          context,
          barWithBack(context),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              onChanged: (text) {
                text = text.trim().toLowerCase();
                _search(text);
              },
              controller: searchController,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
//            border: InputBorder.none,
//            focusedBorder: InputBorder.none,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
//            errorBorder: InputBorder.none,
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: 'Search ...',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          barWithSearch(context)),
      body: SafeArea(
        top: false,
        bottom: false,
        child: (searchList.products == null)
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.teal,
              ))
            : ListView.builder(
                itemCount: searchList.products == null
                    ? 0
                    : searchList.products.length,
                itemBuilder: (context, index) {
                  return SearchCard(
                    item: searchList.products[index],
                    detectListItem: () => deleteItem(index),
                  );
                },
              ),
      ),
    );
  }
}
