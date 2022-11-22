import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class InvestmentsService with ChangeNotifier {
  Future getAllInvestments({required String accesstoken}) async {
    try {
      final responseInvestments = await http.get(
        Uri.parse('https://www.api.ebloqs.com/proyects/get'),
        headers: <String, String>{
          'Authorization': 'Bearer $accesstoken',
        },
      );
      if (responseInvestments.statusCode == 200) {
        var jsonRespon = await convert.jsonDecode(responseInvestments.body);
        print('proyectos: ${jsonRespon['proyects']}');
        return jsonRespon['proyects'];
      }
    } catch (e) {
      print(e);
    }
  }

  Future getActualInvestment(
      {required String accesstoken, required String idProyect}) async {
    final investmentData = {"idProyect": idProyect};
    try {
      final responseInvestments = await http.post(
          Uri.parse('https://www.api.ebloqs.com/proyects/getOne'),
          headers: <String, String>{
            'Authorization': 'Bearer $accesstoken',
          },
          body: convert.jsonEncode(investmentData));
      if (responseInvestments.statusCode == 200) {
        var jsonRespon = await convert.jsonDecode(responseInvestments.body);
        print('proyecto: ${jsonRespon['proyects']}');
        print('data: ${jsonRespon['data']}');
        print('tokenomic: ${jsonRespon['tokenomic']}');
        return jsonRespon;
      }
    } catch (e) {
      print(e);
    }
  }
}
