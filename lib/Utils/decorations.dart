import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

InputDecoration inputDecoration() {
  return InputDecoration(
    fillColor: Colors.grey[200],
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[400], width: 0.5),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.teal, width: 0.5),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
  );
}

InputDecoration passwordDecoration() {
  return InputDecoration(
    fillColor: Colors.grey[200],
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[400], width: 0.5),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.teal, width: 0.5),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    prefixIcon: Icon(
      Icons.lock,
    ),
  );
}