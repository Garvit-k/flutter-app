import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ImagePreviewScreen.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CameraScreenState();
  }

}

class CameraScreenState extends State<CameraScreen> {
  CameraController cameraController;
  int selectedCamera;
  Logger log = new Logger();
  String TAG = "CameraScreen";
  List cameras;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Camera",style: TextStyle(color: Colors.white),),),
      backgroundColor: Colors.black,
      body: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 25,),
             Expanded(
               child: previewCameraWidget(context),
             ),
              SizedBox(height: 25,),
              cameraControllerWidget(context),
              //flipCamera(),
            ],
          ),
        ),
      )
    );
  }

  Widget previewCameraWidget(context) {
    if(cameraController == null || !cameraController.value.isInitialized)
      return Container(
        child: Text("Camera is not initialized",style: TextStyle(color: Colors.white),),
    );
    else {
      return AspectRatio(
        aspectRatio: cameraController.value.aspectRatio,
        child: CameraPreview(cameraController),
      );
    }
  }

  Widget cameraControllerWidget(context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.camera),
              onPressed: (){
                navigateToImagePreview(context);
              },
            ),
          ],
        ),
      ),
    );
  }
/*
  Widget flipCamera() {
    return Align(
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.camera_front),
          onPressed: (){
            setState(() {
              if(selectedCamera==1)
                selectedCamera=0;
              else
                selectedCamera=0;

              initaliseCamera(cameras[selectedCamera]);
            });
          },
        ),
      ],
    ),
    );
  }
  */

  @override
  void initState() {
    availableCameras().then((availableCameras){
      cameras = availableCameras;

      if(cameras.length > 1) {
        selectedCamera = 1;
        setState(() {

        });
      }
      initaliseCamera(cameras[selectedCamera]);
    });
  }

  Future initaliseCamera(CameraDescription cameraDescription) async{
    if(cameraController != null) {
      cameraController.dispose();
    }

    cameraController = CameraController(cameraDescription, ResolutionPreset.max);

    cameraController.addListener(() {
      if(mounted) {
        setState(() {

        });
      }
    });
      try{
        await cameraController.initialize();
      }
      on CameraException catch(e) {
        log.d(TAG," Exception occurred "+e.toString());
      }

  }

  Future navigateToImagePreview(BuildContext context) async {
    final imagePath = join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    await cameraController.takePicture(imagePath);
    Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePreviewScreen(imagePath: imagePath,)));
  }

}