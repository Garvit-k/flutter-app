/*
* @author : Garvit Kothari
*/


import 'package:flutter_app/DatabaseHelper.dart';
import 'package:flutter_app/LoginSuccess.dart';
import 'package:flutter_app/PasswordOperation.dart';
import 'package:flutter/cupertino.dart';
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
  String status = "";
  DatabaseHelper _databaseHelper = DatabaseHelper.instance;

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
                  submit(usernameController.text,passController.text);
                },),
              RaisedButton(child: Text("Sign up"),
                onPressed: () {
                  navigateToSignupScreen(context);
                },),
            ],
          ),

          Text("$status",style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
  Future<void> submit(username,pass) async {
     setState(() async{
       List<Map<String,dynamic>> data = await _databaseHelper.getData(username);
       String salt = data[0].values.toList()[3];
       String hash = PasswordOperation().getPasswordHash(pass,salt);
       if(data != null && hash == data[0].values.toList()[1]) {
         navigateToLoginSuccess(context);
       }
       else {
         setState(() {
           status = "Username or Password is wrong";
         });
       }
     });

  }

  Future navigateToSignupScreen(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
  }

  Future navigateToLoginSuccess(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSuccess()));
  }

}