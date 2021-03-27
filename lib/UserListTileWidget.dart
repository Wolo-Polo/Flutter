import 'package:flutter/material.dart';
import 'package:flutter_app/User.dart';

class UserListTileWidget extends StatelessWidget{
  List<User> users;
  UserListTileWidget({this.users});

  List<Widget> buidCard(){
    int i = 0;
    return users.map((e) {
      return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          color: i++ % 2 == 0 ? Colors.green : Colors.deepPurple,
          child: ListTile(
              title: Text(e.userName, style: TextStyle(color: Colors.white),),
              leading: const Icon(Icons.clear),
              subtitle: Text(e.code.toString()),
              onTap: (){
                print("Click: ${e.userName} - ${e.code}");
              }
          )
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    //how to make 'Scrollable' ==> let use ListView
    //1. ListView(child: <Widget>[]) ==> to load all children at the same time
    //2. ListView(itemBuilder: ...) ==> to load only visible items
    return Column(
      children: buidCard(),
    );
  }
  
}