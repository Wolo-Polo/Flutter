import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget{
  String name;
  int age;

  MyWidget({this.name, this.age});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Đây là ứng dụng đầu tiên của tôi",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            "This my widget \n ${this.name} \n ${this.age}",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }

}