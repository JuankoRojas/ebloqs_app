import 'package:flutter/material.dart';

class CoinMarketProvider with ChangeNotifier {
  String? _id;
//GETTERS
  String? get id => _id;
//SETTERS
  void setId(String? id) {
    _id = id;
    notifyListeners();
  }
}
