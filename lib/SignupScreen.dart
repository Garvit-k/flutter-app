import 'package:flutter/cupertino.dart';
import 'package:flutter_app/PasswordOperation.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Signup();
  }

}
class Signup extends State<SignupScreen> {
  String hash="";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextEditingController passController = new TextEditingController();
    TextEditingController usernameController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Sign up"),),
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
          RaisedButton(child: Text("Sign up"),
            onPressed: () {
              submit(usernameController.text,passController.text);
            },),
        ],
      ),
    );
  }

  void submit(username, pass) {
    hash = PasswordOperation().getPasswordHash(pass, "hello");
  }

}