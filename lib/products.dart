import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:ora_app/Models/CoursesResponse.dart';
import 'package:ora_app/Models/Product.dart';
import 'package:ora_app/Models/ProductsResponse.dart';
import 'package:ora_app/Product.dart';
import 'package:ora_app/app_bar.dart';
import 'package:ora_app/bottom_navigation_bar.dart';
import 'package:ora_app/details/diameters_screen.dart';
import 'Network/API.dart';
import 'list_products/Products_list.dart';
import 'modules.dart';

class Products extends StatefulWidget {
  final Course course;
  final String subCatID;
  final String subCatName;

  Products({this.course, this.subCatID, this.subCatName});

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productsList = new ProductsResponse();

  _getProducts() async {
    API.getProducts(widget.subCatID).then((response) {
      setState(() {
        productsList = productsResponseFromJson(response.body.toString());
      });
    });
    //print(categories[0].engName);
    print("productsare" + productsList.products[0].id.toString());
    return productsList;
  }

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context, barWithBack(context), Text('Products'),
          barWithSearch(context)),
      bottomNavigationBar: BottomBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              future: _getProducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.teal,
                  ));
                } else {
                  return ListView.builder(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => DiametersScreen(
                                //       product: Product(
                                //           id: snapshot.data.products[index].id,
                                //           price:
                                //               snapshot.data.products[index].price,
                                //           imageUrl: snapshot
                                //               .data.products[index].imageUrl,
                                //           engName:
                                //               snapshot.data.products[index].engName,
                                //           descriptionEn: snapshot
                                //               .data.products[index].descriptionEn,
                                //           quantity: snapshot
                                //               .data.products[index].quantity),
                                //
                                //     ),
                                //   ),
                                // );
                              },
                              child: Container(
                                height: 260,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).primaryColor,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 4.0,
                                      color: Color.fromARGB(200, 0, 0, 0),
                                    ),
                                  ],
                                  // gradient: LinearGradient(
                                  //   colors: [
                                  //     Theme.of(context).primaryColor,
                                  //     Theme.of(context).primaryColor,
                                  //   ],
                                  // ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            height: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                          ),
                                          Hero(
                                            tag: snapshot
                                                .data.products[index].id,
                                            child: Container(
                                              // margin: EdgeInsets.all(15),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                child: Image(
                                                  height: 200,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  fit: BoxFit.fitWidth,
                                                  image: NetworkImage(
                                                      'http://ora.hashtagweb.online' +
                                                          snapshot
                                                              .data
                                                              .products[index]
                                                              .imageUrl),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Flexible(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          padding:
                                              EdgeInsets.fromLTRB(10, 5, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                    child: Text(
                                                      snapshot
                                                          .data
                                                          .products[index]
                                                          .engName,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        color: Theme.of(context)
                                                            .accentColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      widget.subCatName,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        color: Theme.of(context)
                                                            .accentColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Text(
                                                    snapshot.data
                                                        .products[index].price
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .accentColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: SizedBox(
                                  height: 10,
                                )),
                          ],
                        );
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget gridViewWidget() {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
      crossAxisCount: 1,
      mainAxisSpacing: 10,
      scrollDirection: Axis.vertical,
      childAspectRatio: 1.5,
      children: productsList.products.map((Product value) {
        return GestureDetector(
          onTap: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => ProductModulPage(
//                      productDetails: Product(price: value.price ,
////                          image : value.name ,
////                          name: value.name ,
////                          subCategory: value.subCategory
//                      ),
//                    )),
//              );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 4.0,
                  color: Color.fromARGB(200, 0, 0, 0),
                ),
              ],
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromRGBO(85, 58, 109, 1),
//                   Color.fromRGBO(183, 155, 207, 1),
// //                            Color.fromRGBO(39, 92, 93, 1),
// //                            Color.fromRGBO(126, 184, 186, 1)
//                 ],
//                 begin: const FractionalOffset(0.0, 0.0),
//                 end: const FractionalOffset(0.5, 0.0),
//                 stops: [0.0, 1.0],
//                 tileMode: TileMode.clamp,
//               ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                      ),
                      Hero(
                        tag: value.engName,
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 150,
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(
                                  'http://ora.hashtagweb.online' +
                                      value.imageUrl),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                  value.engName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  widget.subCatName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                value.price.toString(),
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
