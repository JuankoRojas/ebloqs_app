import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthUserService with ChangeNotifier {
  Uri url = Uri.parse('https://agile-beach-41948.herokuapp.com/auth/register');
  Future registerUser(
      {required String email,
      required String name,
      required String deviceID,
      required String type_acount}) async {
    final userData = {
      'email': email,
      'name': name,
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
          var jsonResponse =
              convert.jsonDecode(response.body) as Map<String, dynamic>;
          return jsonResponse;
      }
    } catch (e) {
      print(e);
    }
  }
}
