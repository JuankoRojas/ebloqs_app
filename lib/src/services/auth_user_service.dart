import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthUserService with ChangeNotifier {
  Uri url = Uri.parse('http://10.0.2.2:3000/auth/register');
  Future registerUser(
      {required String email,
      required String deviceID,
      required String type_acount}) async {
    final userData = {
      'email': email,
      'deviceID': deviceID,
      "type_acount": type_acount
    };
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.jsonEncode(userData),
      );

      switch (response.statusCode) {
        case 201:
          return response.body;
      }
    } catch (e) {
      print(e);
    }
  }
}
