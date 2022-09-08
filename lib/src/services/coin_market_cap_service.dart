import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoinMarketCapService with ChangeNotifier {
  Future getCryptoPrices() async {
    var response = await http.get(
        Uri.parse(
            "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=5000&convert=USD"),
        headers: {
          'X-CMC_PRO_API_KEY': 'e5421cfd-c95b-49e1-8267-29777bb45e02',
          "Accept": "application/json",
        });

    if (response.statusCode == 200) {
      return response.body;
    }
  }
}
