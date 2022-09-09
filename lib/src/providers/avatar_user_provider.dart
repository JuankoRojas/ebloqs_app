import 'package:flutter/material.dart';

class AvatarUserProvider with ChangeNotifier {
  String? _avatarUser;

  String? get avatarUser => _avatarUser;

  set avatarSetUser(String? avatarUser) {
    _avatarUser = avatarUser;
    notifyListeners();
  }
}
