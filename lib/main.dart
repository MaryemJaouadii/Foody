import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodproject/constants.dart';
import 'package:foodproject/screens/HomeScreen.dart';
import 'package:foodproject/screens/LoginTab.dart';
import 'package:foodproject/screens/Profile.dart';
import 'package:foodproject/screens/RegisterTab.dart';
import 'package:foodproject/screens/cameraDetection.dart';
import 'package:foodproject/screens/favoriteRecipes.dart';

import 'screens/SplashScreen.dart';

List<CameraDescription> cameras = {} as List<CameraDescription>;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(brightness: Brightness.light, fontFamily: 'Poppins'),
    );
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
          fontFamily: 'Poppins',
          primaryColor: kPrimaryColor,
          focusColor: kSecondColor,
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: kPrimaryColor,
              onPrimary: kSecondColor,
              secondary: kSecondColor,
              onSecondary: kSecondColor,
              error: kGreen,
              onError: kGreen,
              background: Colors.white,
              onBackground: Colors.white,
              surface: Colors.white,
              onSurface: Colors.white)),
      initialRoute: LoginTab.id,
      routes: {
        LoginTab.id: (context) => LoginTab(),
        RegisterTab.id: (context) => RegisterTab(),
        HomeScreen.id: (context) => HomeScreen(),
        FavoriteRecipes.id: (context) => FavoriteRecipes(),
        CameraDetection.id: (context) => CameraDetection(),
        FavoriteRecipes.id: (context) => FavoriteRecipes(),
        Profile.id: (context) => Profile(),
      },
    );
  }
}
