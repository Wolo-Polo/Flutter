import 'package:flutter/material.dart';

class MyWidgetState extends StatefulWidget{
  String name;
  int age;

  MyWidgetState({this.name, this.age});

  @override
  State<StatefulWidget> createState() {
    return _MySate();
  }
}

class _MySate extends State<MyWidgetState> with WidgetsBindingObserver{
  String _text;
  final edtText = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init stateeeeeeeee");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    edtText.dispose();
    print("disposeeeeeee");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState){
    super.didChangeAppLifecycleState(appLifecycleState);
    if(appLifecycleState == AppLifecycleState.paused){
      print('app is in background mode');
    }else if(appLifecycleState == AppLifecycleState.resumed){
      print('app is in foreground mode');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "This my state app",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Text value: ${_text}",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 30),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: edtText,
                  onChanged: (text){
                    this.setState(() {
                      _text = text;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Input you name",
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(16),
                      ),
                    )
                  ),
                ),
              ),

            ],
          )
        ),
      ),
    );
  }
  
}