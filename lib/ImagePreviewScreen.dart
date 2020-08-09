import 'dart:io';
import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

class ImagePreviewScreen extends StatefulWidget {
  String imagePath;

  ImagePreviewScreen({this.imagePath});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImagePreviewState();
  }
}

class ImagePreviewState extends State<ImagePreviewScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Image Preview",style: TextStyle(color: Colors.white),),),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Image.file(File(widget.imagePath),fit: BoxFit.cover,),
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: RaisedButton(
                  child: Text("Share"),
                  onPressed: () {
                    getByteFromImage().then((bytes) {
                      Share.file("Share Via", basename(widget.imagePath), bytes.buffer.asUint8List(), "image/png");
                    } );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<ByteData> getByteFromImage() async{
    Uint8List bytes = File(widget.imagePath).readAsBytesSync();
    return ByteData.view(bytes.buffer);
  }

}
