import 'package:flutter/material.dart';
import 'package:ora_app/Models/diameters_model.dart';
import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Providers/diameters_provider.dart';
import 'package:ora_app/Utils/app_url.dart';
import 'package:ora_app/details/components/diameter_cell.dart';
import 'package:ora_app/lengthes/lengthes_screen.dart';
import 'package:ora_app/lengths_2/lengths_2_screen.dart';
import 'package:provider/provider.dart';

class DiameterList extends StatefulWidget {
  Cat cat;
  String trayImageUrl;
  DiameterList({this.cat});

  @override
  _DiameterListState createState() => _DiameterListState();
}

class _DiameterListState extends State<DiameterList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Diameter> diameters = [];

    return FutureBuilder(
      future: Provider.of<DiametersProvider>(context, listen: false)
          .getDias(widget.cat.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Container(
              child: Text('something went wrong'),
            );
          }
          // diameters = snapshot.data.dias.diameters;
          diameters = Provider.of<DiametersProvider>(context,listen: false).diameters;
          widget.trayImageUrl = Provider.of<DiametersProvider>(context,listen: false).tray.image;
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: diameters.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LengthesScreen2(diameter: diameters[i],cat: widget.cat,)),
                            );
                          },

                          child: DiameterCell(
                            diameter: diameters[i],
                          )),
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.05,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.black87)),
                  onPressed: () async {

                    await showDialog(
                        context: context,
                        builder: (_) => ImageDialog(imageUrl: widget.trayImageUrl,)
                    );

                  },
                  color: Colors.black87,
                  textColor: Colors.white,
                  child: Text("Check Surgical Tray".toUpperCase(),
                      style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.black87,
              ),
            ),
          );
        }
      },
    );
  }
}


class ImageDialog extends StatelessWidget {
  String imageUrl;

  ImageDialog({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child:  Center(
            child:FadeInImage.assetNetwork(
              placeholder: 'assets/loading.gif',
              image: (AppUrl.imageUrl+imageUrl),
            )
        ),
        width: MediaQuery.of(context).size.width*0.8,
        height: MediaQuery.of(context).size.height*0.6,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //
        //         image: NetworkImage(AppUrl.imageUrl+imageUrl),
        //         fit: BoxFit.cover
        //     )
        // ),
      ),
    );
  }
}