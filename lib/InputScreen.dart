/*
* @author : Garvit Kothari
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/InformationDisplayScreen.dart';

class InputScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Enter();
  }
  
}

class Enter extends State<InputScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController queryController = new TextEditingController();
  bool emailError = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Enter Your Details", style: TextStyle(color: Colors.white),),),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network("https://placeimg.com/640/480/tech"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            margin: EdgeInsets.all(20),
          ),
          Text("Enter Your Name", style: TextStyle(color: Colors.blue,fontSize: 25),),
          TextField(
            controller: nameController,
            style: TextStyle(color: Colors.red),
            decoration: InputDecoration(
              labelText: "Your Name",
              hintText: "John Smith",
              fillColor: Colors.white70,
              filled: true,
              hintStyle: TextStyle(color: Colors.white70),
              border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
              ),
            ),
          ),
          Text("Enter Your Email", style: TextStyle(color: Colors.blue,fontSize: 25),),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.red),
            decoration: InputDecoration(
              fillColor: Colors.white70,
              filled: true,
              labelText: "Your Email",
              hintText: "hello@example.com",
              errorText: (emailError)? 'Invalid Email' : '',
              hintStyle: TextStyle(color: Colors.white70),
              border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
              ),
            ),
          ),
          Text("Enter Your Queries", style: TextStyle(color: Colors.blue,fontSize: 25),),
          TextField(
            controller: queryController,
            style: TextStyle(color: Colors.red),
            decoration: InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                hintText: "Hello",
                hintStyle: TextStyle(color: Colors.white70),
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                ),
                labelText: "Your Queries"
            ),
          ),
          RaisedButton(child: Text("Submit",style: TextStyle(color: Colors.white),),
          color: Colors.blue,
          onPressed: () {
            navigateToInformationDisplayScreen(context);
          },)
        ],
      ),
    )
    );
  }
  Future navigateToInformationDisplayScreen(BuildContext context) async {
    bool emailValid = RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)").hasMatch(emailController.text);
    if(!emailValid) {
      setState(() {
        emailError = true;
      });
      return;
    }
    if(nameController.text.isEmpty || emailController.text.isEmpty || queryController.text.isEmpty) {
      return;
    }
    
    Navigator.push(context, MaterialPageRoute(builder: (context) => InformationDisplayScreen(
      nameController.text,
      emailController.text,
      queryController.text
    )
    )
    );
  }
}