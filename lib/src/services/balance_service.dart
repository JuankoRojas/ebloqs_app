import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BalanceService with ChangeNotifier {
  Future getBalanceOf(
      {required String accesstoken, required String publicKey}) async {
    print(Preferences.public_key);
    try {
      final response = await http.get(
        Uri.parse('https://www.api.ebloqs.com/wallet/balanceOf/$publicKey'),
        headers: <String, String>{
          'Authorization': 'Bearer $accesstoken',
        },
      );
      print('estatus code ${response.statusCode}');
      if (response.statusCode == 200) {
        var jsonRespon = await convert.jsonDecode(response.body);
        print('datos : ${jsonRespon['data']}');
        return jsonRespon['data'];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
