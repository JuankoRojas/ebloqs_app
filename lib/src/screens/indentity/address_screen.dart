import 'package:after_layout/after_layout.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/global/util_size.dart';

import 'package:ebloqs_app/src/providers/locations_provider.dart';
import 'package:ebloqs_app/src/screens/indentity/id_document_screen.dart';
import 'package:ebloqs_app/src/services/address_services.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:ebloqs_app/src/widgets/custom_modal_bottom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const routeName = 'AddressScreen';
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen>
    with AfterLayoutMixin<AddressScreen> {
  final GlobalKey<FormState> _formKey12 = GlobalKey<FormState>();

  bool? isLoadLogin = false;
  // var locationProvider = LocationsProvider();
  String? errorValidation;

  // // @override
  // // void afterFirstLayout(BuildContext context) {
  // //   locationProvider.useMyLocation();
  // // }
  // @override
  // void initState() {
  //   locationProvider.requestPermisionLocation();

  //   super.initState();
  // }
  @override
  void afterFirstLayout(BuildContext context) {
    useLocation();
  }

  void useLocation() async {
    var locationProvider =
        Provider.of<LocationsProvider>(context, listen: false);
    if (locationProvider.requestPermisionLocation() !=
            LocationPermission.whileInUse ||
        locationProvider.requestPermisionLocation() !=
            LocationPermission.always) {
      await locationProvider.requestPermisionLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    var locationProvider = Provider.of<LocationsProvider>(context);
    // locationProvider.requestPermisionLocation();
    final size = MediaQuery.of(context).size;
    // debugPrint('location: ${locationProvider.countryController.text}');
    // if (locationProvider.getMyLocation == true) {
    //   return const Scaffold(
    //     body: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }
    return Consumer<LocationsProvider>(builder: (context, location, _) {
      return Scaffold(
        appBar: AppBar(
          leadingWidth: size.width * 0.1417004048583,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: systemBarDark,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.0361072902338377),
              child: SvgPicture.asset(
                'assets/Vectores/Iconos/Arrow left.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: const AutoSizeText(
            "Información personal",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff170658),
              fontSize: 17,
              fontFamily: "Archivo",
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.0288540807914262,
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: size.width * 0.0361072902338377),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/Vectores/Iconos/id.svg'),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.0384219554030875),
                          child: const AutoSizeText(
                            "Domicilio",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 13,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.0311264822134388,
                        left: size.width * 0.0361072902338377,
                        right: size.width * 0.0361072902338377),
                    child: Container(
                      width: size.width,
                      height: UtilSize.height(4, context),
                      padding: EdgeInsets.only(right: size.width * 0.4),
                      decoration: const BoxDecoration(
                          color: Color(0xffeae4fc),
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: UtilSize.height(94, context),
                        ),
                        child: Container(
                            width: size.width * 0.220953660174614,
                            height: UtilSize.height(4, context),
                            padding: EdgeInsets.only(
                                right: size.width * 0.591383372601818),
                            decoration: const BoxDecoration(
                                color: Color(0xff170658),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)))),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: size.height * 0.0281218613993974),
                    child: Form(
                        key: _formKey12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: UtilSize.height(16, context),
                                left: UtilSize.width(15, context),
                              ),
                              child: const AutoSizeText(
                                "País",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.00947386229064457,
                                  left: size.width * 0.0361072902338377,
                                  right: size.width * 0.0361072902338377),
                              child: TextFormField(
                                controller: locationProvider.countryController,
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-Z ]')),
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    setState(() {
                                      errorValidation =
                                          'Por favor,  debes completar todos los registros para continuar';
                                    });

                                    return '';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.0188140433394927,
                                  left: size.width * 0.0361072902338377),
                              child: const AutoSizeText(
                                "Ciudad",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.00947386229064457,
                                  left: size.width * 0.0361072902338377,
                                  right: size.width * 0.0361072902338377),
                              child: TextFormField(
                                controller: locationProvider.cityController,
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-Z ]')),
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    setState(() {
                                      errorValidation =
                                          'Por favor,  debes completar todos los registros para continuar';
                                    });

                                    return '';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.0188140433394927,
                                  left: size.width * 0.0361072902338377),
                              child: const AutoSizeText(
                                "Dirección de domicilio",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.00947386229064457,
                                  left: size.width * 0.0361072902338377,
                                  right: size.width * 0.0361072902338377),
                              child: TextFormField(
                                controller: locationProvider.addressController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    setState(() {
                                      errorValidation =
                                          'Por favor,  debes completar todos los registros para continuar';
                                    });

                                    return '';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.0188140433394927,
                                  left: size.width * 0.0361072902338377),
                              child: const AutoSizeText(
                                "Código Postal",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.00947386229064457,
                                  left: size.width * 0.0361072902338377,
                                  right: size.width * 0.0361072902338377),
                              child: TextFormField(
                                controller:
                                    locationProvider.postalCodeController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    setState(() {
                                      errorValidation =
                                          'Por favor,  debes completar todos los registros para continuar';
                                    });

                                    return '';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.200361901628557,
                                  left: size.width * 0.0361072902338377,
                                  right: size.width * 0.0361072902338377,
                                  bottom: size.height * 0.0557213930348259),
                              child: ButtonPrimary(
                                  width: size.width,
                                  title: 'Continuar',
                                  onPressed: () async {
                                    if (_formKey12.currentState!.validate()) {
                                      setState(() {
                                        isLoadLogin = true;
                                      });
                                      final response = await AddresServices()
                                          .saveNewAddress(
                                              country: locationProvider
                                                  .countryController.text,
                                              city: locationProvider
                                                  .cityController.text,
                                              address1: locationProvider
                                                  .addressController.text,
                                              postalCode: locationProvider
                                                  .postalCodeController.text,
                                              token: Preferences.token!);
                                      if (response.runtimeType != String) {
                                        Future.delayed(Duration.zero).then(
                                            (value) => Navigator.pushNamed(
                                                context,
                                                IdDocumentScreen.routeName));
                                        setState(() {
                                          isLoadLogin = false;
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        errorValidation =
                                            'Por favor,  debes completar todos los registros para continuar';
                                      });
                                      customModalBottomAlert(
                                          context,
                                          size,
                                          errorValidation,
                                          isLoadLogin!,
                                          '', () {
                                        Navigator.pop(context);
                                      });
                                    }
                                  },
                                  load: isLoadLogin!,
                                  disabled: isLoadLogin!),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
