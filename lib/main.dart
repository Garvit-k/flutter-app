/*
* @author : Garvit Kothari
*/

import 'package:flutter/material.dart';
import 'package:flutter_app/CalculatorScreen.dart';
import 'package:flutter_app/DataBaseLogic.dart';
import 'package:flutter_app/EasterEgg.dart';
import 'package:flutter_app/SecondScreen.dart';

import 'InputScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: FirstScreen(),
    );
  }

}

class FirstScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(title: Text("Application"),),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hello Everyone", style: TextStyle(color: Colors.white,fontSize: 30),),
            RaisedButton(child: Text("Timer"),
              onLongPress: () {
              navigateToLongPress(context);
              },
              color: Colors.red,
              onPressed: () {
                navigateToSecondPage(context);
              },),
            RaisedButton(child: Text("Calculator"),
              color: Colors.red,
              onLongPress: () {
              navigateToLongPress(context);
              },
              onPressed: () {
                navigateToCalculatorPage(context);
              },),
            RaisedButton(child: Text("Information Enter"),
            color: Colors.red,
              onLongPress: () {
              navigateToLongPress(context);
              },
              onPressed: () {
              navigateToInputScreen(context);
              },
            ),
            RaisedButton(child: Text("DataBase"),
              color: Colors.red,
              onLongPress: () {
                navigateToLongPress(context);
              },
              onPressed: () {
                navigateToDataBaseScreen(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future navigateToSecondPage(context) async {
    Navigator.push(context , MaterialPageRoute(builder:
        (context) => SecondScreen()));
  }

  Future navigateToCalculatorPage(context) async {
    Navigator.push(context , MaterialPageRoute(builder:
        (context) => CalculatorScreen()));
  }
  Future navigateToLongPress(context) async {
    Navigator.push(context , MaterialPageRoute(builder:
        (context) => EasterEgg()));
  }

  Future navigateToInputScreen(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => InputScreen()));
  }
  Future navigateToDataBaseScreen(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DataBaseLogic()));
  }

}