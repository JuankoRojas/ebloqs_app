import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NftServices with ChangeNotifier {
  Uri nftAvailable =
      Uri.parse('https://www.api.ebloqs.com/api/fractions/TotalSupply');

  Future getNftAvailable({required String nft}) async {
    try {
      var headers = {'Content-Type': 'application/json', 'nft': nft};
      var request = http.Request(
          'GET', Uri.parse('http://3.17.9.188/api/fractions/Available'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String nftAvailableString = await response.stream.bytesToString();
        Map nftAvailableMap = jsonDecode(nftAvailableString);
        return nftAvailableMap['data'];
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
}
