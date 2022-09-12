import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BalanceService with ChangeNotifier {
  Future getBalance({required String accesstoken}) async {
    try {
      final response = await http.post(
        Uri.parse('https://www.api.ebloqs.com/wallet/balance'),
        body: null,
        headers: <String, String>{
          // 'Content-Type': 'application/json; charset=UTF-8',
          // 'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer $accesstoken',
        },
      );
      print('estatus code ${response.statusCode}');
      if (response.statusCode == 201) {
        var jsonRespon = await convert.jsonDecode(response.body);
        print('datos : ${jsonRespon['balance']}');
        return jsonRespon['balance'];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
