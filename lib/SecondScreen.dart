/*
* @author : Garvit Kothari
*/
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TimerAppState();
  }

}

class TimerAppState extends State<SecondScreen>{
  static const duration = Duration(seconds: 1);
  bool isActive = false;
  int secondsPassed = 0;
  Timer timer;

  void handleTick(){
    if(isActive){
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    if(timer == null){
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }

    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/60;
    int hours = secondsPassed ~/((60 * 60));

    return Scaffold(
      appBar: AppBar(title: Text('Timer App'),),
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  CustomTextContainer(hours.toString().padLeft(2,'0'),'Hour'),
                  CustomTextContainer(minutes.toString().padLeft(2,'0'),'Min'),
                  CustomTextContainer(seconds.toString().padLeft(2,'0'),'Sec'),
                ],
              ),
              RaisedButton(
                child: Text(isActive ? 'Stop' : 'Start'),
                onPressed: (){
                  setState(() {
                    isActive = !isActive;
                  });
                },
              )
            ],
          )
      ),
    );
  }

}


class CustomTextContainer extends StatelessWidget{
  String label, value;

  CustomTextContainer( this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: new BoxDecoration(
        color: Colors.blue,
        borderRadius: new BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('$value', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40
          ),),
          Text('$label',style: TextStyle(
              color: Colors.white,
              fontSize: 10
          ))
        ],
      ),
    );
  }
}