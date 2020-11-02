
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///E:/hashtag%20progects/ora-master/lib/Utils/app_url.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Providers/implants_provider.dart';
import 'package:provider/provider.dart';


Widget MainWidget(String title , String image , BuildContext context){

  return Container(
    height: 200,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child:  Stack(
              children: [
                Center(
                  child:FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.gif',
                    image: (AppUrl.imageUrl+image),
                    fit: BoxFit.fitWidth,
                    height: 200,
                    width: 100,
                  )
                ),
                //
              ],
            ),
          ),
          Container(
            height: double.infinity,
            decoration: BoxDecoration (
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255,1),
                  Color.fromRGBO(0, 0, 0,0.1),
//                                  Color.fromRGBO(39, 92, 93, 0.4),
//                                  Color.fromRGBO(126, 184, 186, 0.4),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.5, 0.5),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          Center(
            child: Text (
              title,
              style: TextStyle (
                color: Theme.of(context).accentColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,

                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(3, 3),
                    blurRadius: 2.0,
                    color: Colors.black,
                  ),
                ],
              ),),
          )
        ],
      ),
    ),
  );
}
