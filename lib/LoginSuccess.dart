import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      appBar: AppBar(title: Text("Login Success", style: TextStyle(color: Colors.white),),),
      backgroundColor: Colors.black,
      body: Center(
        child: Text("Login Successful", style: TextStyle(color: Colors.white,fontSize: 25),),
      ),
    );
  }

}