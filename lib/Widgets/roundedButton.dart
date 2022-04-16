import 'package:flutter/material.dart';
import 'package:foodproject/constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(this.text, this.onPress);

  String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: kPrimaryColor),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(text,
              style: TextStyle(
               fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 20.0,
              )),
        ),
      ),
    );
  }
}