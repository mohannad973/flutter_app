import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ora_app/Models/CategoryResponseModel.dart';
import 'package:ora_app/Providers/Cart_Provider.dart';
import 'package:ora_app/Providers/categories_provider.dart';
import 'package:ora_app/Util/session_manager.dart';
import 'package:ora_app/app_bar.dart';
import 'package:ora_app/bottom_navigation_bar.dart';
import 'package:ora_app/details/diameters_screen.dart';

import 'package:ora_app/drawer.dart';
import 'package:ora_app/list_products/Products_list.dart';
import 'package:ora_app/products.dart';
import 'package:ora_app/sub_categries_screen.dart';
import 'package:ora_app/widget/MainWidget.dart';
import 'package:provider/provider.dart';
import 'Models/cartModel.dart';
import 'Network/API.dart';
import 'Providers/implants_provider.dart';
import 'app_bar.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SessionManager sessionManager = SessionManager();
  var categories = new List<CategoryResponseModel>();



  @override
  void initState() {
    super.initState();
    // _getCategories();

    Provider.of<CategoriesProvider>(context, listen: false)
        .getCategories()
        .then((value) {});

    Provider.of<ImplantProvider>(context, listen: false)
        .getImplants()
        .then((value) {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: <Widget>[
            Expanded(
              child:
                  // Provider.of<CategoriesProvider>(context).categoryList.isEmpty
                  Provider.of<ImplantProvider>(context).cats.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.teal,
                          ),
                        )
                      : ListView.builder(
                          itemCount:
                              // Provider.of<CategoriesProvider>(context,
                              //         listen: false)
                              //     .categoryList
                              //     .length
                              Provider.of<ImplantProvider>(context,
                                      listen: false)
                                  .cats
                                  .length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(

                                onTap: () {
                                  print("iddddd"+Provider.of<ImplantProvider>(context,listen: false).cats[index].id.toString());
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(

                                        builder: (context) => DiametersScreen(cat: Provider.of<ImplantProvider>(context).cats[index],)),
                                  );
                                },
                                child: MainWidget(
                                    Provider.of<ImplantProvider>(context)
                                        .cats[index]
                                        .engName,
                                    Provider.of<ImplantProvider>(context)
                                        .cats[index]
                                        .image,
                                    context),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
