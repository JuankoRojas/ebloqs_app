import 'package:flutter/material.dart';

class UserInfoProvider with ChangeNotifier {
  String? _email;
  Map? _userInfo;

  //GETTERS
  get emailget {
    print(_email);
    return _email;
  }

  get userInfoget {
    return _userInfo;
  }

  //SETTERS
  void emailset(String? email) {
    _email = email;
    notifyListeners();
  }

  void userInfoSet(Map? userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }
}
