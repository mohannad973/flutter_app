import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latlong/latlong.dart';

class ContactUsBody extends StatefulWidget {
  @override
  _ContactUsBodyState createState() => _ContactUsBodyState();
}

class _ContactUsBodyState extends State<ContactUsBody> {

  _launchURL(String toMailId) async {
    var url = 'mailto:$toMailId';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView (
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center (
                child:
                Text(
                  'Headquarters: Mühlenstraße 8a 14167 - Berlin, Germany',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle (
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ) ,
              ),
              SizedBox (height: 20,),
              InkWell(
                    onTap: (){
                      launch("tel://+491789622570");
                    },
                    child: Container(
                      child: Row (
                        children: [
                          Icon (
                            Icons.phone_in_talk,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox (width: 10,),
                          Text (
                            '+491789622570',
                            style: TextStyle (
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              SizedBox (height: 20,),
              InkWell(
                onTap: (){
                  _launchURL("info@ora-dental.com");
                },
                child: Container(
                  child: Row (
                    children: [
                      Icon (
                        Icons.email,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox (width: 10,),
                      Text (
                        'info@ora-dental.com',
                        style: TextStyle (
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15
                        ),
                      ),
                      SizedBox (height: 20,),
                  ],
                ),
              ),
              ),
              SizedBox(height: 20,),
              Container (
                height: 400,
                alignment: Alignment.centerLeft,
                child : FlutterMap(
                  options: new MapOptions(

                    zoom: 150.0,
                    center: LatLng(40.00 , -74.00),
                  ),
                  layers: [
                    new TileLayerOptions(
                        urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c']
                    ),
                    new MarkerLayerOptions(
                      markers: [
                        new Marker(
                          width: 80.0,
                          height: 80.0,
                          // point: LatLng(),
                          builder: (ctx) =>
                          new Container(
                            child: new FlutterLogo(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
