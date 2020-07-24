import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationDisplayScreen extends StatelessWidget {

  String name,email,query;
  InformationDisplayScreen(name,email,query) {
    this.name = name;
    this.email = email;
    this.query = query;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Information Display"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Name: $name",style: TextStyle(color: Colors.white,fontSize: 20)),
            Text("Email: $email",style: TextStyle(color: Colors.white,fontSize: 20)),
            Text("Query: $query",style: TextStyle(color: Colors.white,fontSize: 20))
          ],
        ),
      ),
    );
  }

}