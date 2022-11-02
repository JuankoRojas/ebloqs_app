import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TransactionsService with ChangeNotifier {
  Uri baseUrl = Uri.parse('https://www.api.ebloqs.com/transactions/new');

  Future createTransaction(
      {required String token,
      required String id,
      required String refId,
      required String client,
      required String amount,
      required String clientName,
      required String paymentNumber,
      required int status,
      required int type}) async {
    final transactionData = {
      'id': id,
      'customer': client,
      'amount': amount,
      'customer_name': clientName,
      "customer_id_ref": refId,
      'payment_number': paymentNumber,
      'status': status,
      'type': type
    };
    final transactionEncoded = convert.jsonEncode(transactionData);

    try {
      final response = await http.post(
        baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: transactionEncoded,
      );

      switch (response.statusCode) {
        case 201:
          final responseData = convert.jsonDecode(response.body);
          print(responseData);
          return responseData;

        case 401:
          throw Exception('Invalid transaction');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
