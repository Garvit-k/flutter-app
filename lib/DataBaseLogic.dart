/*
* @author : Garvit Kothari
*/

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class DataBaseLogic extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DataBase();
  }
  
}

class DataBase extends State<DataBaseLogic> {
  String hash="";

   String passwordHash(String pass,String salt) {
     var bytes = utf8.encode(pass+salt);
     Digest digest = sha256.convert(bytes);
     return digest.toString();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextEditingController passController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("DataBase"),),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Enter A Password",style: TextStyle(color: Colors.white),),
          TextField(
            controller: passController,
            style: TextStyle(color: Colors.red),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              labelText: "Password",
              fillColor: Colors.white70,
              filled: true,
              hintStyle: TextStyle(color: Colors.white70),
              border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
              ),
            ),
          ),
          RaisedButton(child: Text("Submit"),
          onPressed: () {
            submit(passController.text);
          },),
          Text("Your password Hash is $hash",style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
  void submit(pass) {
     setState(() {
       hash = passwordHash(pass,"hello");
     });
  }
  
}