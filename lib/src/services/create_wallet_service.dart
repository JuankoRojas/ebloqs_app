import 'dart:convert' as convert;

import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateWallet with ChangeNotifier {
  Uri url = Uri.parse('https://agile-beach-41948.herokuapp.com/wallet');

  Future createWallet({required String pass}) async {
    final userData = {'password': pass};
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Preferences.token}',
        },
        body: convert.jsonEncode(userData),
      );
      print(response.body);
      switch (response.statusCode) {
        case 201:
          var jsonResponse =
              convert.jsonDecode(response.body) as Map<String, dynamic>;
          return jsonResponse;
        case 401:
          throw Exception('Invalid password');
      }
    } catch (e) {
      print(e);
    }
  }
}
