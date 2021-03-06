import 'package:flutter/material.dart';
import 'package:flutter_app/MyWidget.dart';
import 'package:flutter_app/MyWidgetState.dart';
import 'package:flutter_app/DateTimeAndIntl.dart';
import 'package:flutter_app/SafeArea.dart';
void main() {
  runApp(
      MaterialApp(
        title: "My SafeArea, Column, FlatButton, TextField",
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.green,
          fontFamily: "Lobster-Regular",
        ),
        home: MySafeArea()
      )
  );
}
