
//wissal's work is temporary commented

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:foodproject/screens/HomeScreen.dart';
// import 'package:foodproject/screens/LoginTab.dart';
// import 'package:foodproject/screens/RegisterTab.dart';
// import 'package:foodproject/screens/cameraDetection.dart';
//
// import 'package:camera/camera.dart';
//
// List<CameraDescription> cameras={} as List<CameraDescription>;
// Future<void> main() async {
//
//
//   WidgetsFlutterBinding.ensureInitialized();
//
//   cameras= await availableCameras();
//   runApp(HomePage());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CameraDetection(),
//       theme: ThemeData(
//           brightness: Brightness.light,
//         fontFamily: 'Poppins'
//       ),
//     );
//   }
// }
//
//
//
//
//
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3), () {
//       Navigator.of(context)
//           .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//
//         body: Stack(
//           children: [
//                 Image.asset(
//                   'images/splashscreen.png',
//                   width: MediaQuery.of(context).size.width,
//
//                 ),
//             Padding(
//               padding: const EdgeInsets.only(top:600.0),
//               child: Text("Let's cook your own food and adjust your diet!", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),
//             ),
//
//
//           ],
//         ));
//
//
//
//
//   }
// }
//
//
//
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//       theme: ThemeData(
//
//           brightness: Brightness.light,
//       ),
//       initialRoute: LoginTab.id,
//
//       routes: {
//         CameraDetection.id : (context) => CameraDetection(),
//         LoginTab.id: (context)=>LoginTab(),
//         RegisterTab.id: (context)=>RegisterTab(),
//         HomeScreen.id: (context)=>HomeScreen(),
//
//
//
//
//
//
//       },
//     );
//   }
// }
//



import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodproject/screens/HomeScreen.dart';
import 'package:foodproject/screens/LoginTab.dart';
import 'package:foodproject/screens/RegisterTab.dart';
import 'package:foodproject/screens/moreInfo.dart';
import 'package:foodproject/screens/totalRecipes.dart';
import 'package:provider/provider.dart';




void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Poppins'
      ),
    );
  }
}






class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

        body: Stack(
          children: [
            Image.asset(
              'images/splashscreen.png',
              width: MediaQuery.of(context).size.width,

            ),
            const Padding(
              padding: EdgeInsets.only(top:600.0),
              child: Text("Let's cook your own food and adjust your diet!", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),
            ),


          ],
        ));




  }
}




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(

        brightness: Brightness.light,
      ),
      initialRoute: RegisterTab.id,

      routes: {
        LoginTab.id: (context)=>LoginTab(),
        RegisterTab.id: (context)=>RegisterTab(),
        HomeScreen.id: (context)=>HomeScreen(),








      },
    );
  }
}

