/*
* @author : Garvit Kothari
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/CalculatorLogic.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CalculatorState();
  }
}

class CalculatorState extends State<CalculatorScreen> {
  TextEditingController number1controller = new TextEditingController();
  TextEditingController number2controller = new TextEditingController();
  CalculatorLogic calculatorLogic = new CalculatorLogic();
  String answer = "";

  void clear() {
    number1controller.clear();
    number2controller.clear();
    setState(() {
      answer="";
    });
  }
  void calculate(String s) {
    setState(() {
      double num1 = double.parse(number1controller.text);
      double num2;
      if(number2controller.text.length==0) {
        num2=0.0;
      } else {
        num2 = double.parse(number2controller.text);
      }

      switch(s) {
        case "Add" :{
          answer = calculatorLogic.add(num1, num2).toString();
        }
        break;
        case "Sub" :{
          answer = calculatorLogic.sub(num1, num2).toString();
        }
        break;
        case "Mul" :{
          answer = calculatorLogic.mul(num1, num2).toString();
        }
        break;
        case "Div" :{
          answer = calculatorLogic.div(num1, num2).toString();
        }
        break;
        case "Pow" :{
          answer = calculatorLogic.power(num1, num2).toString();
        }
        break;
        case "Log" :{
          answer = calculatorLogic.logrit(num1).toString();
        }
        break;
        case "sin":{
          answer = calculatorLogic.sina(num1).toString();
        }
        break;
        case "cos":{
          answer = calculatorLogic.cosa(num1).toString();
        }
        break;
        case "tan":{
          answer = calculatorLogic.tana(num1).toString();
        }

      }
      answer = answer.toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      appBar: AppBar(title: Text("Calculator"),),
      backgroundColor: Colors.black,
      body: Column (
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("Enter a number", style: TextStyle(color: Colors.white,fontSize: 25),),
          TextField(
            controller: number1controller,
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                hintText: "Enter Number",
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                ),
                labelText: "Number 1"
            ),
          ),
          Text("Enter another number", style: TextStyle(color: Colors.white,fontSize: 25),),
          TextField(
            controller: number2controller,
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.white70,
              filled: true,
              hintText: "Enter Number",
              border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
              ),
              labelText: "Number 2"
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(child: Text("Add"),
                onPressed: () {
                  calculate("Add");
                },),
              RaisedButton(child: Text("Sub"),
              onPressed: () {
                calculate("Sub");
                },),
              RaisedButton(child: Text("Multiply"),
                onPressed: () {
                  calculate("Mul");
                },),
              RaisedButton(child: Text("Divide"),
                onPressed: () {
                  calculate("Div");
                },),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(child: Text("Sin"),
                onPressed: () {
                  calculate("sin");
                },),
              RaisedButton(child: Text("Cos"),
                onPressed: () {
                  calculate("cos");
                },),
              RaisedButton(child: Text("Tan"),
                onPressed: () {
                  calculate("tan");
                },),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(child: Text("Power"),
                onPressed: () {
                  calculate("Pow");
                },),
              RaisedButton(child: Text("Log"),
                onPressed: () {
                  calculate("Log");
                },),
              RaisedButton(child: Text("Clear"),
                onPressed: () {
                  clear();
                },),
            ],
          ),
          Text("Answer $answer",style: TextStyle(color: Colors.white,fontSize: 30),)
        ],
      ),
    );
  }


  
}