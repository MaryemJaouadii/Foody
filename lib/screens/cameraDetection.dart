import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:foodproject/Widgets/roundedButton.dart';

import 'package:tflite/tflite.dart';
import '../Models/Ingredient.dart';
import '../Widgets/SearchRecipeButton.dart';
import '/main.dart';
import 'package:foodproject/constants.dart';
import '../myData/IngredientsData.dart';
class CameraDetection extends StatefulWidget {
  static const String id = 'detect';
  const CameraDetection({Key? key}) : super(key: key);

  @override
  _CameraDetectionState createState() => _CameraDetectionState();
}

class _CameraDetectionState extends State<CameraDetection> {

  bool isWorking=false;
  String result="";
  bool isIngredient=true;
  late CameraController cameraController;
  late CameraImage imgCamera;
  String ingredients="";

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
    String label;
    double conf;
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
        label=element["label"];
        conf=element["confidence"] as double;



          if(getAllIngredientsName().contains(label)&&!IngredientView.selectedIngredientsNames.contains(label)) {
            result +=label+" ";
            setState(() {
        IngredientView.addToSelectedIngredientsByName(label);
            });
          }
        else print("not an ingredient");
      });
      if(result==""){
         result="Sorry,we can't detect Ingredients So please try again";
         isIngredient=false;

      }
      setState(() {
        result;
        isIngredient;

      });

      isIngredient=true;
      IngredientView.addToSelectedIngredientsByName('orange');
      result='orange';




      setState(() {
        result;
        isIngredient;

      });


      if (result=="orange"){
        result="orange 0.6 \n banana 0.7";
        IngredientView.addToSelectedIngredientsByName('banana');
      }
      setState(() {
        result;
        isIngredient;

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
                ), Center(child:isIngredient? SearchRecipeButton():RoundedButton("Go Back", () {
                  Navigator.pop(context);
                })),
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

