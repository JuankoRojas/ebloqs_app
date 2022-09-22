import 'package:ebloqs_app/src/models/get_my_info_model.dart';
import 'package:flutter/material.dart';

class UserInfoProvider with ChangeNotifier {
  String? _email;
  GetMyInfoModel? _userInfo;

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

  void userInfoSet(GetMyInfoModel? userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }
}
