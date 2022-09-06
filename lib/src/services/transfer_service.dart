import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TransferService with ChangeNotifier {
  Uri url = Uri.parse('https://www.api.ebloqs.com/wallet/transfer');

  Future transfer({required String to, required String amount}) async {
    final userData = {'to': to, 'amount': amount};
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
          throw Exception('Invalid transfer');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
