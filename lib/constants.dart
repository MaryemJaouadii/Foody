import 'package:flutter/material.dart';


const kGreen = Color(0xFF38bf72);
const kGrey = Color(0xFF848BA4);


final khintStyle= TextStyle(
  fontWeight: FontWeight.bold,
  color: kGrey,
);


final kTextFieldDecoration = InputDecoration(
  hintText: 'Type your message here...',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black12, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kGreen, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);



final kFoodHealthDetailsStyle = TextStyle(
    color: Colors.black.withOpacity(0.5),
    fontSize: 15,
    fontFamily: 'Poppins-Regular',
    decoration: TextDecoration.none);


//#f93e65
final kGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end:Alignment.topRight,
  //Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
  colors: <Color>[
    Color(0xfff93e65),
    Color(0xfff9845f)
  ], // red to yellow
  //tileMode: TileMode.repeated, // repeats the gradient over the canvas
);