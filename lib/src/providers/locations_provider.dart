// import 'package:flutter/material.dart';

// class LocationsProvider with ChangeNotifier {
//    bool getMyLocation = false;

//   useMyLocation() async {
//     try {
//       getMyLocation = true;
//       // update();
//       Position position = await Geolocator.getCurrentPosition();
//       if (position != null) {
//         addressLocation = LatLng(position.latitude, position.longitude);
//         var mydetail = await addressService.searchDetailsOneLocation(
//           addressLocation,
//         );
//         countryController.text = mydetail[0].country!;
//         cityController.text = mydetail[0].locality!;
//         addressController.clear();
//         if (mydetail[0].locality == 'Tartagal') {
//           postalCodeController.text = '4560';
//         } else {
//           postalCodeController.text = mydetail[0].postalCode!;
//         }
//         myAddressSelected = AddressModel(
//           country: mydetail[0].country,
//           city: mydetail[0].locality,
//           address: mydetail[0].street,
//           codepostal: mydetail[0].postalCode,
//           // location: addressLocation,
//         );
//         modeSearch = false;
//         getMyLocation = false;

//         // _add();
//         update();
//       }
//     } catch (e) {
//       await _geolocatorPlatform.requestPermission();
//     }
//   }

// }
