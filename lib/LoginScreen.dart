/*
* @author : Garvit Kothari
*/

import 'dart:convert';
import 'package:flutter_app/PasswordOperation.dart';
import 'package:flutter/cupertino.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Login();
  }
  
}

class Login extends State<LoginScreen> {
  String hash="";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextEditingController passController = new TextEditingController();
    TextEditingController usernameController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("DataBase"),),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Enter A Username",style: TextStyle(color: Colors.white),),
          TextField(
            controller: usernameController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: "Username",
              hintText: 'Enter username',
              fillColor: Colors.white70,
              filled: true,
              hintStyle: TextStyle(color: Colors.white),
              border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
              ),
            ),
          ),
          Text("Enter A Password",style: TextStyle(color: Colors.white),),
          TextField(
            controller: passController,
            style: TextStyle(color: Colors.black),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(child: Text("Login"),
                onPressed: () {
                  submit(passController.text);
                },),
              RaisedButton(child: Text("Sign up"),
                onPressed: () {
                  navigateToSignupScreen(context);
                },),
            ],
          ),

          Text("Your password Hash is $hash",style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
  void submit(pass) {
     setState(() {
       hash = PasswordOperation().getPasswordHash(pass,"hello");
     });
  }

  Future navigateToSignupScreen(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
  }
  
}