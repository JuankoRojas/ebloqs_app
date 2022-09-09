import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ImagesProvider with ChangeNotifier {
  String? _imageFrontPath;
  XFile? _imageFrontFile;
  String? _imageBackPath;
  XFile? _imageBackFile;

//SETTERS
  set imageFrontPath(String? value) {
    _imageFrontPath = value;
    notifyListeners();
  }

  set imageFrontFile(XFile? value) {
    _imageFrontFile = value;
    notifyListeners();
  }

  set imageBackPath(String? value) {
    _imageBackPath = value;
    notifyListeners();
  }

  set imageBackFile(XFile? value) {
    _imageBackFile = value;
    notifyListeners();
  }

  //GETTERS

  String? get imageGetFrontPath => _imageFrontPath;

  XFile? get imageGetFrontFile => _imageFrontFile;

  String? get imageGetBackPath => _imageBackPath;

  XFile? get imageGetBackFile => _imageBackFile;
}
