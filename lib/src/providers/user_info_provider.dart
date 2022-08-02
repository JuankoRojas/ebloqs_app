import 'package:flutter/material.dart';

class UserInfoProvider with ChangeNotifier {
  String? _email;

  //GETTERS
  get emailget {
    print(_email);
    return _email;
  }

  //SETTERS
  void emailset(String? email) {
    _email = email;
    notifyListeners();
  }
}
