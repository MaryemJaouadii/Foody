import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:foodproject/Components/myAppBar.dart';
import 'package:tflite/tflite.dart';
import '/main.dart';
import 'package:foodproject/constants.dart';
class CameraDetection extends StatefulWidget {
  static const String id = 'detect';
  const CameraDetection({Key? key}) : super(key: key);

  @override
  _CameraDetectionState createState() => _CameraDetectionState();
}

class _CameraDetectionState extends State<CameraDetection> {

  bool isWorking=false;
  String result="";
  late CameraController cameraController;
  late CameraImage imgCamera;

  loadModel()async
  {
    await Tflite.loadModel(model: "assets/mobilenet_v1_1.0_224.tflite",labels:"assets/mobilenet_v1_1.0_224.txt" );
  }

  @override
  void initState(){
    super.initState();
    loadModel();
    cameraController=CameraController(cameras[0],ResolutionPreset.medium);
    cameraController.initialize().then((value)
    {
      if(!mounted){
        return;
      }

      setState(() {
        cameraController.startImageStream((image) =>
        {
          if(!isWorking){
            isWorking=true,
            imgCamera=image,
            runModelOnStreamFrames()
          }
        });
      });
    });

  }
  runModelOnStreamFrames()async {
    if(imgCamera!=null){
      var recognitions=await Tflite.runModelOnFrame(bytesList: imgCamera.planes.map((e) {
        return e.bytes;
      }).toList(),
        imageHeight: imgCamera.height,
        imageWidth: imgCamera.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 2,
        threshold: 0.1,
        asynch:true,);
      result="";
      recognitions?.forEach((element) {
        result +=element["label"]+" "+(element["confidence"]as double).toStringAsFixed(2)+"\n\n";
      });
      setState(() {
        result;
      });
      isWorking=false;
    }
  }
  @override
  Future<void> dispose() async {
    super.dispose();
    await Tflite.close();
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child:Scaffold(
          appBar: const myAppBar(),
          body: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(

                      child: Container(
                        margin: EdgeInsets.only(top:35),
                        height: 270,
                        width: 360,
                        child:AspectRatio(
                          aspectRatio: cameraController.value.aspectRatio,
                          child: CameraPreview(cameraController),),
                      ),
                    ),

                  ],
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top:55.0),
                    child: SingleChildScrollView(
                      child: Text(
                        result,
                        style:TextStyle(

                          fontSize: 30.0,
                          color: kGrey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

        ),
      ),
    );
  }/*
  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      return Container(
        margin: EdgeInsets.only(top:35),
        height: 270,
        width: 360,
        child: imgCamera == null
            ?Container(
          height: 270,
          width: 360,
          child: Icon(Icons.photo_camera_front,color: Colors.blueAccent,size:40,),
        )
            :AspectRatio(
          aspectRatio: cameraController.value.aspectRatio,
          child: CameraPreview(cameraController),),
      );
    }
    /*return MaterialApp(
      home: CameraPreview(cameraController),
    );*/
  }*/
}

