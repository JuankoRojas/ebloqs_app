import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' show MediaType;

class AuthUserService with ChangeNotifier {
  Uri url = Uri.parse('https://agile-beach-41948.herokuapp.com/auth/register');
  Uri urlUser = Uri.parse('https://agile-beach-41948.herokuapp.com/user/me');
  Future registerUser({
    required String email,
    required String name,
    required String deviceID,
    required String type_acount,
  }) async {
    final userData = {
      'email': email,
      'name': name,
      'deviceID': deviceID,
      "type_acount": type_acount
    };
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
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
          return "No pudimos autenticar tu correo";
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<bool> validateEmailResult({required String accesstoken}) async {
    try {
      final response = await http.post(
          Uri.parse('https://agile-beach-41948.herokuapp.com/user/me'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Access-Control-Allow-Origin': '*',
            'Authorization': 'Bearer $accesstoken',
          });
      print(response.statusCode);
      if (response.statusCode == 201) {
        var jsonRespon = await convert.jsonDecode(response.body);
        return jsonRespon['email_verificated'];
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future personalData({
    required String accesstoken,
    required String name,
    required String lastname,
    required String birthdayDate,
    required String phoneNumber,
    required String dniNumber,
  }) async {
    final userData = {
      'name': name,
      'lastname': lastname,
      'birthdayDate': birthdayDate,
      "phoneNumber": phoneNumber,
      "dniNumber": dniNumber,
    };
    try {
      final response = await http.post(
        Uri.parse('https://agile-beach-41948.herokuapp.com/user/personalData'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accesstoken',
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
          return "No Se han registrado los datos";
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future documents({
    required String accesstoken,
    required File file,
    required String filename,
  }) async {
    try {
      final uri = Uri.parse(
          'https://agile-beach-41948.herokuapp.com/user/personalData');
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll({
        'Authorization': 'Bearer $accesstoken',
        "Content-type": "multipart/form-data"
      });
      request.files.add(http.MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
        contentType: MediaType('image', 'jpeg'),
      ));
      var response = await request.send();
      var responsed = await http.Response.fromStream(response);
      final responseData = convert.json.decode(responsed.body);
      print(responseData);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
