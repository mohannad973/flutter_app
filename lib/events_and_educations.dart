import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:ora_app/Models/CoursesResponse.dart';
import 'package:ora_app/Models/EventResponse.dart';
import 'package:ora_app/app_bar.dart';
import 'package:ora_app/bottom_navigation_bar.dart';
import 'package:ora_app/modules.dart';
import 'package:ora_app/widget/MainWidget.dart';

import 'Events/courseDetail.dart';
import 'Events/eventsDetail.dart';
import 'Network/API.dart';
import 'course_details.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class EventsAndEducations extends StatefulWidget {
  @override
  _EventsAndEducationsState createState() => _EventsAndEducationsState();
}

Widget educationCard() {
  return Expanded(
    child: Container(
      color: Colors.blue,
    ),
  );
}

Widget eventCard() {
  return Expanded(
    child: Container(
      color: Colors.red,
    ),
  );
}

class _EventsAndEducationsState extends State<EventsAndEducations> {
  Widget bodyWidget = eventCard();

  /*List<Course> coursesList = [Course(url: '' , isPaid: false , description: 'fshd sfhs hfs fkjgs dfjksdgfjk sdkfgkjdsgfkj dsfkjgsdfjksdk fgkdjsfgskj fgdsj' , name: 'Course 1' ),
    Course(url: '' , isPaid: true , description: 'kjsfg dskjfgks' , name: 'Course 2' ),
    Course(url: '' , isPaid: true , description: '' , name: 'Course 3' ),
    Course(url: '' , isPaid: false , description: '' , name: 'Course 4'),];*/
  // List<String> eventsList = ['Event 1' , 'Event 2' , 'Event 3'];

  var coursesList = new CoursesResponse();
  var eventsList = new EventsResponse();

  _getCources() async {
    await API.getCources().then((response) {
      setState(() {
        coursesList = coursesResponseFromJson(response.body.toString());
        coursesList.courses.add(Course(id: 1,title: "course 1",description: "flutter app development using dart language",videoUrl: "ExKYjqgswJg"));
      });
    });
    //print(categories[0].engName);
    return coursesList;
  }

  _getEvents() async {
    await API.getEvents().then((response) {
      setState(() {
        eventsList = eventsResponseFromJson(response.body.toString());
      });
    });
    return eventsList;
  }

  @override
  void initState() {
    super.initState();
    _getCources();
    _getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: GradientAppBar(
          title: Text(
            'Events & Educations',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w500,
              fontSize: 22.0,
            ),
          ),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
            ],
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Events'),
              Tab(text: 'Educations'),
            ],
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: TabBarView(
          children: [
            (eventsList.events == null)
                ? Center(
                    child: CircularProgressIndicator(
                    backgroundColor: Colors.teal,
                  ))
                : Expanded(
                    child: GridView.count(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      scrollDirection: Axis.vertical,
                      childAspectRatio: 1.8,
                      children: eventsList.events.map((Event value) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EventDetail()),
                            );
                          },
                          child:
                              MainWidget(value.title, value.imageUrl, context),
                        );
                      }).toList(),
                    ),
                  ),
            (coursesList.courses == null)
                ? Center(
                    child: CircularProgressIndicator(
                    backgroundColor: Colors.teal,
                  ))
                : Expanded(
                    child: GridView.count(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      scrollDirection: Axis.vertical,
                      childAspectRatio: 1.8,
                      children: coursesList.courses.map((Course value) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CourseDetail()),
                            );
                          },
                          child: MainWidget(value.title, "", context),
                        );
                      }).toList(),
                    ),
                  ),
          ],
        ),

      ),
    );
  }
}

Widget eventsWidget(String title, String imageUrl, BuildContext context) {
  return Container(
    height: 200,
    child: GestureDetector(
      onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => Products(
//                          )),
//                    );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children: <Widget>[
//                        ClipRRect(
//                          borderRadius: BorderRadius.circular(20.0),
//                          child: Image(
//                            width: double.infinity,
//                            height: double.infinity,
//                            fit: BoxFit.fitWidth,
//                            image: AssetImage('assets/$value.png'),
//                          ),
//                        ),
            Container(
              child: Image(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fitWidth,
                image: NetworkImage('http://ora.hashtagweb.online' + imageUrl),
              ),
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(13, 128, 133,0.4),
                    Color.fromRGBO(13, 128, 133,0.4),
//                                Color.fromRGBO(39, 92, 93, 0.4),
//                                Color.fromRGBO(126, 184, 186, 0.4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.5, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
            Center(
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
            )
          ],
        ),
      ),
    ),
  );
}
