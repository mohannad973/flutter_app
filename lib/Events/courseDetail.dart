import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class CourseDetail extends StatefulWidget {
  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {

  var top = 0.0;
  YoutubePlayerController _controller;

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'ExKYjqgswJg',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height*0.4,
            child: YoutubePlayerBuilder(
              builder: (context, player) => Container(),
              player: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
                onReady: () {
                  _isPlayerReady = true;
                },
              ),
            ),
          ),

          Container(
            decoration: new BoxDecoration(
                color: Color(0xFF599DA0),
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(0.0),
                  topRight: const Radius.circular(0.0),
                )),
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[

                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30,left: 30,bottom: 20),
                        child: Text(
                          "Flutter Introduction",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 0,right: 30,left: 30,bottom: 30),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ind"
                          "my text of the printing and typesetting industry. Lorem Ipsum has been the indmy text of the printing and typesetting industry. Lorem Ipsum has been the indmy text of the printing and typesetting industry. Lorem Ipsum has been the indmy text of the printing and typesetting industry. Lorem Ipsum has been the indmy text of the printing and typesetting industry. Lorem Ipsum has been the indmy text of the printing and typesetting industry. Lorem Ipsum has been the indmy text of the printing and typesetting industry. Lorem Ipsum has been the indmy text of the printing and typesetting industry. Lorem Ipsumy text of the printing and typesetting industry. Lorem Ipsum has been the indmy text of the printing and typesetting industry. Lorem Ipsum has been the indmy text of the printing and typesetting industry. Lorem Ipsum has been the indmy text of the printing and typesetting industry. Lorem Ipsum has been the indmy text of the printing and typesetting industry. Lorem Ipsum has been the indm has been the indmy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley,",
                      style: TextStyle( color: Colors.white,height: 1.5),
                    ),
                  ),


                ],
              ),
            ),
          ),


        ],
      )

    );

  }
}
