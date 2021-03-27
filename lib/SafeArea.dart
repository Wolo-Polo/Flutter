import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySafeArea extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MySafeAreaState();
  }
}

class _MySafeAreaState extends State{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _codeController = TextEditingController();
  String _userName = "";
  int _code = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My SafeArea, Column, FlatButton, TextField",
      home: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          minimum: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "User name"),
                controller: _userNameController,
                onChanged: (text){
                  _userName = text;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: _passwordController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Code"),
                controller: _codeController,
                onChanged: (number){
                  _code = int.parse(number) ?? 0; //if tect = null or convert fail ==> _code = 0
                },
              ),
              FlatButton(
                child: Text("Forgot password?"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: (){
                  print("Username: ${_userName} Code: ${_code}");
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                        content: Text("Username: ${_userName} Code: ${_code}"),
                        duration: Duration(seconds: 3),
                    )
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

}