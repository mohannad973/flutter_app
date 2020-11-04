import 'package:flutter/material.dart';
import 'package:ora_app/Providers/endo_cats_provider.dart';
import 'package:ora_app/Providers/endo_products_provider.dart';
import 'package:ora_app/details/components/body.dart';
import 'package:ora_app/endo/endo_body.dart';
import 'package:provider/provider.dart';

class EndoHome extends StatefulWidget {
  @override
  _EndoHomeState createState() => _EndoHomeState();
}

class _EndoHomeState extends State<EndoHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<EndoProductsProvider>(context, listen: false)
    //     .getEndoProducts(1);

    Provider.of<EndoCatsProvider>(context, listen: false).getEndoCat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
              Provider.of<EndoCatsProvider>(context).isLoading()
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.black54,
            ))
          : EndoBody(),
    );
  }
}
