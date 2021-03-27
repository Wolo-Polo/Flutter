import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DateTimeSate();
  }
}

class _DateTimeSate extends State<DateTimeWidget>{
  DateTime dateTimeNow = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo using datetime in Dart and Intl library",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat("dd/MM/yyyy hh:mm:ss").format(dateTimeNow),
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              Text(
                NumberFormat("#.1#").format(188.16308),
                style: TextStyle(fontSize: 20, color: Colors.yellowAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }

}