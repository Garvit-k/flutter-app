/*
* @author : Garvit Kothari
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EasterEgg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("You Found This Nice !!!"),),
      body: 
      new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Asset/michael.jpg'),
          )
        ),
      )
//    Card(child: Image.network("https://i.imgflip.com/281c32.jpg"),)
    );
  }

}