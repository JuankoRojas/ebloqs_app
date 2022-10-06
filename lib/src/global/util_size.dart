import 'package:flutter/material.dart';

abstract class UtilSize {
  static const double _baseHeight = 812;
  static const double _baseWidth = 375;
  static double height(double heightX, BuildContext context) {
    return MediaQuery.of(context).size.height * heightX / _baseHeight;
    // return ((MediaQuery.of(context).size.height*heightX/_baseHeight)+(MediaQuery.of(context).size.width*heightX/_baseWidth))/2;
  }

  static double width(double widthX, BuildContext context) {
    return MediaQuery.of(context).size.width * widthX / _baseWidth;
  }
}
