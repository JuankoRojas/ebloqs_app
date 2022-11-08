import 'package:ebloqs_app/src/models/address_model.dart';
import 'package:ebloqs_app/src/services/address_services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationsProvider with ChangeNotifier {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  bool getMyLocation = false;
  LatLng addressLocation = const LatLng(0, 0);
  bool modeSearch = true;
  var addressService = AddresServices();
  var myAddressSelected = AddressModel();

  var countryController = TextEditingController();
  var cityController = TextEditingController();
  var addressController = TextEditingController();
  var postalCodeController = TextEditingController();
  var countryCode = TextEditingController();

  useMyLocation() async {
    try {
      getMyLocation = true;
      // update();
      Position position = await Geolocator.getCurrentPosition();
      addressLocation = LatLng(position.latitude, position.longitude);
      var mydetail = await addressService.searchDetailsOneLocation(
        addressLocation,
      );
      // print('detalles: $mydetail');
      countryController.text = mydetail[0].country!;
      cityController.text = mydetail[0].locality!;

      // addressController.clear();
      if (mydetail[0].locality == 'Tartagal') {
        postalCodeController.text = '4560';
      } else {
        postalCodeController.text = mydetail[0].postalCode!;
      }
      countryCode.text = mydetail[0].isoCountryCode.toString();
      myAddressSelected = AddressModel(
        country: mydetail[0].country,
        city: mydetail[0].locality,
        address: mydetail[0].street,
        codepostal: mydetail[0].postalCode,
        countryCode: mydetail[0].isoCountryCode,
        // location: addressLocation,
      );
      // countryCode = mydetail[0].isoCountryCode!;
      // modeSearch = false;
      getMyLocation = false;
      notifyListeners();

      // _add();
    } catch (e) {
      // await _geolocatorPlatform.requestPermission();
      // rethrow;
      debugPrint('error: $e');
    }
  }

  // getMyCountryCode() async {
  //   try {
  //     // getMyLocation = true;
  //     // update();
  //     Position position = await Geolocator.getCurrentPosition();
  //     addressLocation = LatLng(position.latitude, position.longitude);
  //     var mydetail = await addressService.searchDetailsOneLocation(
  //       addressLocation,
  //     );
  //     // debugPrint('detalles: ${mydetail[0].isoCountryCode}');
  //     countryCode = mydetail[0].isoCountryCode!;
  //     // debugPrint('detalles: $countryCode');
  //     // modeSearch = false;
  //     // getMyLocation = false;
  //     notifyListeners();

  //     // _add();
  //   } catch (e) {
  //     await _geolocatorPlatform.requestPermission();
  //     rethrow;
  //   }
  // }

  requestPermisionLocation() async {
    try {
      LocationPermission accepted =
          await _geolocatorPlatform.requestPermission().then((value) {
        return value;
      });

      if (accepted == LocationPermission.whileInUse ||
          accepted == LocationPermission.always) {
        useMyLocation();
        return accepted;
        // getMyCountryCode();
      }
      // debugPrint(accepted.toString());

    } catch (e) {
      print(e);
    }
  }
}
