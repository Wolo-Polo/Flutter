import 'package:flutter/material.dart';
import 'package:flutter_app/User.dart';
import 'package:flutter_app/UserListView.dart';

class MySafeArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MySafeAreaState();
  }
}

class _MySafeAreaState extends State {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _codeController = TextEditingController();

  User _user = User(userName: "", password: "", code: 0);
  List<User> _users = List<User>();

  void _insertUser() {
    if (_user.userName.isNotEmpty &&
        _user.password.isNotEmpty &&
        _user.code != 0) {
      _users.add(_user);
      _user = User(userName: "", password: "", code: 0);
      _userNameController.clear();
      _passwordController.clear();
      _codeController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My SafeArea, Column, FlatButton, TextField",
      home: Scaffold(
          appBar: AppBar(
            title: Text("My AppBar"),
            backgroundColor: Colors.red,
            actions: [
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _insertUser();
                    });
                    print('press add icon button');
                  })
            ],
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: "Add new user",
            child: Icon(Icons.add),
            
            backgroundColor: Colors.red,
            onPressed: () {
              setState(() {
                _insertUser();
              });
            },
          ),
          key: _scaffoldKey,
          body: SafeArea(
              minimum:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "User name"),
                      controller: _userNameController,
                      onChanged: (text) {
                        _user.userName = text;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _passwordController,
                      onChanged: (password) {
                        _user.password = password;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Code"),
                      controller: _codeController,
                      onChanged: (number) {
                        _user.code = int.parse(number) ??
                            0; //if tect = null or convert fail ==> _code = 0
                      },
                    ),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
                    ButtonTheme(
                      height: 40,
                      child: FlatButton(
                        child: Text("Insert new user"),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {
                          //print("Username: ${_user.userName} Code: ${_user.code}");
                          setState(() {
                            _insertUser();
                          });

                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            //content: Text("Username: ${_user.userName} \nCode: ${_user.code}"),
                            content: Text("${_users.toString()}"),
                            duration: Duration(seconds: 3),
                          ));
                        },
                      ),
                    ),
                    UserListView(users: _users),
                  ],
                ),
              )
          )
      ),
    );
  }
}
