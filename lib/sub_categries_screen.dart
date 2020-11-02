import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ora_app/Models/CategoryResponseModel.dart';
import 'package:ora_app/Models/SubCategoryResponse.dart';
import 'package:ora_app/Providers/Cart_Provider.dart';
import 'package:ora_app/Util/session_manager.dart';
import 'package:ora_app/app_bar.dart';
import 'package:ora_app/bottom_navigation_bar.dart';
import 'package:ora_app/drawer.dart';
import 'package:ora_app/products.dart';
import 'package:ora_app/widget/MainWidget.dart';
import 'package:provider/provider.dart';
import 'Network/API.dart';
import 'Providers/get_subCats_provider.dart';
import 'Providers/login_provider.dart';
import 'app_bar.dart';
import 'package:http/http.dart' as http;

class SubCategories extends StatefulWidget {
  @override
  _SubCategoriesState createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  var subCategories = new SubCategoryResponse();


  @override
  Future<void> initState() {

       Provider.of<SubCategoryProvider>(context,listen: false).getSubCategories().then((value){
       });

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      drawer: DrawerView (),
      appBar: topBar(context, homeBar(), Text('Ora'), barWithSearch(context)),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Expanded(
          child:Provider.of<SubCategoryProvider>(context).isLoading()?Center(child: CircularProgressIndicator(backgroundColor: Colors.teal,)):
          ListView.builder(
                  itemCount: Provider.of<SubCategoryProvider>(context,listen: false).subCategoryResponse.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Products(
                              subCatID: Provider.of<SubCategoryProvider>(context,listen: false).subCategoryResponse[index].id.toString()
                              ,subCatName: Provider.of<SubCategoryProvider>(context,listen: false).subCategoryResponse[index].engName,)
                            ),
                          );
                        },
                       child: MainWidget(Provider.of<SubCategoryProvider>(context,listen: false).subCategoryResponse[index].engName, Provider.of<SubCategoryProvider>(context,listen: false).subCategoryResponse[index].imageUrl, context),
                      ),
                    );
                  },



          ),

//  snapshot.data.subCategories[index].id.toString()),

//            Expanded(
//              child: GridView.count(
//                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                crossAxisCount: 1,
//                mainAxisSpacing: 10,
//                scrollDirection: Axis.vertical,
//                childAspectRatio: 1.8,
//                children: subCategories.subCategories.map((SubCategory value) {
//                  return GestureDetector(
//                    onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => Products(
//                            )),
//                      );
//                    },
//                    child:MainWidget(value.engName, value.imageUrl, context),
//                  );
//                }).toList(),
//              ),
//            ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
