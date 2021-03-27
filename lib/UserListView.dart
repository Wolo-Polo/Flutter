import 'package:flutter/material.dart';
import 'package:flutter_app/User.dart';

class UserListView extends StatelessWidget{
  List<User> users;
  UserListView({this.users});

  ListView buildListView(){
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){
            return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 10,
                color: index % 2 == 0 ? Colors.green : Colors.deepPurple,
                child: ListTile(
                    title: Text(users[index].userName, style: TextStyle(color: Colors.white),),
                    leading: const Icon(Icons.clear),
                    subtitle: Text(users[index].code.toString()),
                    onTap: (){
                      print("Click: ${users[index].userName} - ${users[index].code}");
                    }
                )
            );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    //how to make 'Scrollable' ==> let use ListView
    //1. ListView(child: <Widget>[]) ==> to load all children at the same time
    //2. ListView(itemBuilder: ...) ==> to load only visible items
    return Container(
      height: 500,
      child: buildListView(),
    );
  }
  
}