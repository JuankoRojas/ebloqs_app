import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetAllUserService with ChangeNotifier {
  List<Map<String, String>> _users = [];
  List<Map<String, String>> get users => _users;

  Future getAllUsers() async {
    try {
      final response = await http.get(
        Uri.parse('https://www.api.ebloqs.com/user/all'),
      );
      if (response.statusCode == 200) {
        _users = (json.decode(response.body) as List)
            .map((e) => Map<String, String>.from(e))
            .toList();
        var names = _users.map((names) => names['name'] as String).toList();
        return names;
      }
    } catch (e) {
      print(e);
    }
  }
}
