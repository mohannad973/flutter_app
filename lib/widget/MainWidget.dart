import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ora_app/Models/implant_response.dart';
import 'package:ora_app/Providers/implants_provider.dart';
import 'package:provider/provider.dart';

import '../Utils/app_url.dart';

Widget MainWidget(String title, String image, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 200,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Flexible(
            child:   Container(
                child: Center(
                  child: Container(
                    width: 50,
                    height: 100,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/loading.gif',
                      image: (AppUrl.imageUrl + image),
                      fit: BoxFit.fitHeight,
                      // height: 200,
                      // width: 100,
                    ),
                  ),
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(
                        "assets/photo5843754424906921069.jpg"),
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          new Flexible(
            child:     Container(
              color: Colors.black,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
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
                  ),
                ),
              ),
            )
          ),
        ],
      ),


    ),
  );
}


// child: Stack(
//   children: [
//     Container(
//         child: Center(
//           child: Container(
//             width: 50,
//             height: 100,
//             child: FadeInImage.assetNetwork(
//               placeholder: 'assets/loading.gif',
//               image: (AppUrl.imageUrl + image),
//               fit: BoxFit.fitHeight,
//               // height: 200,
//               // width: 100,
//             ),
//           ),
//         ),
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: ExactAssetImage(
//                 "assets/photo5843754424906921069.jpg"),
//             fit: BoxFit.cover,
//           ),
//         )),
//     Center(
//       child: Text(
//         title,
//         style: TextStyle(
//           color: Theme.of(context).accentColor,
//           fontSize: 30,
//           fontWeight: FontWeight.bold,
//           shadows: <Shadow>[
//             Shadow(
//               offset: Offset(3, 3),
//               blurRadius: 2.0,
//               color: Colors.black,
//             ),
//           ],
//         ),
//       ),
//     )
//     // Center(
//     //     child:
//     //     FadeInImage.assetNetwork(
//     //       placeholder: 'assets/loading.gif',
//     //       image: (AppUrl.imageUrl + image),
//     //       fit: BoxFit.fitWidth,
//     //       height: 200,
//     //       width: 100,
//     //     )),
//     //
//   ],
// ),