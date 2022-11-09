import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TokenService with ChangeNotifier {
  Uri tokenUrl = Uri.parse('https://www.api.ebloqs.com/tokens/get');
  Future getToken({required String token}) async {
    try {
      final response = await http.get(tokenUrl, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      print(response);
      switch (response.statusCode) {
        case 200:
          var jsonResponse =
              convert.jsonDecode(response.body) as Map<String, dynamic>;
          return jsonResponse;
      }
    } catch (e) {
      print(e);
    }
  }
}
