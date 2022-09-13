import 'package:flutter/material.dart';

class TransferCurrentProvider with ChangeNotifier {
  int _current = 0;

  //SETTERS
  void setCurrent(int current) {
    _current = current;
    notifyListeners();
  }
  //GETTERS

  int getCurrent() {
    return _current;
  }
}
