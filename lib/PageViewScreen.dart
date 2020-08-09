import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/CameraScreen.dart';

class PageViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageViewDemo();
  }

}

class PageViewDemo extends State<PageViewScreen> {
  PageController pageController = new PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return PageView(
      controller: pageController,
      children: <Widget>[
        Page1(),
        Page2(),
        Page3(),
        CameraScreen(),
      ],
    );

  }

}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Page 1", style: TextStyle(color: Colors.white),),),
      backgroundColor: Colors.black,
      body: Center(
        child: Text("Hello",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Page 2", style: TextStyle(color: Colors.white),),),
      backgroundColor: Colors.black,
      body: Center(
        child: Text("Hello World",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Page 3", style: TextStyle(color: Colors.white),),),
      backgroundColor: Colors.black,
      body: Center(
        child: Text("Whats up ?",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}