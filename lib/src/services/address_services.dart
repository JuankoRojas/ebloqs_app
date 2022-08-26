import 'dart:convert';

import 'package:geocoding/geocoding.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class AddresServices {
  String baseUrl = '';
  Future<List<Location>> searchAddressLocations(String? searcher) async {
    List<Location> locationes = await locationFromAddress(searcher!);
    return locationes;
  }

  var listDetails = <Placemark>[];

  Future<List<Placemark>> searchAddressDetails(List<Location>? searcher) async {
    listDetails = [];
    for (var i = 0; i < searcher!.length; i++) {
      var details = await placemarkFromCoordinates(
        searcher[i].latitude,
        searcher[i].longitude,
      );
      for (var e in details) {
        listDetails.add(e);
      }
    }
    return listDetails;
  }

  Future<List<Placemark>> searchDetailsOneLocation(LatLng? searcher) async {
    listDetails = [];

    var details = await placemarkFromCoordinates(
      searcher!.latitude,
      searcher.longitude,
    );
    for (var e in details) {
      listDetails.add(e);
    }

    return listDetails;
  }
  ////TODO:Cambiar nombres a los fields

  Future<http.Response> saveNewAddress({
    required String country,
    required String city,
    required String address1,
    required String postalCode,
    required String token,
  }) async {
    try {
      var requestSaver = json.encode({
        "country": country,
        "city": city,
        "postalCode": int.parse(address1),
        "address1": address1,
        // "lat": address.location!.latitude,
        // "long": address.location!.longitude,
      });

      var url = Uri.parse('$baseUrl/user/address');
      var response = await http.post(
        url,
        body: requestSaver,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          // 'Accept': 'application/json'
        },
      );
      return response;
    } catch (err) {
      // printError(info: err.toString());
      throw Exception(err);
    }
  }

  Future<http.Response> getMyAddress({String? token}) async {
    try {
      var url = Uri.parse('$baseUrl/address');
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          // 'Accept': 'application/json'
        },
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
