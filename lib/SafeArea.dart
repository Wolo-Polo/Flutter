import 'package:flutter/material.dart';
import 'package:flutter_app/User.dart';
import 'package:flutter_app/UserListTileWidget.dart';

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

  User _user = User(userName: "", password: "", code: 0);
  List<User> _users = List<User>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My SafeArea, Column, FlatButton, TextField",
      home: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          minimum: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "User name"),
                  controller: _userNameController,
                  onChanged: (text){
                    _user.userName = text;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: _passwordController,
                  onChanged: (password){
                    _user.password = password;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Code"),
                  controller: _codeController,
                  onChanged: (number){
                    _user.code = int.parse(number) ?? 0; //if tect = null or convert fail ==> _code = 0
                  },
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10)
                ),
                ButtonTheme(
                  height: 40,
                  child: FlatButton(
                    child: Text("Insert new user"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: (){
                      //print("Username: ${_user.userName} Code: ${_user.code}");
                      setState(() {
                        _users.add(_user);
                        _user = User(userName: "", password: "", code: 0);
                        _userNameController.clear();
                        _passwordController.clear();
                        _codeController.clear();
                      });

                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            //content: Text("Username: ${_user.userName} \nCode: ${_user.code}"),
                            content: Text("${_users.toString()}"),
                            duration: Duration(seconds: 3),
                          )
                      );
                    },
                  ),
                ),
                UserListTileWidget(users: _users,),
              ],
            ),
          )
        ),
      ),
    );
  }

}