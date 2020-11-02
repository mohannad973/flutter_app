import 'package:flutter/material.dart';
import 'package:ora_app/app_bar.dart';
import 'package:ora_app/bottom_navigation_bar.dart';
import 'package:ora_app/contact_us/body.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: topBar(context, barWithBack(context), Text ('Contact Us') , barWithSearch(context)),
      body: ContactUsBody(),
    );
  }
}
