import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BalanceService with ChangeNotifier {
  Future getBalance({required String accesstoken}) async {
    try {
      final response = await http.get(
          Uri.parse('https://agile-beach-41948.herokuapp.com/wallet/balance'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Access-Control-Allow-Origin': '*',
            'Authorization': 'Bearer $accesstoken',
          });
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonRespon = await convert.jsonDecode(response.body);
        return jsonRespon['balance'];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
