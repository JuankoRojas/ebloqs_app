import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthUserService with ChangeNotifier {
  Uri url = Uri.parse('https://www.api.ebloqs.com/auth/register');
  Uri urlUser = Uri.parse('https://www.api.ebloqs.com/user/me');

  Future registerUser({
    required String email,
    required String name,
    required String deviceID,
    required String type_account,
  }) async {
    final userData = {
      'email': email,
      'name': name,
      'deviceID': deviceID,
      "type_account": type_account
    };
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userData),
      );
      print(response.body);
      switch (response.statusCode) {
        case 201:
          var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
          return jsonResponse;
        case 401:
          return "No pudimos autenticar tu correo";
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  Future<bool> validateEmailResult({required String accesstoken}) async {
    try {
      final response = await http.post(
          Uri.parse('https://www.api.ebloqs.com/user/me'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Access-Control-Allow-Origin': '*',
            'Authorization': 'Bearer $accesstoken',
          });
      debugPrint(response.body);

      if (response.statusCode == 201) {
        var jsonRespon = await jsonDecode(response.body);
        debugPrint(jsonRespon['id']);
        return jsonRespon['emailVerificated'];
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());

      throw Exception(e);
    }
  }

  Future personalData({
    required String accesstoken,
    required String nationality,
    required String name,
    required String lastname,
    required String birthdayDate,
    required String phoneNumber,
    required String dniNumber,
  }) async {
    final userData = {
      'nationality': nationality,
      'name': name,
      'lastname': lastname,
      'birthdayDate': birthdayDate,
      "phoneNumber": phoneNumber,
      "dniNumber": dniNumber,
    };
    try {
      final response = await http.post(
        Uri.parse('https://www.api.ebloqs.com/user/personalData'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accesstoken',
        },
        body: jsonEncode(userData),
      );
      print(response.body);
      switch (response.statusCode) {
        case 201:
          var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
          return jsonResponse;
        case 401:
          return "No Se han registrado los datos";
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future getUserInfo({required String accesstoken}) async {
    try {
      final response = await http.post(
          Uri.parse('https://www.api.ebloqs.com/user/me'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Access-Control-Allow-Origin': '*',
            'Authorization': 'Bearer $accesstoken',
          });
      debugPrint(response.body);

      if (response.statusCode == 201) {
        Map jsonRespon = await jsonDecode(response.body);
        debugPrint(jsonRespon['id']);
        return jsonRespon;
      } else {
        return {};
      }
    } catch (e) {
      debugPrint(e.toString());

      throw Exception(e);
    }
  }

// Future documents({
  //   required String accesstoken,
  //   XFile? front,
  //   XFile? rever,
  //   required String type,
  // }) async {
  //   try {
  //     final formData = FormData.fromMap({
  //       "front":
  //           await MultipartFile.fromFile(front!.path, filename: "front.jpg"),
  //       "rever":
  //           await MultipartFile.fromFile(rever!.path, filename: "rever.jpg"),
  //       "type": type,
  //     });
  //     final uri = Uri.parse('https://www.api.ebloqs.com/user/documents');
  //     final response = await Dio().post(uri.toString(),
  //         data: formData,
  //         options: Options(
  //           headers: {
  //             'Content-Type': 'multipart/form-data',
  //             'Authorization': 'Bearer $accesstoken',
  //           },
  //         ));
  //     print(response.data);
  //     switch (response.statusCode) {
  //       case 201:
  //         final jsonString = jsonEncode(response.data);
  //         var jsonResponse = jsonDecode(jsonString) as Map<String, dynamic>;
  //         return jsonResponse;
  //       case 401:
  //         return "No Se han guardado las Imágenes";
  //     }
  //   } catch (e) {
  //     print(e);
  //     throw Exception(e);
  //   }
  // }

  Future uploadFrontDocument({
    required String accesstoken,
    XFile? front,
    required String type,
  }) async {
    try {
      final formData = FormData.fromMap({
        "front":
            await MultipartFile.fromFile(front!.path, filename: "front.jpg"),
        "type": type,
      });
      final uri = Uri.parse('https://www.api.ebloqs.com/user/documents/front');
      final response = await Dio().post(uri.toString(),
          data: formData,
          options: Options(
            headers: {
              'Content-Type': 'multipart/form-data',
              'Authorization': 'Bearer $accesstoken',
            },
          ));
      print(response.data);
      switch (response.statusCode) {
        case 201:
          final jsonString = jsonEncode(response.data);
          var jsonResponse = jsonDecode(jsonString) as Map<String, dynamic>;
          return jsonResponse;
        case 401:
          return "No Se han guardado las Imágenes";
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future uploadReverseDocument({
    required String accesstoken,
    XFile? rever,
    required String type,
  }) async {
    try {
      final formData = FormData.fromMap({
        "rever":
            await MultipartFile.fromFile(rever!.path, filename: "front.jpg"),
        "type": type,
      });
      final uri = Uri.parse('https://www.api.ebloqs.com/user/documents/rever');
      final response = await Dio().post(uri.toString(),
          data: formData,
          options: Options(
            headers: {
              'Content-Type': 'multipart/form-data',
              'Authorization': 'Bearer $accesstoken',
            },
          ));
      print(response.data);
      switch (response.statusCode) {
        case 201:
          final jsonString = jsonEncode(response.data);
          var jsonResponse = jsonDecode(jsonString) as Map<String, dynamic>;
          return jsonResponse;
        case 401:
          return "No Se han guardado las Imágenes";
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
