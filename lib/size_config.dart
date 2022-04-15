import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData='' as MediaQueryData;
  static double screenWidth=0;
  static double screenHeight=0;
  static double defaultSize=0;
  static Orientation orientation='' as Orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}
